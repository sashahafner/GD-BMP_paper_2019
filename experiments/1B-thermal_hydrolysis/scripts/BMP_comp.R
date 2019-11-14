# Table that compares GD, man, grav, vol

d <- BMP[BMP$method %in% c('grav', 'gdt', 'gdv'), ]
#if (any(round(d$time.d, 1) != 20.9)) stop('Error in BMP time BMP881')
dl <- melt(d, id.vars = c('method', 'descrip'), measure.vars = c('mean', 'sd'))
BMP.comp <- dcast(dl, descrip ~ method + variable)
BMP.comp <- rounddf(BMP.comp, c(0, rep(0:1, 3)))

BMP <- as.data.frame(mutate(group_by(BMP, descrip), rerr = 100 * (1 - mean/mean[method == 'grav'])))
BMP$lwr <- BMP$mean - BMP$sd
BMP$upr <- BMP$mean + BMP$sd


