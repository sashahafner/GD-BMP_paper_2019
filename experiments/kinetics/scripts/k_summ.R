# Summary table

psumm <- as.data.frame(summarise(group_by(pars, exper, descrip, method), 
                                 B.mn = mean(B), B.sd = sd(B), k.mn = mean(k), k.sd = sd(k),
                                 B.lwr = B.mn - B.sd, B.upr = B.mn + B.sd, 
                                 k.lwr = k.mn - k.sd, k.upr = k.mn + k.sd 
                                 ))
d <- subset(psumm, method %in% c('grav', 'vol', 'gdt', 'gdv'))
dl <- melt(d, id.vars = c('exper', 'method', 'descrip'), measure.vars = c('k.mn', 'k.sd'))
k.comp <- dcast(dl, exper + descrip ~ method + variable)
k.comp <- rounddf(k.comp, c(0, 0, rep(2:3, 5)))
