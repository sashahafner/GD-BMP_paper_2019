# Compare xCH4

cbg.gdt$xCH4c.gdt <- cbg.gdt$cvCH4/cbg.gdt$cvBg
cbg.gdt.hc$xCH4c.gdt.hc <- cbg.gdt.hc$cvCH4/cbg.gdt.hc$cvBg
cbg.grav$xCH4c.grav <- cbg.grav$cvCH4/cbg.grav$cvBg

cbg.comb <- merge(cbg.grav, cbg.gdt, by = c('id', 'exper', 'date', 'time.orig', 'time', 'sheet.order',
                                            'mass.init', 'pres.init', 'vol', 'mass.final', 'notes', 
                                            'inject.date.time', 'xCH4.oa', 'xCH4.GC', 'date.time', 
                                            'start.time', 'time.d'),
                                            suffixes = c('.grav', ''))
cbg.comb <- merge(cbg.comb, cbg.gdt.hc, by = c('id', 'exper', 'date', 'time.orig', 'time', 'sheet.order',
                                            'mass.init', 'pres.init', 'vol', 'mass.final', 'notes', 
                                            'inject.date.time', 'xCH4.oa', 'xCH4.GC', 'date.time', 
                                            'start.time', 'time.d'),
                                            suffixes = c('.gdt', 'gdthc'))


cbg.comb <- cbg.comb[cbg.comb$time.d > 30, ]

cbg.comb <- merge(setup, cbg.comb, by = c('exper', 'id'))

cbg.comb$aerr1 <- cbg.comb$xCH4c.gdt - cbg.comb$xCH4c.grav
cbg.comb$aerr2 <- cbg.comb$xCH4c.gdt.hc - cbg.comb$xCH4c.grav

ggplot(cbg.comb, aes(xCH4c.grav, xCH4c.gdt.hc, colour = descrip)) +
       geom_point() +
       geom_abline(intercept = 0, slope = 1)

ggplot(cbg.comb, aes(cvBg.grav/vol.hs, aerr1, colour = descrip)) +
       geom_point(shape = 19) +
       geom_point(aes(cvBg.grav/vol.hs, aerr2), shape = 2) +
       geom_abline(intercept = 0, slope = 1)


plot(xCH4c.grav ~ xCH4c.gdt, data = cbg.comb)
abline(0, 1)
abline(0.1, 1)
abline(-0.1, 1)

table(cbg.comb$id, cbg.comb$time.d)
dim(cbg.comb)
head(cbg.comb)

head(cbg.comb)
dfsumm(cbg.comb)

x <- subset(cbg.comb, is.na(xCH4.GD))
head(x)

xCH4.comp <- as.data.frame(summarise(group_by(cbg.comb, id), xCH4.gdt = xCH4[method == 'gdt' & time.d == max(time.d)],
                                     xCH4.gc = cvCH4[method == 'grav' & time.d == max(time.d)]/
                                     cvBg[method == 'grav' & time.d == max(time.d)],
                                     adiff = xCH4.gdt - xCH4.gc))
