# Quantify leaks

leak.int <- bg[order(bg$id, bg$ctime), 
               c('exper', 'id', 'date', 'time', 'date.time', 'ctime', 'mass.init', 'mass.final', 
                 'massloss', 'pres', 
                 'vCH4.v', 'cvCH4.v', 'vBg.v', 'cvBg.v',   
                 'vCH4.p', 'cvCH4.p', 'vBg.p', 'cvBg.p',  
                 'vCH4.m', 'cvCH4.m', 'vBg.m', 'cvBg.m')]
# Drop IDs with problems (missing volumes for As, Bs exploded
#leak.int <- leak.int[leak.int$exper != 1 | !leak.int$id %in% c('B1', 'B2', 'B3', 'A1', 'A2', 'A3'), ]
leak.int <- leak.int[leak.int$exper == 2, ]
leak.int$err.v <- leak.int$vCH4.m - leak.int$vCH4.v
leak.int <- ddply(leak.int, c('exper', 'id'), transform, 
                  interval = 1:length(ctime),
                  dtime = c(NA, diff(ctime)),
                  leak.m = c(NA, mass.final[-length(mass.final)] - mass.init[-1]), 
                  pres = pres)
leak.int$pres.est <- 101.325*leak.int$vBg.m/600 + 101.325

leak.tot <- ddply(leak.int, c('exper', 'id'), summarise, 
               leak.m.tot = sum(na.omit(leak.m)),
               mass.loss.tot = mass.final[ctime == min(ctime)] - mass.final[ctime == max(ctime)],
               err.v = max(na.omit(cvCH4.m)) - max(na.omit(cvCH4.v)),
               err.p = max(na.omit(cvCH4.m)) - max(na.omit(cvCH4.p)),
               rel.err.v = 100*(max(na.omit(cvCH4.m)) - max(na.omit(cvCH4.v)))/max(cvCH4.m),
               rel.err.p = 100*(max(na.omit(cvCH4.m)) - max(na.omit(cvCH4.p)))/max(cvCH4.m),
               max.leak.m = max(na.omit(leak.m)),
               max.pres = max(na.omit(pres)),
               cvBg.m = max(cvBg.m),
               cvCH4.m = max(cvCH4.m)
               )

leak.tot$detect <- 0
leak.tot$detect[leak.tot$leak.m.tot > 0.1] <- 1

leak.tot$pct.leak <- 100*leak.tot$leak.m.tot/leak.tot$mass.loss.tot
leak.tot$vCH4.leak <- leak.tot$pct.leak/100*leak.tot$cvCH4.m
leak.tot$vBg.leak <- leak.tot$pct.leak/100*leak.tot$cvBg.m

# Water controls
wat.int <- watmass[watmass$exper == 2, ]
wat.int$date <- dmy(wat.int$date)
wat.int <- wat.int[order(wat.int$exper, wat.int$id, wat.int$date), ]
wat.int <- ddply(wat.int, c('exper', 'id'), transform, mass.change = c(NA, diff(mass.init)))

wat.tot <- ddply(wat.int, c('exper', 'id'), summarise,
                 mass.loss.tot = mass.init[date == min(date)] - mass.init[date == max(date)]
                 )
wat.tot

# Find cutoff
max(na.omit(wat.int$mass.change))
min(na.omit(wat.int$mass.change))
sd(na.omit(wat.int$mass.change))
3*sd(na.omit(wat.int$mass.change))

# Summary info
range(na.omit(leak.int$leak.m))
sum(na.omit(leak.int$leak.m) == 0)
sum(na.omit(leak.int$leak.m) < 0)
mean(na.omit(leak.int$leak.m) == 0)

range(na.omit(leak.tot$leak.m))
sum(leak.tot$leak.m.tot == 0)
mean(leak.tot$leak.m.tot == 0)
t.test(leak.tot$leak.m.tot)

write.csv(leak.tot, '../output/leak_tot.csv', row.names = FALSE)

leak.tot.detect <- subset(leak.tot, detect == 1)
dfsumm(leak.tot)
dfsumm(leak.tot.detect)
range(leak.tot.detect$vBg.leak)

mod <- lm(leak.m ~ pres.est + interval + dtime + id, data = leak.int)
summary(mod)
coef(mod)
anova(mod)

mod <- lm(leak.m ~ interval + dtime + id, data = leak.int)
summary(mod)
coef(mod)
anova(mod)
