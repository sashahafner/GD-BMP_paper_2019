
# Delete data in experiment one due to lack of measurement (A1, A2, A3 and B3 (exploded))

biogas <- subset(biogas, !id %in% c('A1', 'A2', 'A3', 'B1', 'B2', 'B3') | exper == 2)

setup1 <- subset(setup, exper == 1)
setup2 <- subset(setup, exper == 2)

