# Calculate leakage from biogas bottles

#source('functions.R')
leaks <- massLoss(biogas, 
                time.name = 'elapsed.time', 
                m.pre.name = 'mass.init', m.post.name = 'mass.final',
                id.name = 'id')

write.csv(leaks, '../output/leaks.csv', row.names = FALSE)
