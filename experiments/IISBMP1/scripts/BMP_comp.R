# Table that compares GD, man, grav, vol

d <- BMP[BMP$method %in% c('vol', 'man', 'grav', 'gd03'), ]
if (any(d$time.d != 31.1)) stop('Error in BMP time BMP881')
dl <- melt(d, id.vars = c('method', 'descrip'), measure.vars = c('mean', 'sd'))
dsumm <- dcast(dl, descrip ~ method + variable)
dsumm <- rounddf(dsumm, c(0, rep(0:1, 4)))

write.csv(dsumm, '../output/BMP_comp.csv', row.names = FALSE)

d <- BMP[BMP$method %in% c('vol', 'man', 'grav', 'gd01', 'gd03', 'gd06') & BMP$time.d == 31.1, ]
dl <- melt(d, id.vars = c('method', 'descrip'), measure.vars = c('mean', 'sd'))
dsumm <- dcast(dl, descrip ~ method + variable)
dsumm <- rounddf(dsumm, c(0, rep(0:1, 4)))

write.csv(dsumm, '../output/BMP_comp_more.csv', row.names = FALSE)
