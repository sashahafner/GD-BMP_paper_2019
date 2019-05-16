# Load yield data

y1 <- read.csv('../../IISBMP1/output/yldo.csv')
yth <- read.csv('../../thermal hydrolysis/output/yldo.csv')
yuqgd <- read.csv('../../UQ2/gd/output/yldo.csv')
yuqmg <- read.csv('../../UQ2/man_grav/output/yldo.csv')

y1$exper <- 'IISBMP1'
yth$exper <- 'TH'
yuqgd$exper <- 'UQ2'
yuqmg$exper <- 'UQ2'

yldo <- rbindf(y1, yth, yuqgd, yuqmg)
