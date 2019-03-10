# Export data

# Setup data
write.csv(setup, '../output/setup.csv', row.names = FALSE)

# Biogas data
write.csv(biogas, '../output/biogas.csv', row.names = FALSE)

# Water bottles
write.csv(water, '../output/water.csv', row.names = FALSE)

#Extract xCH4 for GC of man.grav bottles
gdcomp <- biogas[, c('id', 'elapsed.time', 'xCH4')]
id.descrip <- setup[, c('id', 'descrip')]

gdcomp.GC <- merge(gdcomp, id.descrip, by = 'id')

write.csv(gdcomp.GC, '../results/GCxCH4.csv', row.names = FALSE)
