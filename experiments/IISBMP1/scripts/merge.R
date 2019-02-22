# Rearrange and organization of calculated biogas data prior to analysis 

#----------------

# Bind by rows
cbg.vol$method <- 'vol'
cbg.man$method <- 'man'
cbg.grav$method <- 'grav'
cbg.gd1$method <- 'gd'

cbg.all <- biogas:::rbindf(cbg.vol, cbg.man, cbg.grav, cbg.gd1)

# Cannot use rbind() because the number of columns do not match, why is it possible to use rbindf()?

# Add substrate type and other needed variables with merge of some columns from setup
cbg.all <- merge(cbg.all, setup[, c('id', 'descrip')], by = 'id')


#----------------
# Bind by column instead

# First, make a data frame containing descrip: 
# id.descrip <- setup[, c('id', 'descrip')]
# biogas.BMP <- merge(biogas, id.descrip, by = 'id')
# biogas.BMP1 <- merge(biogas.BMP, BMP, by = 'descrip')

#biogas.BMP1 <- biogas.BMP1[ , c('method', 'id', 'descrip', 'elapsed.time', 'mean', 'sd', 'se', 'n', 'id.exper')]


# Reshaping into column structures instead

BMP.all <- reshape(data = BMP, 
              idvar = c('descrip', 'exper', 'elapsed.time', 'n'), 
              timevar = 'method',
              direction = 'wide') 
names(BMP)
names(BMP.all)

# For BMPo
BMPo.all <- reshape(data = BMPo, 
                        idvar = c('id', 'exper', 'elapsed.time', 'n'), 
                        timevar = 'method',
                        direction = 'wide') 

# For yield
yld.all <- reshape(data = yld, 
                        idvar = c('descrip','exper', 'elapsed.time', 'n'), 
                        timevar = 'method',
                        direction = 'wide') 
names(yld)
names(yld.all)
