# Export data

write.csv(setup, '../output/setup.csv', row.names = FALSE)
write.csv(biogas, '../output/biogas.csv', row.names = FALSE)
write.csv(water, '../output/water.csv', row.names = FALSE)

#Extract xCH4 for GC of man.grav bottles
gccomp <- biogas[, c('id', 'time.d', 'xCH4')]
id.descrip <- setup[, c('id', 'descrip')]

gccomp.GC <- merge(gccomp, id.descrip, by = 'id')

write.csv(gccomp.GC, '../output/GCxCH4.csv', row.names = FALSE)
