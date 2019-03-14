
# REmember to restart before calcaulating the gdComp() call as IIsBMP1 uses bar in biogas call which overwrite the kPa!!!!

# Load functions
source('functions.R')
# Load packages
source('packages.R')

# Check function
args(gdComp)
debug(gdComp)

# A1-E2, 06022017
vol.no.correction <- 97
temp <- 30
pres <- 150
vol <- stdVol(vol.no.correction, temp, pres, rh = 1, 
        temp.std = getOption("temp.std", as.numeric(NA)), 
        pres.std = getOption("pres.std", as.numeric(NA)), 
        unit.temp = getOption("unit.temp", "C"), 
        unit.pres = getOption("unit.pres", "kPa"), std.message = TRUE, warn = TRUE) 

m <- 822.9-822.8
gdComp(m, vol, temp, pres, unit.temp = getOption("unit.temp", "C"), 
       unit.pres = getOption("unit.pres", "kPa"), fill.value = NA)

# C1-E2, 17022017
vol.no.correction <- 140
temp <- 30
pres <- 150
vol <- stdVol(vol.no.correction, temp, pres, rh = 1, 
              temp.std = getOption("temp.std", as.numeric(NA)), 
              pres.std = getOption("pres.std", as.numeric(NA)), 
              unit.temp = getOption("unit.temp", "C"), 
              unit.pres = getOption("unit.pres", "kPa"), std.message = TRUE, warn = TRUE) 
m <- 1034.30-1034.1
gdComp(0.2, vol, temp, pres, unit.temp = getOption("unit.temp", "C"), unit.pres = getOption("unit.pres", "kPa"))

#molMass('CH4')

# Problem with defining m by m.init-m.final -> 0.200000000000045???
l <- 0.2
n <- 0.2
l==n
l==m

# Write tables for two examples with methane composition for grav.GC and gd01-gd12 
# Remember to load main first
A1 <- subset(cbg.all, id.exper == 'A1-E2' & date == '06022017')
write.csv(A1[, c('id.exper', 'elapsed.time', 'method', 'xCH4')], '../output/A1xCH4.csv', row.names = FALSE)
C1 <- subset(cbg.all, id.exper == 'C1-E2' & date == '17022017')
write.csv(C1[, c('id.exper', 'elapsed.time', 'method', 'xCH4')], '../output/C1xCH4.csv', row.names = FALSE)

