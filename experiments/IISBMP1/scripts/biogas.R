# Works up biogas production data
# S. Hafner
# Modified:

# Packages
library(gdata)
#library(biogas)
library(lubridate)
library(ggplot2)
library(plyr)

files <- list.files('~/Dropbox/biogas_package/biogas/R', full.names = TRUE)
for(i in files) source(i)

setup <- read.xls('../data/exp1.xlsx', sheet = 1, skip = 1)
bg <- read.xls('../data/exp1.xlsx', sheet = 2, skip = 1)
comp <- read.csv('../data/comp.csv')

# Add headspace vol
# NTS: how much volume in manometer + tubing?
setup$v.headspace <- 1120 - setup$m.inoc - setup$m.sub + 6

# Drop second B3 sample (is a true second sample but composition was nearly the same)
comp <- comp[comp$inject.date.time != '24-11-2016 11:22:38', ]

# Drop one of the duplicate I3 07122016 xCH4 samples. 
# Must be a labeling error. 
# Not sure which is correct but they are similar
comp <- comp[comp$inject.date.time != '08-12-2016 11:16:43', ]

# Merge composition data with biogas data by id and date
# Problem with two B3 measurements one day
bg <- merge(bg, comp, by = c('id', 'date'), all = TRUE)

## Add some B1 data for now 
## NTS: delete when I get new GC data
#bg[bg$id == 'B1', 'xCH4'] <- 0.6
#bg[bg$id == 'B2', 'xCH4'] <- 0.6
#bg[bg$id == 'I3', 'xCH4'] <- 0.5

bg[bg$id == 'I1',c('id', 'date', 'xCH4')]

wd <- which(duplicated(bg[ , c('id', 'date')]))
bg[sort(c(wd - 1, wd)), ]

bg$time <- sprintf('%04d', bg$time)
bg$date <- sprintf('%08d', bg$date)
bg$date.time <- dmy_hm(paste(bg$date, bg$time))
bg$ctime <- round(as.numeric(difftime(bg$date.time, dmy_hm('15112016 1440'), units = 'days')), 1)
subset(bg, id == 'B3')

watmass <- bg[grepl('^[W]', bg$id), ]
bg <- bg[grepl('^[^W]', bg$id), ]
watmass$mass.init

head(bg)
bg

options(unit.pres = 'bar', pres.std = 1)

bgm <- cumBg(bg, 'mass', temp = 27, pres = 1.01, 
             data.struct = 'longcombo',
             id.name = 'id', time.name = 'ctime', dat.name = 'mass.final', comp.name = 'xCH4',
             temp.init = 21,
             headspace = setup, vol.hs.name = 'v.headspace', headcomp = 'N2',
             extrap = TRUE)

d <- bg[!is.na(bg$pres), ]
bgp <- cumBg(d, 'pres', temp = 27,
             data.struct = 'longcombo',
             id.name = 'id', time.name = 'ctime', dat.name = 'pres', comp.name = 'xCH4', temp.init = 21,
             pres.resid = 0.0, pres.init = 0.0, headspace = setup, vol.hs.name = 'v.headspace',
             pres.amb = 1.01, absolute = FALSE,
             extrap = TRUE)

d <- bg[!is.na(bg$vol), ]
bgv <- cumBg(d, 'vol', temp = 21, pres = 1.01,
             data.struct = 'longcombo',
            id.name = 'id', time.name = 'ctime', dat.name = 'vol', temp.init = 21,
            extrap = TRUE)

dd <- merge(bgm, bgp, by = c('id', 'date', 'time', 'order', 'mass.init', 'pres', 'vol', 'mass.final', 'notes', 'date.time', 'ctime'), suffixes = c('.m', ''))
dd <- merge(dd, bgv, by = c('id', 'date', 'time', 'order', 'mass.init', 'pres', 'vol', 'mass.final', 'notes', 'date.time', 'ctime'), suffixes = c('.p', '.v'))
head(dd)

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

# Check rates
bgm[order(bgm$ctime), c('id', 'date.time', 'ctime', 'cvCH4')]
bgm$ctime[bgm$ctime == 30.8] <- 30.9
bsm <- summBg(bgm, setup, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = 'meas',
             show.obs = TRUE,
             sort = TRUE)

bsm
bsm$rr <- 100*c(NA, diff(bsm$cvCH4)/diff(bsm$ctime))/bsm$cvCH4
bsm$rr[bsm$ctime == 0] <- NA
bsm
bsm[ , c('id', 'ctime', 'cvCH4', 'rr')]
bsm$ctime

subset(bsm, ctime > 10)
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



pdf('../plots/biogas.pdf', height = 4, width = 6)

  plot(cvCH4.m ~ cvCH4.p, data = dd, cex = 2)
  abline(0, 1)
  abline(0, 1.1)
  abline(0, 0.9)
  text(dd$cvCH4.p, dd$cvCH4.m, dd$id, cex = 0.7, col = 'darkred')

  plot(vCH4.m ~ vCH4.p, data = dd, cex = 2)
  abline(0, 1)
  abline(0, 1.1)
  abline(0, 0.9)
  text(dd$vCH4.p, dd$vCH4.m, dd$id, cex = 0.7, col = 'darkred')
  
  plot(vCH4.m ~ vCH4.p, data = dd, cex = 2, col = 'gray55')
  abline(0, 1)
  abline(0, 1.1)
  abline(0, 0.9)
  text(dd$vCH4.p, dd$vCH4.m, dd$ctime, cex = 0.7, col = 'darkred')
  
  ddd <- dd[dd$ctime > 8.8, ]
  plot(cvCH4.m ~ cvCH4.p, data = ddd, main = 'Final', cex = 2)
  abline(0, 1)
  abline(0, 1.1)
  abline(0, 0.9)
  text(ddd$cvCH4.p, ddd$cvCH4.m, substring(ddd$id, 1, 1), cex = 0.7, col = 'darkred')

  plot(cvCH4.m ~ cvCH4.v, data = dd)
  abline(0, 1)
  abline(0, 1.1)
  abline(0, 0.9)

  plot(vCH4.m ~ vCH4.v, data = dd)
  abline(0, 1)
  abline(0, 1.1)
  abline(0, 0.9)
  
  ddd <- dd[dd$ctime > 8.8, ]
  plot(cvCH4.m ~ cvCH4.v, data = ddd, main = 'Final')
  abline(0, 1)
  abline(0, 1.1)
  abline(0, 0.9)

  plot(cvCH4.v ~ cvCH4.p, data = dd)
  abline(0, 1)
  abline(0, 1.1)
  abline(0, 0.9)

  plot(vCH4.v ~ vCH4.p, data = dd)
  abline(0, 1)
  abline(0, 1.1)
  abline(0, 0.9)
  
  ddd <- dd[dd$ctime > 8.8, ]
  plot(cvCH4.v ~ cvCH4.p, data = ddd, main = 'Final')
  abline(0, 1)
  abline(0, 1.1)
  abline(0, 0.9)
      
  ggplot(data = bgm, aes(ctime, xCH4.oa, group = id, colour = descrip)) + geom_line() + geom_point()
  ggplot(data = bgm, aes(ctime, xCH4, group = id, colour = descrip)) + geom_line() + geom_point()
  
  ggplot(data = bgm, aes(ctime, cvBg, group = id, colour = descrip)) + geom_line() + geom_point()
  ggplot(data = bgp, aes(ctime, cvBg, group = id, colour = descrip)) + geom_line() + geom_point()
  ggplot(data = bgp, aes(ctime, cvCH4, group = id, colour = descrip)) + geom_line() + geom_point()
  ggplot(data = bgp, aes(ctime, rvCH4, group = id, colour = descrip)) + geom_line() + geom_point()
  ggplot(data = bgp, aes(ctime, rvBg, group = id, colour = descrip)) + geom_line() + geom_point()
  ggplot(data = bgm, aes(ctime, rvBg, group = id, colour = descrip)) + geom_line() + geom_point()
dev.off()
