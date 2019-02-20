# Export data

# Setup data
write.csv(setup, '../output/setup.csv', row.names = FALSE)

# Biogas data
write.csv(biogas, '../output/biogas.csv', row.names = FALSE)

# Water bottles - remember these they are in a different data sheet 