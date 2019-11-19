# Load yield data

y1 <- read.csv('../../1A-IISBMP1/output/yldo.csv')
yth <- read.csv('../../1B-thermal_hydrolysis/output/yldo.csv')
yuqgd <- read.csv('../../2-UQ2/gd/output/yldo.csv')
yuqmg <- read.csv('../../2-UQ2/man_grav/output/yldo.csv')

y1$exper <- '1A'
yth$exper <- '1B'
yuqgd$exper <- '2'
yuqmg$exper <- '2'

yldo <- rbindf(y1, yth, yuqgd, yuqmg)
