# Merge BMP data for grav and gd options

# Choose columns from gd data
BMP.gd <- BMP.gd[, c('method', 'descrip', 'elapsed.time', 'mean', 'se', 'sd', 'n', 'leak.l', 'rsd')]

# Remove manometric data
BMP.grav <- subset(BMP.grav, method == 'grav')

# Bind grav and gd dataset 
BMP <- rbind(BMP.gd, BMP.grav)

# Bind xCH4 for GC and gd
xCH4 <- merge(comp.gd, comp.GC, by= c('id', 'descrip', 'elapsed.time'))

# Methane composition for rowbinded
comp.GC$method <- 'grav.GC'
xCH4.all <- rbind(comp.gd.all, comp.GC)
