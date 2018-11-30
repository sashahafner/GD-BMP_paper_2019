# Function for calculating biogas composition from gas density

# Closed form function for xCH4

# By Jacob R. Mortensen

#Parameters:

gdComp <- function(
  temp, # Temperature in C
  pres, # Pressure of biogas in atm
  massloss, # Mass loss in reactor
  vol.b, # Volume of biogas
  vol.hs, # Volume headspace of reactor
  unit.temp = getOption('unit.temp', 'C') # Option unit for temperature
  unit.pres = getOption('unit.pres', 'atm') # Option unit for pressure
  
  # Set relative humidity
  rh <- 1
  
  # Set molar volume to 22300 mL/mol
  v.b <- 22300
  
  # set density of N2 (g/ml)
  d.N2 <- 0.0012504
  
) {
  
# Check arguments:
  
  checkArgClassValue(massloss, c('integer', 'numeric'), expected.range = c(0, Inf))
  checkArgClassValue(pres, c('integer', 'numeric')
  checkArgClassValue(temp, c('integer', 'numeric')
  checkArgClassValue(vol.hs, c('integer', 'numeric')
  checkArgClassValue(unit.temp, c('character'))
  checkArgClassValue(unit.pres, c('character'))
  
# Unit conversion

  pres.pa <- unitConvert(x = pres, unit = unit.pres, to = 'Pa')
  temp.k <- unitConvert(x = temp, unit = unit.temp, to = 'K')
  
# Calculate water vapor mass
  
  pH2O <- rh*watVap(temp.k = temp.k)
  
  mH2O <- (molMass('H2O')*pH2O)/((pres.pa - pH2O)*v.b)
  
# Calculating mass loss including N2 fraction (del.mb)

  del.mb <- massloss - (vol.hs * d.N2)
# Biogas Density calculation (d.b)
  
  d.b <- ((-del.mb) / (-vol.b - vol.hs)) - m.H2O
  
# Molarmass of biogas
  
  mm.b <- d.b * v.b
  
# Molefraction of CH4 in biogas
  
  xCH4 <- (molMass('CO2') - mm.b) / (molMass('CO2') - molMass('CH4'))
 
  
  return(xCH4) 
}