# Rearrange and organization of calculated biogas data prior to analysis 

#----------------

# Bind by rows (cummulative biogas)
cbg.vol$method <- 'vol'
cbg.grav$method <- 'grav'
cbg.gd$method <- 'gd'

cbg.all <- biogas:::rbindf(cbg.vol, cbg.grav, cbg.gd)

# Add substrate type and other needed variables with merge of some columns from setup
cbg.all <- merge(cbg.all, setup[, c('id', 'descrip')], by = 'id')


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
                    idvar = c('id', 'elapsed.time', 'n'), 
                    timevar = 'method',
                    direction = 'wide') 

BMP.all.1p3d <- reshape(data = BMP.1p3d, 
                   idvar = c('descrip', 'elapsed.time', 'n'), 
                   timevar = 'method',
                   direction = 'wide') 
