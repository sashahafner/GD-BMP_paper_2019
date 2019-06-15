# Export data

# Water bottles
write.csv(water, '../output/water.csv', row.names = FALSE)

# Biogas data
write.csv(biogas, '../output/biogas.csv', row.names = FALSE)
