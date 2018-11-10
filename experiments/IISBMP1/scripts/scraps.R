png('../plots/ggd.png', height = 900, width = 900, pointsize = 15)
plot(cvCH4.v ~ cvCH4.m, data = subset(g2dat, !is.na(cvCH4.ggd)))
points(cvCH4.ggd ~ cvCH4.m, data = subset(g2dat, !is.na(cvCH4.ggd)), col = 'red')
#points(cvCH4.ggd ~ cvCH4.m, data = subset(g2dat, xCH4.ggd < 0.5 | xCH4.ggd > 0.9), col = 'black', pch = 19)
abline(0, 1)
abline(0, 1.1)
abline(0, 0.9)
text(g2dat$cvCH4.m, g2dat$cvCH4.ggd, g2dat$id, cex = 0.5)
dev.off()





##table(leak.int$exper)
##
##g2dat <- leak.tot
##leak.tot$leak.m.tot > 0.37
##
### Drop bottles with leaks
##table(g2dat$id, g2dat$detect)
##g2dat <- subset(g2dat, !detect)
##table(g2dat$id, g2dat$detect)
##
##names(g2dat)
##plot(cvCH4.m ~ cvCH4.v, data = g2dat)
##abline(0, 1)
##abline(0, 1.1)
##abline(0, 0.9)
##
##for(i in 1:nrow(g2dat)) {
##  print(i)
##  # First without N2 correction
##  sol <-  optimize(
##           function(x) {
##             abs(
##                 mass2vol(g2dat$mass.loss.tot[i], x, temp = 30, pres = 2, 
##                          #headspace = 620, headcomp = 'N2', temp.init = 21,
##                          value = 'all')[1, 'vBg'] - 
##                   g2dat$cvBg.v[i]
##                 )
##           },
##           lower = 0, upper = 1
##           )
##  g2dat$xCH4.calc[i] <- signif(sol$minimum, 3)
##  g2dat$objective[i] <- sol$objective
##  g2dat$cvCH4.g2[i] <- mass2vol(g2dat$mass.loss.tot[i], g2dat$xCH4.calc[i], temp = 30, pres = 2, 
##                          #headspace = 620, headcomp = 'N2', temp.init = 21
##                          )
##  g2dat$cvBg.g2[i] <- mass2vol(g2dat$mass.loss.tot[i], g2dat$xCH4.calc[i], temp = 30, pres = 2, 
##                          #headspace = 620, headcomp = 'N2', temp.init = 21, 
##                          value = 'all')[, 'vBg']
##  # Then with it
##  sol <-  optimize(
##           function(x) {
##             abs(
##                 mass2vol(g2dat$mass.loss.tot[i], x, temp = 30, pres = 2, 
##                          headspace = 620, headcomp = 'N2', temp.init = 21,
##                          value = 'all')[1, 'vBg'] - 
##                   g2dat$cvBg.v[i]
##                 )
##           },
##           lower = 0, upper = 1
##           )
##  g2dat$xCH4.calc.cor[i] <- signif(sol$minimum, 3)
##  g2dat$objective.cor[i] <- sol$objective
##  g2dat$cvCH4.g2c[i] <- mass2vol(g2dat$mass.loss.tot[i], g2dat$xCH4.calc.cor[i], temp = 30, pres = 2, 
##                          headspace = 620, headcomp = 'N2', temp.init = 21
##                          )
##  g2dat$cvBg.g2c[i] <- mass2vol(g2dat$mass.loss.tot[i], g2dat$xCH4.calc.cor[i], temp = 30, pres = 2, 
##                          headspace = 620, headcomp = 'N2', temp.init = 21, 
##                          value = 'all')[, 'vBg']
##
##
##  print(rep(i, 10))
##}
##
##i = 1
##
##head(g2dat)
##
##png('../plots/grav2.png', height = 900, width = 900, pointsize = 15)
##plot(cvCH4.m ~ cvCH4.v, data = g2dat, xlim = c(0, 2000), ylim = c(0, 2000))
##points(cvCH4.g2 ~ cvCH4.v, data = g2dat, col = 'red')
##points(cvCH4.g2c ~ cvCH4.v, data = g2dat, pch = 19)
##abline(0, 1, lwd = 2)
##abline(0, 1.1)
##abline(0, 0.9)
##abline(0, 1.05, col = 'blue')
##abline(0, 0.95, col = 'blue')
##text(g2dat$cvCH4.v, g2dat$cvCH4.g2, g2dat$id, cex = 0.8)
##dev.off()
##
##g2dat
##
##g2dat$xCH4.calc
##
##x <- subset(g2dat, grepl('^I', id))
##x
##
##args(mass2vol)
##mass2vol(0.9, 0.1, 30, 2, value = 'all')
##mass2vol(0.9, 0.9, 30, 2, value = 'all')
##
##mass2vol(0.9, 0.1, 30, 2, value = 'all', headspace = 620, headcomp = 'N2', temp.init = 20)
##mass2vol(0.9, 0.9, 30, 2, value = 'all', headspace = 620, headcomp = 'N2', temp.init = 20)
##
##
#####
### interval values look poor, some obs entirely unreasonable (xCH4 = 0 because mass loss is just too low)
##
##g2dat <- leak.int
##
##g2dat$leak <- g2dat$leak.m > 0.1
##table(g2dat$id, g2dat$leak)
##table(g2dat$leak)
##head(g2dat)
##
##
##g2dat <- subset(g2dat, !leak)
##
##names(g2dat)
##plot(vCH4.m ~ vCH4.v, data = g2dat)
##abline(0, 1)
##g2dat$vBg.v
##
##for(i in 1:nrow(g2dat)) {
##  print(i)
##  sol <-  optimize(
##           function(x) {
##             abs(
##                 mass2vol(g2dat$massloss[i], x, temp = 30, pres = 2, 
##                          #headspace = 620, headcomp = 'N2', temp.init = 21,
##                          value = 'all')[1, 'vBg'] - 
##                   g2dat$vBg.v[i]
##                 )
##           },
##           lower = 0, upper = 1
##           )
##  g2dat$xCH4.calc[i] <- signif(sol$minimum, 3)
##  g2dat$objective[i] <- sol$objective
##  g2dat$vCH4.g2[i] <- mass2vol(g2dat$massloss[i], g2dat$xCH4.calc[i], temp = 30, pres = 2, 
##                          #headspace = 620, headcomp = 'N2', temp.init = 21
##                               )
##  g2dat$vBg.g2[i] <- mass2vol(g2dat$massloss[i], g2dat$xCH4.calc[i], temp = 30, pres = 2, 
##                          #headspace = 620, headcomp = 'N2', temp.init = 21, 
##                              value = 'all')[, 'vBg']
##
##  print(rep(i, 10))
##}
##
##i = 1
##
##head(g2dat)
##
##plot(vCH4.g2 ~ vCH4.v, data = g2dat)
##abline(0, 1)
##abline(0, 0.9)
##abline(0, 1.1)
##
##hist(g2dat$massloss)
##g2dat$rerr <- 100 * (1 - g2dat$vCH4.g2/g2dat$vCH4.v)
##
##plot(rerr ~ massloss, data = g2dat)
##abline(0, 0)
##
##plot(rerr ~ massloss, data = g2dat, ylim = c(-30, 30))
##abline(0, 0)
##
##library(dplyr)
##g2tot <- summarise(group_by(g2dat, id), cvCH4.g2 = sum(vCH4.g2), cvCH4.v = sum(vCH4.v))
##
##png('../plots/grav2_int.png', height = 900, width = 900, pointsize = 15)
##plot(cvCH4.g2 ~ cvCH4.v, data = g2tot, xlim = c(0, 2000), ylim = c(0, 2000))
##abline(0, 1, lwd = 2)
##abline(0, 1.1)
##abline(0, 0.9)
##abline(0, 1.05, col = 'blue')
##abline(0, 0.95, col = 'blue')
##text(g2tot$cvCH4.v, g2tot$cvCH4.g2, g2tot$id, cex = 0.8)
##dev.off()
##
##
##i
##x
##
##options(width = 70)
##g2dat <- g2dat[order(g2dat$vCH4.g2), ]
##head(g2dat)
##
##351
## mass2vol(0.4, 1:10/10, temp = 30, pres = 2, 
##                          headspace = 620, headcomp = 'N2', temp.init = 21, value = 'all')[, 'vBg']
##
### Assume 1 mass loss
##
##
####g2dat <- g2dat[order(g2dat$id, g2dat$ctime), ]
####massloss <- ddply(g2dat, 'id', summarise, mass.loss = mass.final[1] - mass.final[length(mass.final)])
####
####bgvf <- ddply(bgv, 'id', summarise, cvBg = max(cvBg), cvCH4 = max(cvCH4), 
####              xCH4.true = signif(max(cvCH4)/max(cvBg), 3)
####              )
####bgvf <- merge(bgvf, massloss, by = 'id')
####
####bgpf <- ddply(bgp, 'id', summarise, cvBg = max(cvBg), cvCH4 = max(cvCH4), 
####              xCH4.true = signif(max(cvCH4)/max(cvBg), 3)
####              )
####bgpf <- merge(bgpf, massloss, by = 'id')
####
####bgf <- bgvf
####bgf <- bgpf
####
####
##### Drop bottles with missing volume measurements
####bgf <- bgf[!bgf$id %in% c('B1', 'B2', 'B3', 'A1', 'A2', 'A3'), ]
###### Missing pressure
#####bgf <- bgf[!bgf$id %in% c('B1', 'B2', 'B3'), ]
#####bgf <- bgf[bgf$id %in% c('C1', 'C2', 'C3'), ]
####
####bgf$objective <- NA
####
####for(i in 1:nrow(bgf)) {
####  sol <-  optimize(
####           function(x) {
####             abs(
####                 mass2vol(bgf$mass.loss[i], x, temp = 30, pres = 2, 
####                          headspace = 620, headcomp = 'N2', temp.init = 21,
####                          value = 'all')[1, 'vBg'] - 
####                   bgf$cvBg[i]
####                 )
####           },
####           lower = 0, upper = 1
####           )
####  bgf$xCH4.calc[i] <- signif(sol$minimum, 3)
####  bgf$objective[i] <- sol$objective
####}
####
####bgf
####head(bgf)
####
####plot(xCH4.calc ~ xCH4.true, data = bgf, cex = 3)
####text(bgf$xCH4.true, bgf$xCH4.calc, bgf$id, cex = 0.7)
####abline(0, 1)
####
####
####plot(xCH4.calc ~ xCH4.true.p, data = bgf)
####abline(0, 1)
####abline(0.03, 1)
####abline(-0.03, 1)
#

  
#pdf('../plots/fig2.pdf', height = 3, width = 2.5, pointsize = 8)
#  plot(err.v ~ leak.m.tot, data = leak.tot, pch = 1, col = 'black', type = 'n', xlab = 'Apparent leak mass (g)', ylab = 'Apparent volumetric error (mL)')
#  abline(h = 0, lty = 2)
#  abline(v = 0, lty = 2)
#  abline(v = 0.1)
#  text(leak.tot$leak.m.tot, leak.tot$err.v, leak.tot$id, cex = 0.6)
#dev.off()
#
#  
#png('../plots/leaks.png', height = 700, width = 700, pointsize = 28)
#  plot(err.p ~ leak.m.tot, data = leak.tot, pch = 1, col = 'black', cex = 2, 
#       xlab = 'Apparent leak mass (g)', ylab = 'Apparent manometric error (mL)')
#  abline(h = 0, lty = 2)
#  abline(v = 0, lty = 2)
#  abline(v = 0.1)
#  text(leak.tot$leak.m.tot, leak.tot$err.p, leak.tot$id, cex = 0.6)
#dev.off()





x <- subset(leaks, leak.m.tot < 0.4)
summary(lm(err.v ~ leak.m.tot, data = x))

write.csv(leaks, '../output/leaks.csv', row.names = FALSE)
write.csv(m, '../output/leak_time.csv', row.names = FALSE)

head(leaks)
stripchart(leaks$leak.loss.total, method = 'jitter')
abline(v = 0)

sink('../output/leak_test.txt')
  cat('All bottles\n')
  cat(nrow(leaks), 'obs. \n')
  print(wilcox.test(leaks$leak.loss.total))
  
  cat('Exclude obvious leaks\n')
  x <- subset(leaks, leak.loss.total <= 0.3)
  cat(nrow(x), 'obs. \n')
  print(wilcox.test(x$leak.loss.total))
sink()

print(subset(leaks, pct.leak > 10))

t.test(watmass$mass.change, leaks$leak.loss)

plot(leak.loss ~ pres, data = m, ylim = c(-0.5, 0.75), xlim = c(0, 2.7))
points(mass.change ~ runif(mass.change, 2.3, 2.7), data = watmass, col = 'blue', pch = 20)
subset(m, leak.loss < -3)

plot(leak.loss.total ~ max.pres, data = leaks, xlim = c(0, 2.7), ylim = c(-0.5, 2.5))
abline(h = 0)
points(mass.change.total ~ runif(mass.change.total, 2.3, 2.7), data = watsumm, col = 'blue', pch = 20)

plot(pct.leak ~ max.pres, data = leaks)
plot(leak.loss.total ~ mass.loss.total, data = leaks)
abline(h = 0)

# These are the most convincing plots
plot(pct.leak ~ err.v, data = leaks)
abline(h = 0)
abline(v = 0)
abline(0, 1)

plot(pct.leak ~ err.p, data = leaks)
abline(h = 0)
abline(v = 0)
abline(0, 1)

leaks <- subset(leaks, exper == 2)
plot(err.v ~ leak.ml.v, data = leaks, pch = 1, col = 'black', asp = 1)
points(err.v ~ leak.ml.v, data = subset(leaks, conf), pch = 19, col = 'black', asp = 1)
abline(0, 1)

plot(err.p ~ leak.ml.v, data = leaks, pch = 1, col = 'black', asp = 1)
points(err.p ~ leak.ml.v, data = subset(leaks, conf), pch = 19, col = 'black', asp = 1)
abline(0, 1)

#####
#####
#####

head(leaks)
tail(leaks)
leaks$pct.leak <- 100*leaks$leak.m.tot/leaks$mass.loss.total

# Drop exploded bottles
# Aren't there also problems with other missing data in exp 1?
leaks <- subset(leaks, !(id %in% c('B2', 'B3') & exper == 1))

# Definite leaks maybe
leaks$conf <- ifelse(abs(leaks$leak.m.tot) > 0.2, TRUE, FALSE)

head(leaks)

head(leaks)
tail(leaks)



head(bg)





head(bg)
bg


# Add total xCH4
bgm <- bgm[order(bgm$id, bgm$ctime), ]
bgmxs <- ddply(bgm, 'id', summarise, 
               xCH4.d1 = xCH4[2],
               xCH4.d2 = xCH4[3],
               xCH4.d3 = xCH4[4],
               xCH4.tot = max(cvCH4)/max(cvBg), 
               xCH4.final = xCH4[length(xCH4)])
bgmxs
bgmxs$xCH4.3v <- (bgmxs$xCH4.d1 + bgmxs$xCH4.d2 + bgmxs$xCH4.final)/3
bgmxs$xCH4.3d <- (bgmxs$xCH4.d1 + bgmxs$xCH4.d2 + bgmxs$xCH4.d3)/3
bgmxs$xCH4.4v <- (bgmxs$xCH4.d1 + bgmxs$xCH4.d2 + bgmxs$xCH4.d3 + bgmxs$xCH4.final)/4
plot(xCH4.tot ~ xCH4.final, data = bgmxs, cex = 3)
text(bgmxs$xCH4.final, bgmxs$xCH4.tot, bgmxs$id, cex = 0.7)
abline(0, 1)

plot(xCH4.tot ~ xCH4.3d, data = bgmxs, cex = 3)
text(bgmxs$xCH4.3d, bgmxs$xCH4.tot, bgmxs$id, cex = 0.7)
abline(0, 1)

plot(xCH4.tot ~ xCH4.3v, data = bgmxs, cex = 3)
text(bgmxs$xCH4.3v, bgmxs$xCH4.tot, bgmxs$id, cex = 0.7)
abline(0, 1)
head(bgm)

plot(xCH4.tot ~ xCH4.4v, data = bgmxs, cex = 3)
text(bgmxs$xCH4.4v, bgmxs$xCH4.tot, bgmxs$id, cex = 0.7)
abline(0, 1)
head(bgm)

# Check for leaks
mass <- bg[order(bg$id, bg$ctime), c('id', 'date', 'time', 'date.time', 'ctime', 'mass.init', 'mass.final')]
mass <- ddply(mass, 'id', transform, leak.loss = c(NA, mass.init[-1] - mass.final[-length(mass.final)]))
leaks <- ddply(mass, 'id', summarise, leak.loss.total = round(sum(na.omit(leak.loss)), 1))
sum(na.omit(mass$leak.loss))

## grav2
#head(bgp, 10)
#bgf <- ddply(bgv, 'id', summarise, cvBg = max(cvBg), cvCH4 = max(cvCH4), 
#              mass.loss = mass.final[2] - mass.final[ctime == max(ctime)],
#              xCH4.true.p = signif(max(cvCH4)/max(cvBg), 3),
#              miss = any(is.na(vBg))
#              )
#
#bgf <- merge(bgf, leaks)
#
#bgf$cvCH4.cor <- bgf$cvCH4*(bgf$mass.loss - bgf$leak.loss.total)/bgf$mass.loss
#bgf$cvBg.cor <- bgf$cvBg*(bgf$mass.loss - bgf$leak.loss.total)/bgf$mass.loss
#
## Drop bottles with missing volume measurements
##bgf <- bgf[!bgf$id %in% c('B1', 'B2', 'B3', 'A1', 'A2', 'A3'), ]
## Missing pressure
#bgf <- bgf[!bgf$id %in% c('B1', 'B2', 'B3'), ]
#bgf$objective <- NA
#
#for(i in 1:nrow(bgf)) {
#  sol <-  optimize(
#           function(x) {
#             abs(
#                 mass2vol(bgf$mass.loss[i], x, temp = 30, pres = 2, 
#                          headspace = 620, headcomp = 'N2', temp.init = 21,
#                          value = 'all')[1, 'vBg'] - 
#                   bgf$cvBg.cor[i]
#                 )
#           },
#           lower = 0, upper = 1
#           )
#  bgf$xCH4.calc[i] <- signif(sol$minimum, 3)
#  bgf$objective[i] <- sol$objective
#}
#
#bgf
#head(bgf)
#
#plot(xCH4.calc ~ xCH4.true.p, data = bgf)
#abline(0, 1)
#abline(0.03, 1)
#abline(-0.03, 1)






tail(dd)

dd$pvdiff <- 100*(1 - dd$vBg.p/dd$vBg.v)
dd$pmdiff <- 100*(1 - dd$vBg.p/dd$vBg.m)
plot(pvdiff ~ vBg.v, data = dd)
plot(pmdiff ~ vBg.v, data = dd)
plot(pmdiff ~ vBg.p, data = dd)

bgm[duplicated(bgm[, c('id', 'ctime')]), ]
bgm[96:97, ]
comp[comp$id == 'L2', ]

# Need to plot fv.inoc
# Check fv.inoc
subset(bsm, descrip == 'A' & ctime == 13.8)
subset(bsm, descrip == 'B' & ctime == 8.9)
subset(bsm, descrip == 'C' & ctime == 13.8)
subset(bsm, descrip == 'Cellulose' & ctime == 21.9)

subset(bsm, ctime > 13)[, c('id', 'ctime', 'rr')]
#ddply(bsm, 'id', j


w <- 'end'

bsp <- summBg(bgp, setup, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', inoc.name = 'Inoculum', 
             inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             when = w)

bsp

bsm <- summBg(bgm, setup, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)
bsm
bsp

bsm <- summBg(subset(bgm, !id %in% c('B1', 'B2')), setup, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = '1p')

bsm

bsm <- summBg(bgm, setup, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             vol.name = 'cvCH4',
             when = w)
bsm
bsp


bgp <- merge(bgp, setup)
bgm <- merge(bgm, setup)

i <- which(bgp$vCH4 < 0)
x <- bgp[sort(c(i, i - 1)), ]
head(bgp)

png('../plots/x.png', height = 600, width = 600, pointsize = 20)

  plot(vCH4.m ~ vCH4.p, data = dd, cex = 2, col = 'gray55')
  abline(0, 1)
  abline(0, 1.1)
  abline(0, 0.9)
  text(dd$vCH4.p, dd$vCH4.m, dd$ctime, cex = 0.7, col = 'darkred')
 dev.off()



x <- summBg(bgm2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = '1p', show.obs = TRUE)

y <- summBg(bgm2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = 'meas')

yv <- summBg(bgv2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = 'meas')

g
ggplot(data = x, aes(ctime, rrvCH4, colour = id)) + geom_point() + geom_line() + ylim(0, 10)
ggplot(data = x, aes(ctime, cvCH4, colour = id)) + geom_point() + geom_line()

pdf('exp2_cvCH4.pdf', height = 4, width = 5)
  p <- ggplot(data = y, aes(ctime, mean, colour = descrip)) + geom_point() + geom_line()
  print(p)
dev.off()

pdf('exp2_cvCH4v.pdf', height = 4, width = 5)
  p <- ggplot(data = yv, aes(ctime, mean, colour = descrip)) + geom_point() + geom_line()
  print(p)
dev.off()

ggplot(data = bgm2, aes(ctime, cvCH4, colour = id)) + geom_point() + geom_line()

subset(y, descrip == 'C')



