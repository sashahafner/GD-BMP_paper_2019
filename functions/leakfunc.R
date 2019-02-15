# Function for biogas leakage
# Camilla G. Justesen
# 15.02.2019

# What is the data frame? An example could be 'biogas' or 'cumBg-output' = 'cbg.method'
# The form should be on the same form as cumBg()


leakBg <- function(
  # Main arguments 
  dat,           # Data frame
  time.name,     # Name of time column
  m.init.name,   # Name of column holding the mass before venting 
  m.final.name,  # Name of column holding the mass after venting 
  #id.name        # Name of id to group by 
  ) {
  
  # Main calculations~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  # Calculate the interval
  dat$interval = dat[ , 1:length(time.name)] - dat[ , 1]
  
  # Calculation of mass loss by venting
  dat$mass.vent <- dat[ , m.final.name] - dat[ , m.init.name]

  # Calculation of mass loss leakage
  dat$mass.loss <- mass.final(n-1) - mass.init(n) 
  # NB define n somewhere in constants
  
  # Calculation of total mass loss by venting and leakage
  dat$mass.loss.tot <- mass.loss + mass.vent
  
  # Calculation of cummulative mass loss due to leakage and by venting
  cumVent <- cumsum(mass.vent)
  cumLeakage <- cumsum(mass.loss)
  cumTotLoss <- cumsum(mass.loss.tot)

  # -------------
  leak.int <- bg[order(bg$id, bg$ctime), 
                 c('exper', 'id', 'date', 'time', 'date.time', 'ctime', 'mass.init', 'mass.final', 
                   'massloss', 'cmassloss', 'pres', 
                   'vCH4.v', 'cvCH4.v', 'vBg.v', 'cvBg.v',   
                   'vCH4.p', 'cvCH4.p', 'vBg.p', 'cvBg.p',  
                   'vCH4.m', 'cvCH4.m', 'vBg.m', 'cvBg.m')]
  
    
  # Also needs calculation of leakage in volume units - also in pressure?
  # For adding the volumetric leakage eventually look at the unit conversion, standardize total gas volumes, etc. also, from cumBg.R
  
 
  return(dat) 
}
