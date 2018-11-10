# Calculates TIC in digestate
# S. Hafner
# 15 Nov 2016

library(gdata)

source('slurry_functions.R')

d <- read.xls('../data/digestate_tic.xlsx', skip = 1)
d

d$tic <- tic(smass = d$smass, avol = d$avol, hvol = 116 - d$smass - d$avol, 
             pres = d$pres, tempc = 21.69, dm = 0, unit.pres = 'kPa',
             pres.atm = 101.325)

# Calculate CaCO3 alkalinity
# Assumes bicarbonate alkalinity = TIC
d$alk <- d$tic/2*100

write.csv(d, '../output/digestate_alk.csv', row.names = FALSE)
