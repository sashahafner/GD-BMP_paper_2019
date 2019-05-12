# Table that compares GD, man, grav, vol

d <- BMP[BMP$method %in% c('vol', 'man', 'grav', 'gdt'), ]
if (any(d$time.d != 31.1)) stop('Error in BMP time BMP881')
dl <- melt(d, id.vars = c('method', 'descrip'), measure.vars = c('mean', 'sd'))
BMP.comp <- dcast(dl, descrip ~ method + variable)
BMP.comp <- rounddf(BMP.comp, c(0, rep(0:1, 4)))

d <- BMP[BMP$method %in% c('vol', 'man', 'grav', 'gdi', 'gdt', 'gdv'), ]
if (any(d$time.d != 31.1)) stop('Error in BMP time BMP881')
dl <- melt(d, id.vars = c('method', 'descrip'), measure.vars = c('mean', 'sd'))
BMP.comp.all <- dcast(dl, descrip ~ method + variable)
BMP.comp.all <- rounddf(BMP.comp.all, c(0, rep(0:1, 6)))

BMP <- as.data.frame(mutate(group_by(BMP, descrip), rerr = 100 * (1 - mean/mean[method == 'grav'])))
BMP$lwr <- BMP$mean - BMP$sd
BMP$upr <- BMP$mean + BMP$sd


