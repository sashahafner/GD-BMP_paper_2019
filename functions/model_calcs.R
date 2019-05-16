# Model predictions and objectives

FO1pCalc <- function(t, B, k, t.shift = 0, y.shift = 0) {

  y <- B * (1 - exp(-k * (t - t.shift))) + y.shift
  y[(t - t.shift) < 0] <- NA

  return(y)

  #if (fit.to == 'yield') return(y)

  ## Otherwise, return rates
  #r <- c(0, diff(y)/diff(t))
  #return(r)
}




FO1pObj <- function(x, t, y, fit.to = 'yield', t.shift = 0, y.shift = 0, SS = TRUE, trans = FALSE, resids = FALSE) {

  B <- x[1]
  k <- x[2]

  if (trans) {
    k <- 10^k
  }

  pred <- FO1pCalc(t = t, B = B, k = k, t.shift = t.shift, y.shift = y.shift)

  if (fit.to == 'rate') {
    pred <- diff(pred)/diff(t)
    y <- diff(y)/diff(t)
    # NOTE: Why is this below necessary? 
    t <- t[-1]
    rs <- pred - y
    rs[(t - t.shift) <= 0] <- 0
  } else {
    rs <- pred - y
    rs[(t - t.shift) < 0] <- 0
  }

  # What is going on here? and where are {}? (we don't see an 'else' for this 'if')
  if (resids) return(rs)

  # Use sum of squares for objective as default
  # Values below t.shift have no weight
  if (SS) return(sum((rs^2)[(t - t.shift) >= 0]))

  # Otherwise sum of absolute errors
  return(sum(abs(rs)[(t - t.shift) >= 0]))
}




FO2pCalc <- function(t, B, f, k1, k2, t.shift = 0, y.shift = 0) {
  y <- B * (1 - f * exp(-k1 * (t - t.shift)) - (1 - f)  * exp(-k2 * (t - t.shift))) + y.shift
  y[(t - t.shift) < 0] <- NA

  return(y)

  #if (fit.to == 'yield') return(y)

  ## Otherwise, return rates
  #r <- c(0, diff(y)/diff(t))
  #return(r)
}




FO2pObj <- function(x, t, y, fit.to = 'yield', t.shift = 0, y.shift = 0, SS = TRUE, trans = FALSE, resids = FALSE) {

  B <- x[1]
  f <- x[2]
  k1 <- x[3]
  k2 <- x[4]

  if (trans) {
    f <- logistic(f)
    k1 <- 10^k1
    k2 <- 10^k2
  }

  pred <- FO2pCalc(t = t, B = B, f = f, k1 = k1, k2 = k2, t.shift = t.shift, y.shift = y.shift)

  if (fit.to == 'rate') {
    pred <- diff(pred)/diff(t)
    y <- diff(y)/diff(t)
    t <- t[-1]
    rs <- pred - y
    rs[(t - t.shift) <= 0] <- 0
  } else {
    rs <- pred - y
    rs[(t - t.shift) < 0] <- 0
  }
  
  if (resids) return(rs)

  # Use sum of squares for objective as default
  # Values below t.shift have no weight
  if (SS) return(sum((rs^2)[(t - t.shift) >= 0]))

  # Otherwise sum of absolute errors
  return(sum(abs(rs)[(t - t.shift) >= 0]))
}





fitFOM <- function(dat, n.pool = 1, 
                   time.name = 'time.d', resp.name = 'cvCH4',
                   fit.to = 'yield', method = 'LM', abs.err = FALSE, trans = FALSE,
                   init, lower = NULL, upper = NULL,
                   lag.phase = FALSE) {

  t <- dat[, time.name]
  y <- dat[, resp.name]
  r <- c(0, diff(y)/diff(t))

  if (lag.phase) {
    l <- max(1, which.max(r) - 1)
    t.shift <- t[l]
    y.shift <- y[l]
  } else {
    t.shift <- 0
    y.shift <- 0
  }

  # Transform init etc.
  if (trans) {
    if (is.null(lower) | is.null(upper)) {
      if (n.pool == 1) {
        init['k'] <- log10(init['k'])
      } else {
        init['k1'] <- log10(init['k1'])
        init['k2'] <- log10(init['k2'])
        init['f'] <- logistic(init['f'])
      }
    } else {
      if (n.pool == 1) {
        lower['k'] <- log10(lower['k'])
        upper['k'] <- log10(upper['k'])
      } else {
        lower['k1'] <- log10(lower['k1'])
        lower['k2'] <- log10(lower['k2'])
        lower['f'] <- logistic(lower['f'])

        upper['k1'] <- log10(upper['k1'])
        upper['k2'] <- log10(upper['k2'])
        upper['f'] <- logistic(upper['f'])
      }
    }
  }

  if (method == 'LM') {

    if (n.pool == 1) {

      mod <- nls.lm(par = init, 
                    fn = FO1pObj, 
                    resids = TRUE,
                    t = t, y = y, t.shift = t.shift, y.shift = y.shift, SS = !abs.err,
                    fit.to = fit.to, 
                    trans = trans)

      coef.tab <- summary(mod)$coefficients

    } else if (n.pool == 2) {

      mod <- nls.lm(par = init, 
                    fn = FO2pObj, 
                    resids = TRUE,
                    t = t, y = y, t.shift = t.shift, y.shift = y.shift, SS = !abs.err,
                    fit.to = fit.to, 
                    trans = trans)

      coef.tab <- summary(mod)$coefficients
 
    } else { # With parameter transformation
      stop('n.pool must be 1 or 2 but is ', n.pool, '.')
    }

    converge <- (mod$info == 1 || mod$info == 2 || mod$info == 3)
    converge.mssg <- mod$message

  } else if (method %in% c('Nelder-Mead', 'BFGS', 'CG', 'L-BFGS-B', 'SANN', 'Brent')) {

    if (is.null(lower)) lower <- -Inf 
    if (is.null(upper)) upper <- Inf

    if (n.pool == 1) {

      mod <- optim(par = init, fn = FO1pObj, resids = FALSE,
                   t = t, y = y, t.shift = t.shift, y.shift = y.shift, SS = !abs.err,
                   fit.to = fit.to, 
                   trans = trans,
                   method = method,
                   lower = lower,
                   upper = upper)
      coef.tab <- data.frame(Estimate = mod$par)

    } else if (n.pool == 2) {

      mod <- optim(par = init, fn = FO2pObj, resids = FALSE,
                   t = t, y = y, t.shift = t.shift, y.shift = y.shift, SS = !abs.err,
                   fit.to = fit.to, 
                   trans = trans,
                   method = method,
                   lower = lower,
                   upper = upper)
      coef.tab <- data.frame(Estimate = mod$par)

    } else {
      stop('n.pool must be 1 or 2 but is ', n.pool, '.')
    }

    converge <- mod$convergence == 0
    converge.mssg <- mod$convergence

  }


  # Model predictions
  if (n.pool == 1) {
    B <- coef.tab[1, 1]
    k <- coef.tab[2, 1]
    if (trans) k <- 10^k
    coefs <- c(B = B, k = k)
    preds <- data.frame(t = t, y = FO1pCalc(t = t, B = B, k = k,
                                            t.shift = t.shift, y.shift = y.shift))
  } else {
    B <- coef.tab[1, 1]
    f <- coef.tab[2, 1]
    k1 <- coef.tab[3, 1]
    k2 <- coef.tab[4, 1]
    if (trans) {
      f <- logistic(f)
      k1 <- 10^k1
      k2 <- 10^k2
    }
    coefs <- c(B = B, f = f, k1 = k1, k2 = k2)
    preds <- data.frame(t = t, y = FO2pCalc(t = t, B = B, f = f, k1 = k1, k2 = k2,
                                            t.shift = t.shift, y.shift = y.shift))
  }
  i.eval <- (t - t.shift) >= 0
  if (fit.to == 'rate') {
    preds$r <- c(NA, diff(preds$y)/diff(preds$t))
    pred <- preds[, 3]
    resid <- pred - r
    names(preds) <- c(time.name, resp.name, 'rate')
    ME <- me(r[i.eval][-1], pred[i.eval][-1])
    RMSE <- rmse(r[i.eval][-1], pred[i.eval][-1])
    MAE <- mae(r[i.eval][-1], pred[i.eval][-1])
    fit <- c(ME = ME, RMSE = RMSE, MAE = MAE)
  } else {
    pred <- preds[, 2]
    resid <- pred - y
    names(preds) <- c(time.name, resp.name)
    ME <- me(y[i.eval], pred[i.eval])
    RMSE <- rmse(y[i.eval], pred[i.eval])
    MAE <- mae(y[i.eval], pred[i.eval])
    fit <- c(ME = ME, RMSE = RMSE, MAE = MAE)
  }

  

  return(list(model = mod, coefs = coefs, coef.tab = coef.tab, preds = preds, 
              pred = pred, fit = fit, resid = resid,
              converge = converge, converge.mssg = converge.mssg))

}
