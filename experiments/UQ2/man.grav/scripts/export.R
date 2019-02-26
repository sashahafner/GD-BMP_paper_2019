# Export data

# Setup data
write.csv(setup, '../output/setup.csv', row.names = FALSE)

# Biogas data
write.csv(biogas, '../output/biogas.csv', row.names = FALSE)

# Water bottles
write.csv(water, '../output/water.csv', row.names = FALSE)