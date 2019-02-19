# Calculate leakage from biogas bottles

#source('functions.R')

which(is.na(biogas$mass.init))
which(is.na(biogas$mass.final))

biogas.leak <- biogas[!is.na(biogas$mass.init) & !is.na(biogas$mass.final), ]

l <- leaks[order(biogas.leak$id.exper, biogas.leak$elapsed.time), ]
leaks <- leakBg(biogas.leak, 
                time.name = 'elapsed.time', 
                m.init.name = 'mass.init', m.final.name = 'mass.final',
                id.name = 'id.exper')

write.csv(leaks, '../output/leak.csv', row.names = FALSE)
