# Table that compares GD, man, grav, vol

d <- BMP[BMP$method %in% c('grav', 'gdt', 'gdv'), ]
if (any(round(d$time.d, 1) != 20.9)) stop('Error in BMP time BMP881')
dl <- melt(d, id.vars = c('method', 'descrip'), measure.vars = c('mean', 'sd'))
dsumm <- dcast(dl, descrip ~ method + variable)
dsumm <- rounddf(dsumm, c(0, rep(0:1, 3)))

write.csv(dsumm, '../output/BMP_comp.csv', row.names = FALSE)

d <- BMP
