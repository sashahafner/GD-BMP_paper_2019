# Quantify leaks

leak.int <- bg[order(bg$id, bg$ctime), 
               c('exper', 'id', 'date', 'time', 'date.time', 'ctime', 'mass.init', 'mass.final', 
                 'massloss', 'cmassloss', 'pres', 
                 'vCH4.v', 'cvCH4.v', 'vBg.v', 'cvBg.v',   
                 'vCH4.p', 'cvCH4.p', 'vBg.p', 'cvBg.p',  
                 'vCH4.m', 'cvCH4.m', 'vBg.m', 'cvBg.m')]

# Use only experiment 2
leak.int <- leak.int[leak.int$exper == 2, ]

leak.int <- merge(setup[, c('exper', 'id', 'vol.hs')], leak.int, by = c('exper', 'id'))

# Estimated headspace pressure
leak.int$pres.est <- 310/273*101.325*leak.int$vBg.m/leak.int$vol.hs

# Volumetric error
leak.int$err.v <- leak.int$vCH4.m - leak.int$vCH4.v

leak.int <- leak.int[order(leak.int$id, leak.int$ctime), ]
leak.int <- ddply(leak.int, c('exper', 'id'), transform, 
                  interval = 1:length(ctime) - 1,
                  dtime = c(NA, diff(ctime)),
                  leak.m = c(NA, mass.final[-length(mass.final)] - mass.init[-1]), 
                  pres = 100*pres)

leak.tot <- ddply(leak.int, c('exper', 'id'), summarise, 
                  ct = max(ctime),
                  intervals = max(interval),
                  cvBg.m = cvBg.m[ctime == max(ctime)],
                  cvCH4.m = cvCH4.m[ctime == max(ctime)],
                  cvBg.v = cvBg.v[ctime == max(ctime)],
                  cvCH4.v = cvCH4.v[ctime == max(ctime)],
                  err.v = max(na.omit(cvCH4.m)) - max(na.omit(cvCH4.v)),
                  rel.err.v = 100*(max(na.omit(cvCH4.m)) - max(na.omit(cvCH4.v)))/max(cvCH4.m),
                  max.pres = max(na.omit(pres.est)),
                  mass.loss.tot = cmassloss[ctime == max(ctime)],
                  max.mass.loss = max(massloss),
                  leak.m.tot = sum(na.omit(leak.m)),
                  max.leak.m = max(na.omit(leak.m))
)


leak.tot$pct.leak <- 100*leak.tot$leak.m.tot/leak.tot$mass.loss.tot
leak.tot$vCH4.leak <- leak.tot$pct.leak/100*leak.tot$cvCH4.v/(1 - leak.tot$pct.leak/100)
leak.tot$vBg.leak <- leak.tot$pct.leak/100*leak.tot$cvBg.v/(1 - leak.tot$pct.leak/100)

leak.tot$detect <- 0
leak.tot$detect[leak.tot$leak.m.tot > 0.37] <- 1

# Water controls
wat.int <- watmass[watmass$exper == 2, ]
wat.int$date <- dmy(wat.int$date)
wat.int <- wat.int[order(wat.int$exper, wat.int$id, wat.int$date), ]
wat.int <- ddply(wat.int, c('exper', 'id'), transform, mass.change = c(NA, diff(mass.init)))

wat.tot <- ddply(wat.int, c('exper', 'id'), summarise,
                 mass.loss.tot = mass.init[date == min(date)] - mass.init[date == max(date)]
)

