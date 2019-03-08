# Merge BMP data for grav and gd options

# Choose columns from gd data
BMP.gd <- BMP.gd[, c('method', 'descrip', 'elapsed.time', 'mean', 'se', 'sd', 'n', 'leak.l', 'rsd')]

# Remove manometric data
BMP.grav <- subset(BMP.grav, method == 'grav')

# Bind grav and gd dataset 
BMP <- rbind(BMP.gd, BMP.grav)
