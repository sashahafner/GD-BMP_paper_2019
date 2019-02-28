# Rearrange and organization of calculated biogas data prior to analysis 

#----------------

# Add substrate type and other needed variables with merge of some columns from setup
cbg.gd <- merge(cbg.gd, setup[, c('id', 'descrip')], by = 'id')

# Add rsd to data frames
BMP$rsd <- 100 * BMP$sd/BMP$mean
yld$rsd <- 100 * yld$sd/yld$mean
