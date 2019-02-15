# Function for biogas leakage
# Camilla G. Justesen
# 15.02.2019

leakBg <- function(
  # Main arguments 
  dat,           # Data frame
  time.name,     # Name of time column
  m.init.name,   # Name of column holding the mass before venting 
  m.final.name   # Name of column holding the mass after venting 
  #id.name        # Name of id to group by 
  ) {
  
  # Main calculations~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  # Calculate the interval
    dat$interval = dat[, time.name] - lag(dat[, time.name])
  
  # Calculation of mass loss by venting
    dat$mass.vent <- dat[ , m.init.name] - dat[ , m.final.name]
  
  # Calculation of mass loss leakage
    dat$mass.leak <- c(0, dat[-nrow(dat), m.final.name] - dat[-1, m.init.name])
    
# change to leakage 
  # Calculation of total mass loss by venting and leakage
    dat$mass.loss.tot <- c(0, -diff(dat[, m.final.name]))

  # Calculation of cummulative mass loss due to leakage and by venting
    dat$cum.vent <- cumsum(dat$mass.vent)
    dat$cum.leak <- cumsum(dat$mass.leak)
    dat$cum.tot.loss <- cumsum(dat$mass.loss.tot)


  # Also needs calculation of leakage in volume units - also in pressure?
  # For adding the volumetric leakage eventually look at the unit conversion, standardize total gas volumes, etc. also, from cumBg.R

  return(dat)
}
