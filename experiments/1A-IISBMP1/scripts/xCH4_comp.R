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

