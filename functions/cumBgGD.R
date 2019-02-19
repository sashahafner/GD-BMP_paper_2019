cumBgGD <- function(
  # Main arguments
  dat,
  # Only vol and grav mix. If using man, get vol from man first and use dry = TRUE
  #dat.type = 'vol',
  temp,
  pres,
  # Only interval data
  #interval = TRUE, # When empty.name is used, there is a mix, and interval is ignored
  # Only works with widecombo
  #data.struct = 'long', # long, wide, longcombo, widecombo
  # Column names for volumetric method
  id.name = 'id',
  time.name = 'time',
  vol.name = 'vol', # Will be used for first dat column for data.struct = 'wide'
  m.pre.name,
  m.post.name,
  comp.name = 'xCH4',  # Name of column *added*
  which.mass = 'mass.vent', # Which type of mass loss to use in calculations (mass.tot, mass.vent, cmass.tot, cmass.vent)
  # Additional arguments . .  . needed?
  temp.init = NULL,
  pres.init = NULL,
  rh.resid.init = 1,
  headspace = NULL,
  vol.hs.name = 'vol.hs',
  headcomp = 'N2',
  # Calculation method and other settings
  # cmethod doesn't really apply
  #cmethod = 'removed',
  cmethod = 'vol', # vol or grav. Return warning if vol and venting mass loss is used (or leakage is present)
  imethod = 'linear',
  extrap = FALSE,
  addt0 = TRUE,
  showt0 = TRUE,
  # Additional argument for volumetric data only 
  dry = FALSE,
  empty.name = NULL, # Column name for binary/logical column for when cum vol was reset to zero
  # Warnings and messages
  std.message = TRUE,
  check = TRUE,
  # Units and standard conditions
  temp.std = getOption('temp.std', as.numeric(NA)),
  pres.std = getOption('pres.std', as.numeric(NA)),
  unit.temp = getOption('unit.temp', 'C'),
  unit.pres = getOption('unit.pres', 'atm')
){

  # Check arguments

  # Hard-wire rh for now at least
  if(!dry) {
    rh <- 1
  } else {
    rh <- 0
  }

  ## dat (volume or mass)
  #if(data.struct %in% c('long', 'longcombo')) {
  #  if(any(missing.col <- !c(id.name, time.name, dat.name) %in% names(dat))){
  #    stop('Specified columns in dat data frame (', deparse(substitute(dat)), ') not found: ', paste(c(id.name, time.name, dat.name)[missing.col], collapse = ', '), '.')
  #  } 
  #} else if(data.struct == 'wide') {
  #  if(any(missing.col <- !c(time.name, dat.name) %in% names(dat))){
  #    stop('Specified columns in dat data frame (', deparse(substitute(dat)), ') not found: ', paste(c(time.name, dat.name)[missing.col], collapse = ', '), '.')
  #  } 
  #}

  ## Check for headspace argument if it is needed
  #if(is.null(headspace) & !is.null(headcomp)) stop('Headspace correction to be applied but headspace argument is not provided.')

  ## Check for other input errors
  #if(!is.null(id.name) & id.name %in% names(dat)) {
  #  if(any(is.na(dat[, id.name]))) {
  #    w <- which(is.na(dat[, id.name]))
  #    stop('Missing values in id.name column! See rows ', paste(w, collapse = ', '), '.')
  #  }
  #}

  ### For dat (vol, etc) missing values are OK if they are cumulative (NTS: why OK if cumulative? Interpolated?)
  ### Applies to wide data
  ### But now wide data excepted totally
  ##if(!is.null(dat.name)) {
  ##  if(any(is.na(dat[, dat.name])) & interval & data.struct != 'wide') {
  ##    w <- which(is.na(dat[, dat.name]))
  ##    stop('Missing values in dat.name column! See rows ', paste(w, collapse = ', '), '.')
  ##  }
  ##}

  #if(!is.null(time.name)) {
  #  if(any(is.na(dat[, time.name]))) {
  #    w <- which(is.na(dat[, time.name]))
  #    stop('Missing values in time.name column! See rows ', paste(w, collapse = ', '), '.')
  #  }
  #}


  # Create standardized binary variable that indicates when vBg has been standardized
  standardized <- FALSE

  # Add headspace if provided
  if(!is.null(headspace)) {
    if(is.numeric(headspace)) {
     dat[, vol.hs.name] <- headspace
    } else if(is.data.frame(headspace)) {       
      # headspace needs id vol
      if(any(missing.col <- !c(id.name, vol.hs.name) %in% names(headspace))){
        stop('Columns with names matching id.name or vol.hs.name are not present in headspace data frame: ', c(id.name, vol.hs.name)[missing.col], '.')
      }
      dat <- merge(dat, headspace[ , c(id.name, vol.hs.name)], by = id.name, suffixes = c('', '.hs'))
    } else stop('headspace actual argument not recognized. What is it?')
  }

  # Add temperature and pressure to dat if single numeric values were provided
  if(!is.null(temp)) {
    if(is.numeric(temp)) {
      dat[, 'temperature'] <- temp
      temp <- 'temperature'
    } 
  }

  if(!is.null(pres)) {
    if(is.numeric(pres)) {
      dat[, 'pressure'] <- pres
      pres <- 'pressure' 
    } 
  }

  # Calculate mass loss 
  dat <- massLoss(dat, time.name = time.name, m.pre.name = m.pre.name, m.post.name = m.post.name, id.name = id.name)

  # Standardize measured biogas volume
  dat$vBg <- stdVol(dat[, vol.name], temp = dat[, temp], pres = dat[, pres], rh = rh, pres.std = pres.std, 
                    temp.std = temp.std, unit.temp = unit.temp, unit.pres = unit.pres, 
                    std.message = std.message)

  # Get biogas composition
  dat[, comp.name] <- gdComp(mass = dat[, which.massloss], vol.b = dat[, vol.name], temp = dat[, temp], 
                             pres = dat[, pres], unit.temp = unit.temp, unit.pres = unit.pres)

  # Volumetric
  # Function will work with vol and add columns
  if(tolower(cmethod) %in% c('vol', 'volume')) {
    # vol dat needs id time vol

    # Calculate interval (or cum if interval = FALSE) gas production
    dat$vCH4 <- dat[, comp.name] * dat$vBg

    # Add t0 row if requested
    # Not added if there are already zeroes present!
    if(addt0 & !class(dat[, time.name])[1] %in% c('numeric', 'integer', 'difftime')) addt0 <- FALSE
    if(addt0 & !any(dat[, time.name]==0)) {
      t0 <- data.frame(id = unique(dat[, id.name]), tt = 0, check.names = FALSE)
      names(t0) <- c(id.name, time.name)
      t0[, 'vBg'] <- t0[, 'vCH4'] <- 0
    }

    # Calculate delta t for rates
    dat <- dat[order(dat[, id.name], dat[, time.name]), ]
    if(class(dat[, time.name])[1] %in% c('numeric', 'integer', 'difftime')) {
      dt <- c(NA, diff(dat[, time.name]))
    } else if(class(dat[, time.name])[1] %in% c('POSIXct', 'POSIXlt')) {
      dt <- c(NA, as.numeric(diff(dat[, time.name]), units = 'days'))
    } else {
      dt <- NA
      warning('class of time column in dat data frame not recognized, so rates will not be calculated.')
    }
    # Set dt to NA for first observations for each reactor
    dt[c(TRUE, dat[, id.name][-1] != dat[, id.name][-nrow(dat)])] <- NA 

    ## May already have cumulative production, if so move it to cvCH4, and calculate vCH4 down below
    #if(!interval) {
    #  dat$cvBg <- dat$vBg
    #  dat$cvCH4 <- dat$vCH4
    #}
    
    # Calculate cumulative production or interval production (depending on interval argument)
    # And calculate rates
    #if(interval) {
      for(i in unique(dat[, id.name])) {
        dat[dat[, id.name]==i, 'cvBg'] <- cumsum(dat[dat[, id.name]==i, 'vBg' ])
        dat[dat[, id.name]==i, 'cvCH4'] <- cumsum(dat[dat[, id.name]==i, 'vCH4'])
      } 
    #}

    ## For cumulative results, calculate interval production from cvCH4 (down here because it may have headspace CH4 added if cmethod = total) so cannot be combined with cvCH4 calcs above
    ## vBg could be moved up, but that means more code
    #if(!interval) {
    #  for(i in unique(dat[, id.name])) {
    #    dat[dat[, id.name]==i, 'vBg'] <- diff(c(0, dat[dat[, id.name]==i, 'cvBg' ]))
    #    dat[dat[, id.name]==i, 'vCH4'] <- diff(c(0, dat[dat[, id.name]==i, 'cvCH4']))
    #  }
    #}

    # Calculate rates for all cases 
    for(i in unique(dat[, id.name])) {
      dat[dat[, id.name]==i, 'rvBg'] <- dat[dat[, id.name]==i, 'vBg' ]/dt[dat[, id.name]==i]
      dat[dat[, id.name]==i, 'rvCH4']<- dat[dat[, id.name]==i, 'vCH4' ]/dt[dat[, id.name]==i]
    }

    # Drop t0 if not requested (whether originally present or added)
    if(!showt0) {
      dat <- dat[dat[, time.name] != 0, ]
    }

    # Sort and return results
    dat <- dat[order(dat[, id.name], dat[, time.name]), ]

    if(all(is.na(dt))) {
      dat <- dat[, ! names(dat) %in% c('rvBg','rvCH4')]
    }

    # Drop NAs if they extend to the latest time for a given bottle (based on problem with AMPTSII data, sometimes shorter for some bottles)
    if(any(is.na(dat[, dat.name]))) {
      dat2 <- data.frame()
      for(i in unique(dat[, id.name])) {
        dd <- dat[dat[, id.name] == i, ]
        if(is.na(dd[nrow(dd), dat.name])) {
          # All NAs
          i1 <- which(is.na(dd[, dat.name]))

          # Look for consecutive NAs
          i1d <- diff(i1)

          # That are uninterupted by a value
          if(any(i1d > 1)) {
            i2 <- max(which(i1d > 1)) + 1 
          } else {
            i2 <- 1
          }

          i3 <- i1[i2]

          dat2 <- rbind(dat2, dd[-c(i3:nrow(dd)), ])

        } else {

          dat2 <- rbind(dat2, dd)

        }
      }

      dat <- dat2
    }

    rownames(dat) <- 1:nrow(dat)

    return(dat)

  } else if(cmethod == 'grav') {
    # Gravimetric
    # Work with mass
    message('Working with mass data (applying gravimetric approach).')

    # In this section main data frame is saved to `dat`, and name of response (mass) to `mass.name`
    dat <- dat

    # Calculate mass loss
    mass <- mass[order(mass[, id.name], mass[, time.name]), ]
    # starts data frame is binary, used to track first observation for each reactor, considered the start
    starts <- mass[, c(id.name, time.name)]
    starts$start <- FALSE
    for(i in unique(mass[, id.name])) {
      mass[mass[, id.name]==i, 'massloss'] <- c(0, -diff(mass[mass[, id.name]==i, mass.name]))
      mass[mass[, id.name]==i, 'cmassloss'] <- cumsum(mass[mass[, id.name]==i, 'massloss'])
      starts[starts[, id.name]==i, 'start'][1] <- TRUE
    }

    # Calculate biogas production
    if(any(dat[, 'massloss'] < 0)) {
      dat[whichones <- which(dat$massloss < 0), 'massloss'] <- NA
      stop('Mass *gain* calculated for one or more observations. See ', paste('id.name column:', dat[whichones, id.name], ' and time.name column:', dat[whichones - 1, time.name], 'to', dat[whichones, time.name], sep = ' ', collapse = ', '), ' in dat data frame. ')
    }

    dat[, c('vBg', 'vCH4')] <- mass2vol(mass = dat[, 'massloss'], xCH4 = dat[, comp.name], temp = dat[, temp], pres = dat[, pres], temp.std = temp.std, pres.std = pres.std, unit.temp = unit.temp, unit.pres = unit.pres, value = 'all', std.message = std.message)[, c('vBg', 'vCH4')]
    if(!is.null(headspace)) {
      # Apply initial headspace correction only for times 1 and 2 (i.e., one mass loss measurement per reactor)
      which1and2 <- sort(c(which(starts$start), which(starts$start) + 1) )
      dat[which1and2, c('vBg', 'vCH4')] <- mass2vol(mass = dat$massloss[which1and2], xCH4 = dat[which1and2, comp.name], temp = dat[which1and2, temp], pres = dat[which1and2, pres], temp.std = temp.std, pres.std = pres.std, unit.temp = unit.temp, unit.pres = unit.pres, value = 'all', headspace = dat[which1and2, vol.hs.name], headcomp = 'N2', temp.init = temp.init, std.message = FALSE)[, c('vBg', 'vCH4')]
    }
    # Set time zero volumes to zero--necessary because xCH4 is always missing
    dat[dat$massloss==0, c('vBg', 'vCH4')] <- 0

    # Cumulative gas production and rates
    dat <- dat[order(dat[, id.name], dat[, time.name]), ]
    # Calculate delta t for rates
    if(class(dat[, time.name])[1] %in% c('numeric', 'integer')) {
      dt <- c(NA, diff(dat[, time.name]))
    } else if(class(dat[, time.name])[1] %in% c('POSIXct', 'POSIXlt')) {
      dt <- c(NA, as.numeric(diff(dat[, time.name]), units = 'days'))
    } else {
      dt <- NA
      warning('time column in dat data frame not recognized, so rates will not be calculated.')
    }
    # Set dt to NA for the first observation for each reactor
    dt[c(TRUE, dat[, id.name][-1] != dat[, id.name][-nrow(dat)])] <- NA
    for(i in unique(dat[, id.name])) {
      dat[dat[, id.name]==i, 'cvBg']<- cumsum(dat[dat[, id.name]==i, 'vBg' ])
      dat[dat[, id.name]==i, 'cvCH4'] <- cumsum(dat[dat[, id.name]==i, 'vCH4'])
      dat[dat[, id.name]==i, 'rvBg']<- dat[dat[, id.name]==i, 'vBg' ]/dt[dat[, id.name]==i]
      dat[dat[, id.name]==i, 'rvCH4'] <- dat[dat[, id.name]==i, 'vCH4']/dt[dat[, id.name]==i]
    }

    # Drop time 0 or initial times, works even if time column not recognized
    if(!showt0) {
      dat <- dat[!starts$start, ]
    }

    # Sort and return results
    dat <- dat[order(dat[, id.name], dat[, time.name]), ]
    # Drop comp-related columns if comp not provided
    # With longcombo separate comp data frame is not needed, only comp.name is needed in main data frame
    if((data.struct != 'longcombo' & is.null(comp)) | (data.struct == 'longcombo' & is.null(comp.name))) {
      dat <- dat[, !names(dat) %in% c(comp.name, 'vCH4', 'cvCH4', 'rvCH4')]
    }
    rownames(dat) <- 1:nrow(dat)
    
    return(dat)
  }

}
