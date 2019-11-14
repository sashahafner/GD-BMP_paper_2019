# Look at results

head(cbg.gd)
head(cbg.grav)

cbg.comb <- merge(cbg.grav, cbg.gd, by = c('id', 'date', 'time', 'time.d'),
                  suffixes = c('.grav', '.gdt'))

cbg.comb <- subset(cbg.comb, time.d > 26)

cbg.comb$aerr <- cbg.comb$cvCH4.gdt - cbg.comb$cvCH4.grav
cbg.comb$rerr <- 100 * cbg.comb$aerr/cbg.comb$cvCH4.grav

cbg.comb
cbg.comb[, c('id', 'aerr', 'rerr', 'cvBg.grav')]
