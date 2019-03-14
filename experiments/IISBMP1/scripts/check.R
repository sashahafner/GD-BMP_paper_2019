
# Load functions
source('functions.R')

# Load packages
source('packages.R')

args(gdComp)
debug(gdComp)
m <- 822.9-822.8
gdComp(m, 97, 30, 150, unit.temp = getOption("unit.temp", "C"), 
       unit.pres = getOption("unit.pres", "kPa"), fill.value = NA) 


A1 <- subset(cbg.all, id.exper == 'A1-E2' & date == '06022017')
write.csv(A1[, c('id.exper', 'elapsed.time', 'method', 'xCH4')], '../output/A1xCH4.csv', row.names = FALSE)
C1 <- subset(cbg.all, id.exper == 'C1-E2' & date == '17022017')
write.csv(C1[, c('id.exper', 'elapsed.time', 'method', 'xCH4')], '../output/C1xCH4.csv', row.names = FALSE)

# C1-E2, 17023027
m <- 1034.30-1034.1
gdComp(0.2, 140, 30, 1.480385, unit.temp = getOption("unit.temp", "C", getOption('unit.pres', 'atm')))
       