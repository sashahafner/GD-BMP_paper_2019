#

yldo$exper.id <- paste0(yldo$exper, '-', yldo$id)

fit <- list()
pars <- data.frame()

init <- c(B = 400, k = 0.5)

for(i in unique(yldo$exper.id)) {

  dd <- yldo[yldo$exper.id == i, ]
  fit[[i]] <- list()

  for(j in unique(dd$method)) {

    ddd <- dd[dd$method == j, ]
plot(cvCH4 ~ time.d, data = ddd)

    fit[[i]][[j]] <- ff <-  fitFOM(ddd, n.pool = 1, fit.to = 'rate',
                       method = 'LM', abs.err = FALSE,
                       trans = TRUE, lag.phase = TRUE,
                       init = init)

    pp <- data.frame(exper = ddd$exper[1], descrip = ddd$descrip[1], id = ddd$id[1], method = ddd$method[1], B = ff$coefs[1], k = ff$coefs[2], ME = ff$fit['ME'])
    pars <- rbind(pars, pp)

  }

}
