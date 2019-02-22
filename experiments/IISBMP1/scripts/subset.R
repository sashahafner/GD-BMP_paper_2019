
# Delete data in experiment one due to lack of measurement (A1, A2, A3 and B3 (exploded))

# Experiment 1
biogas1 <- subset(biogas, exper == 1)
setup1 <- subset(setup, exper == 1)

# Experiment 2
biogas2 <- subset(biogas,exper == 2)
setup2 <- subset(setup, exper == 2)

# Remove id's with mising values
biogas1AB3 <- subset(biogas1, !id %in% c('A1', 'A2', 'A3', 'B1', 'B2', 'B3'))

# Make a biogas data frame without A1, A2, A3 and B1, B2 and B3
biogas <- rbind(biogas1AB3, biogas2)
