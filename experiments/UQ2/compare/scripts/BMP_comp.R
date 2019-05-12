# Table that compares GD, man, grav, vol

d <- BMP
if (any(round(d$time.d, 1) != 27.1)) stop('Error in BMP time BMP881')
dl <- melt(d, id.vars = c('method', 'descrip'), measure.vars = c('mean', 'sd'))
BMP.comp <- dcast(dl, descrip ~ method + variable)
BMP.comp <- rounddf(BMP.comp, c(0, rep(0:1, 5)))

BMP <- mutate(group_by(BMP, descrip), rerr = 100 * (1 - mean/mean[method == 'grav']))

