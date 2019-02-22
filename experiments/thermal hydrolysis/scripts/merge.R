# Rearrange and organization of calculated biogas data prior to analysis 

#----------------

# Bind by rows (cummulative biogas)
cbg.vol$method <- 'vol'
cbg.man$method <- 'man'
cbg.grav$method <- 'grav'
cbg.gd1$method <- 'gd'

cbg.all <- biogas:::rbindf(cbg.vol, cbg.man, cbg.grav, cbg.gd1)

# Cannot use rbind() because the number of columns do not match, why is it possible to use rbindf()?

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
