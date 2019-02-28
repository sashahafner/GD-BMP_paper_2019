# Rearrange and organization of calculated biogas data prior to analysis 

#----------------

# Bind by rows
cbg.man$method <- 'man'
cbg.grav$method <- 'grav'

cbg.all <- biogas:::rbindf(cbg.man, cbg.grav)

# Cannot use rbind() because the number of columns do not match, why is it possible to use rbindf()?

# Add substrate type and other needed variables with merge of some columns from setup
cbg.all <- merge(cbg.all, setup[, c('id', 'descrip')], by = 'id')

# Add rsd to data frames
BMP$rsd <- 100 * BMP$sd/BMP$mean
yld$rsd <- 100 * yld$sd/yld$mean

#----------------
# Bind by column instead

# Reshaping into column structures instead
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
names(BMP)
names(yld.all)

# For BMPo
BMPo.all <- reshape(data = BMPo, 
                    idvar = c('id', 'elapsed.time', 'n'), 
                    timevar = 'method',
                    drop = c('descrip2', 'tare', 'm.inoc', 'm.sub', 'm.water', 'm.tot1', 'm.tot2', 'm.tot', 
                             'm.tot.sd', 'vol.hs', 'conc.sub.vs', 'm.sub.vs'),
                    direction = 'wide') 

#----------------
# Leaks are a problem we need to deal with
# Just to see it (need to move this code, to leaks.R?)
leaks <- mutate(group_by(biogas, id), leak.m = c(NA, mass.final[-length(mass.final)] - mass.init[-1]))
plot(sort((leaks$leak.m)))
abline(0, 0)
