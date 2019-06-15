# Data for pasting in IIS-BMP template (different from raw data bc it has time.d, and also has masses corrected for drift)

# Biogas data for IIS-BMP2 submission
biogas.IIS <- biogas[, c('id', 'etime', 'vol', 'temp.air', 'pres.amb', 'mass.init', 'mass.final')]
biogas.IIS <- biogas.IIS[order(biogas.IIS$id, biogas.IIS$etime), ]
write.csv(biogas.IIS, '../output/biogas_IIS-BMP.csv', row.names = FALSE)


