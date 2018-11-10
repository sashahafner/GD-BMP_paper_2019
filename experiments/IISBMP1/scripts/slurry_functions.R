# Functions for calculating TIC and ...
# S. Hafner
# 25 June 2016

# Calculates TIC concentration from acidification/pressure method
tic <- function(
  smass, 
  avol, 
  hvol, 
  pres, 
  tempc = 20, 
  dm = 0, 
  unit.pres = 'kPa', 
  pres.atm = 101325, 
  rh = 1) {

  # Convert pressure to Pa
  if(unit.pres == "kPa") {
    pres <- pres*1000
  } else if(unit.pres == "hPa") {
    pres <- pres*100
  } else if(unit.pres == "atm") {
    pres <- pres*101325
  } else if(unit.pres != "Pa") {
    stop("unit.pres (", unit.pres, ") not recognized, options are \"atm\", \"kPa\", \"hPa\", or \"Pa\"")
  }
 
  tempk <- 273.15 + tempc

  # Sample water (g) or total sample mass if dm is set to 0
  sh2o <- smass*(1-dm)

  # Henry's law constant (ref?, units??)
  kh<- 10^(108.38578 +0.01985076*tempk - 6919.53/tempk - 40.45154*log10(tempk) + 669365/tempk^2)

  # Water vapor pressure (see watVap() in biogas package)
  ###p.h2o <- rh*10^(5.08600 - 1668.21/(tempc + 228.0))
  p.h2o <- 10^(11.20963 - 2354.731/(tempc + 273.15 + 7.559))

  # Additional air pressure from acid
  p.acid <- avol/hvol*pres.atm

  # Pressure from CO2 addition
  p.co2 <- pres - p.h2o - p.acid

  # Total CO2 present (moles)
  m.co2.g <- p.co2/101325*hvol/1000/(22.263*tempk/273.15)
  m.co2.a <- p.co2/101325*kh*(sh2o + avol)/1000
  m.co2 <- m.co2.g + m.co2.a

  # Original TIC concentration
  c.tic <- m.co2/(sh2o/1000)
  return(c.tic) 
  
}
