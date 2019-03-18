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

# Subset for first part of results (show int averaging is bad)
xCH4.all <- subset(xCH4.all, method == 'gd01' & descrip == 'C' | method == 'gd02' & descrip == 'C' |  method == 'grav.GC' & descrip == 'C'|  method == 'gd03' & descrip == 'C')
xCH4.gd3 <- subset(xCH4.all, method == 'gd03')
xCH4.no.gd3 <- subset(xCH4.all, !method == 'gd03')

# Subset for second part of results (show gd3 is good)
BMP.gd3.grav <- subset(BMP, method == 'gd03' | method == 'grav')
