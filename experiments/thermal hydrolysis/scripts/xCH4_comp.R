# Compare xCH4

cbg.gdt$xCH4c.gdt <- cbg.gdt$cvCH4/cbg.gdt$cvBg
cbg.gdv$xCH4c.gdv <- cbg.gdv$cvCH4/cbg.gdv$cvBg
cbg.gdv.hc$xCH4c.gdv.hc <- cbg.gdv.hc$cvCH4/cbg.gdv.hc$cvBg
cbg.grav$xCH4c.grav <- cbg.grav$cvCH4/cbg.grav$cvBg

names(cbg.grav)
head(cbg.grav)
head(cbg.gdv)
cbg.comb <- merge(cbg.grav, cbg.gdt, by = c('id', 'date', 'time.d'),
                                            suffixes = c('.grav', ''))

cbg.comb <- merge(cbg.comb, cbg.gdv, by = c('id', 'date', 'time.d'),
                                            suffixes = c('.gdt', ''))

cbg.comb <- merge(cbg.comb, cbg.gdv.hc, by = c('id', 'date', 'time.d'),
                                            suffixes = c('.gdv', 'gdvhc'))



cbg.comb <- cbg.comb[cbg.comb$time.d > 20, ]

cbg.comb <- merge(setup, cbg.comb, by = 'id')

cbg.comb$aerr1 <- cbg.comb$xCH4c.gdv - cbg.comb$xCH4c.grav
cbg.comb$aerr2 <- cbg.comb$xCH4c.gdv.hc - cbg.comb$xCH4c.grav
