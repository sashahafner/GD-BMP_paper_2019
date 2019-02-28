# Rearrange and organization of calculated biogas data prior to analysis 

#----------------

# Bind by rows (cummulative biogas)
cbg.vol$method <- 'vol'
cbg.man$method <- 'man'
cbg.grav$method <- 'grav'
cbg.gd$method <- 'gd'
# cbg.gd1$method <- 'gd1'
# cbg.gd2$method <- 'gd2'
# cbg.gd3$method <- 'gd3'
# cbg.gd4$method <- 'gd4'
# cbg.gd5$method <- 'gd5'
# cbg.gd6$method <- 'gd6'
cbg.gd7$method <- 'gd7'
cbg.gd8$method <- 'gd8'
cbg.gd9$method <- 'gd9'
cbg.gd10$method <- 'gd10'
cbg.gd11$method <- 'gd11'
cbg.gd12$method <- 'gd12'

cbg.all <- biogas:::rbindf(cbg.vol, cbg.man, cbg.grav, cbg.gd, 
                           #cbg.gd1, cbg.gd2, gbg.gd3, cbg.gd4, cbg.gd5, cbg.gd6, 
                           cbg.gd7, cbg.gd8, cbg.gd9, cbg.gd10, cbg.gd11, cbg.gd12)

# Cannot use rbind() because the number of columns do not match, why is it possible to use rbindf()?

# Add substrate type and other needed variables with merge of some columns from setup
cbg.all <- merge(cbg.all, setup[, c('id', 'descrip')], by = 'id')


# Add rsd to data frames
BMP$rsd <- 100 * BMP$sd/BMP$mean
yld$rsd <- 100 * yld$sd/yld$mean

#----------------
# Bind BMPs in columns (original tables are row-binded (yld, BMP,BMPo))
BMP.all <- reshape(data = BMP, 
                   idvar = c('descrip', 'elapsed.time', 'n'), 
                   timevar = 'method',
                   direction = 'wide') 
names(BMP)
names(BMP.all)

# For yield
yld.all <- reshape(data = yld, 
                   idvar = c('descrip', 'elapsed.time', 'n'), 
                   timevar = 'method',
                   direction = 'wide') 
names(yld)
names(yld.all)

# For BMPo
BMPo.all <- reshape(data = BMPo, 
                    idvar = c('id', 'descrip','elapsed.time', 'n'), 
                    timevar = 'method',
                    drop = c('descrip2', 'tare', 'm.inoc', 'm.sub', 'm.water', 'm.tot1', 'm.tot2', 'm.tot', 
                             'm.tot.sd', 'vol.hs', 'conc.sub.vs', 'm.sub.vs'),
                    direction = 'wide') 
