# Calculate leakage from biogas bottles

#source('functions.R')

which(is.na(biogas$mass.init))
which(is.na(biogas$mass.final))

leaks <- massLoss(biogas, 
                time.name = 'elapsed.time', 
                m.pre.name = 'mass.init', m.post.name = 'mass.final',
                id.name = 'id')

write.csv(leaks, '../output/leaks.csv', row.names = FALSE)
