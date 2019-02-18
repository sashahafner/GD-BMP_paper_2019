# Rearrange and organization of calculated biogas data prior to analysis 

#----------------

# Bind by rows
cbg.vol$method <- 'vol'
cbg.man$method <- 'man'
cbg.grav$method <- 'grav'
cbg.gd$method <- 'gd'

cbg.all <- biogas:::rbindf(cbg.vol, cbg.man, cbg.grav, cbg.gd)

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

reshaped.BMP <- reshape(data = biogas.BMP, 
              idvar = c('id.exper', 'elapsed.time', 'n'), 
              timevar = 'method',
              direction = 'wide') 
names(BMP)
names(reshaped.BMP)

# For yield
reshaped.yld <- reshape(data = yld, 
                        idvar = c('descrip', 'elapsed.time', 'n'), 
                        timevar = 'method',
                        direction = 'wide') 
names(BMP)
names(reshaped.yld)

# For BMPo


#----------------
# Leaks are a problem we need to deal with
# Just to see it (need to move this code, to leaks.R?)
leaks <- mutate(group_by(biogas, id), leak.m = c(NA, mass.final[-length(mass.final)] - mass.init[-1]))
plot(sort((leaks$leak.m)))
abline(0, 0)
