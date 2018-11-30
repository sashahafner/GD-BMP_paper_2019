# Function for calculating biogas composition from gas density

# Closed form function for xCH4

# By Jacob R. Mortensen

#Parameters:

gdComp <- function(
  temp, # Temperature in K
  pres, # Pressure of biogas in KPa
  massloss, # Mass loss in reactor
  vol.b, # Volume of biogas
  vol.hs, # Volume headspace of reactor
  unit.temp = getOption('unit.temp', 'C') # Option unit for temperature
  unit.pres = getOption('unit.pres', 'atm') # Option unit for pressure
  
) {
  
# Check arguments:
  
  checkArgClassValue(massloss, c('integer', 'numeric'), expected.range = c(0, Inf))
  checkArgClassValue(pres, c('integer', 'numeric')
  checkArgClassValue(temp, c('integer', 'numeric')
  checkArgClassValue(vol.hs, c('integer', 'numeric')
  
# Unit conversion

  pres.pa <- unitConvert(x = pres, unit = unit.pres, to = 'kPa')
  temp.k <- unitConvert(x = temp, unit = unit.temp, to = 'K')
  
# Calculate water vapor mass
  
# Biogas Density calculation
  
# Molefraction of CH4 in biogas