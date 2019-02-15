# Calculate leakage from biogas bottles

#source('functions.R')
leaks <- leakBg(biogas, 
                time.name = 'elapsed.time', 
                m.init.name = 'mass.init', m.final.name = 'mass.final',
                id.name = 'id')

