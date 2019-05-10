# Table that compares GD, man, grav, vol

d <- BMP[BMP$method %in% c('vol', 'man', 'grav', 'gdt'), ]
if (any(d$time.d != 31.1)) stop('Error in BMP time BMP881')
dl <- melt(d, id.vars = c('method', 'descrip'), measure.vars = c('mean', 'sd'))
dsumm <- dcast(dl, descrip ~ method + variable)
dsumm <- rounddf(dsumm, c(0, rep(0:1, 4)))

write.csv(dsumm, '../output/BMP_comp.csv', row.names = FALSE)

d <- BMP[BMP$method %in% c('vol', 'man', 'grav', 'gdi', 'gdt', 'gdv'), ]
if (any(d$time.d != 31.1)) stop('Error in BMP time BMP881')
dl <- melt(d, id.vars = c('method', 'descrip'), measure.vars = c('mean', 'sd'))
dsumm <- dcast(dl, descrip ~ method + variable)
dsumm <- rounddf(dsumm, c(0, rep(0:1, 6)))

write.csv(dsumm, '../output/BMP_comp_more.csv', row.names = FALSE)
