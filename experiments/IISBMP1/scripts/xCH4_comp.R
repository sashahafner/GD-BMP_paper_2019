# Compare xCH4

cbg.grav$method <- 'grav'
cbg.gdt$method <- 'gdt'
cbg.comb <- rbindf(cbg.grav, cbg.gdt)
xCH4.comp <- as.data.frame(summarise(group_by(cbg.comb, id), xCH4.gdt = xCH4[method == 'gdt' & time.d == max(time.d)],
                                     xCH4.gc = cvCH4[method == 'grav' & time.d == max(time.d)]/
                                     cvBg[method == 'grav' & time.d == max(time.d)],
                                     adiff = xCH4.gdt - xCH4.gc))
