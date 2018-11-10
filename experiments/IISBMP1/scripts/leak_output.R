# Print results from leak analysis and calculate detection limits

# Summaries
dfsumm(leak.int)
dfsumm(leak.tot)
dfsumm(subset(leak.tot, detect == 1))

# Water summaries
dfsumm(wat.int)
wat.tot

# Find detection limits
range(na.omit(wat.int$mass.change))
sd(na.omit(wat.int$mass.change))
3*sd(na.omit(wat.int$mass.change))
range(na.omit(leak.int$leak.m))

# Set detection limits based on above
dli <- 3*sd(na.omit(wat.int$mass.change))
dli

# Total incubation
range(na.omit(leak.tot$leak.m))
range(leak.tot$intervals)
dlt <- sqrt(9)*dli
dlt

# Summary info
dim(leak.int)
sum(na.omit(leak.int$leak.m) == 0)
mean(na.omit(leak.int$leak.m) == 0)
sum(na.omit(leak.int$leak.m) < 0)
mean(na.omit(leak.int$leak.m) < 0)

# Detectable mass loss
sum(na.omit(leak.int$leak.m) > dli)
mean(na.omit(leak.int$leak.m) > dli)

# Bottles
length(unique(subset(leak.int, leak.m > dli)$id))

# Summary for incubation
dim(leak.tot)
sum(leak.tot$leak.m.tot == 0)
mean(leak.tot$leak.m.tot == 0)

# Detectable mass loss
sum(leak.tot$leak.m.tot > dlt)
mean(leak.tot$leak.m.tot > dlt)
sum(leak.tot$leak.m.tot > dlt & leak.tot$pct.leak > 10)

# 10% and 20% detection
sum(246 < 0.1*leak.tot$cvCH4.m)
sum(246 < 0.2*leak.tot$cvCH4.m)

# Table for paper
leak.table <- merge(setup[, c('exper', 'id', 'm.inoc', 'm.sub', 'm.sub.vs', 'm.tot', 'vol.hs')], 
                    leak.tot[, c('exper', 'id', 'cvBg.m', 'cvCH4.m', 'cvBg.v', 'cvCH4.v', 'max.pres', 'mass.loss.tot', 'leak.m.tot', 'vCH4.leak', 'vBg.leak')],
                    by = c('exper', 'id'))

print(xtable(leak.table, 
             digits = c(0, 0, 0, 2, 2, 2, 2, headspace = 0, 0, 0, 0, 0, 0, 2, 2, 0, 0)), 
      include.rownames = FALSE, file = '../tables/SItable.tex')


leak.table2 <- merge(setup[, c('exper', 'id', 'm.sub.vs', 'vol.hs')], 
                    leak.tot[, c('exper', 'id', 'cvCH4.m', 'cvCH4.v', 'err.v', 'max.pres', 'mass.loss.tot', 'leak.m.tot', 'vCH4.leak', 'pct.leak')],
                    by = c('exper', 'id'))

leak.table2 <- leak.table2[leak.table2$id %in% c('B2', 'A2', 'C1', 'L2', 'C5'), ]

print(xtable(leak.table2, 
             digits = c(0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 1, 0, 1)), 
      include.rownames = FALSE, file = '../tables/leak_table.tex')

write.csv(leak.tot, '../output/leak_tot.csv', row.names = FALSE)

# Detection limit in biogas volume
dli
mass2vol(dli, xCH4 = 0.65, temp = 35, pres = 101.325, value = 'all')
mass2vol(0.2, xCH4 = 0.65, temp = 35, pres = 101.325, value = 'all')

# Export
write.csv(leak.tot, '../output/leak_tot.csv', row.names = FALSE)
write.csv(leak.int, '../output/leak_int.csv', row.names = FALSE)
write.csv(wat.int, 'watint.csv')
