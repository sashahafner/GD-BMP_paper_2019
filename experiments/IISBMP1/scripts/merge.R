# Rearrange and organization of calculated biogas data prior to analysis 

#----------------

# Bind by rows
# cbg.vol$method <- 'vol'
# cbg.man$method <- 'man'
cbg.grav$method <- 'grav'
# cbg.gd$method <- 'gd'
cbg.gd01$method <- 'gd01'
cbg.gd02$method <- 'gd02'
cbg.gd03$method <- 'gd03'
cbg.gd04$method <- 'gd04'
cbg.gd05$method <- 'gd05'
cbg.gd06$method <- 'gd06'
cbg.gd07$method <- 'gd07'
cbg.gd08$method <- 'gd08'
cbg.gd09$method <- 'gd09'
cbg.gd10$method <- 'gd10'
cbg.gd11$method <- 'gd11'
cbg.gd12$method <- 'gd12'

cbg.all <- biogas:::rbindf(#cbg.vol, cbg.man, 
  cbg.grav, 
  # cbg.gd, 
                           cbg.gd01, cbg.gd02, cbg.gd03,
                           cbg.gd04, 
                           cbg.gd05, 
                           cbg.gd06,
                           cbg.gd07,
                           cbg.gd08,
                           cbg.gd09, cbg.gd10, cbg.gd11, cbg.gd12
                           )


# Cannot use rbind() because the number of columns do not match, why is it possible to use rbindf()?

# Add substrate type and other needed variables with merge of some columns from setup
# cbg.all <- merge(cbg.all, id.exper, by = c('id.exper'))
                 
                
#----------------
# Bind by column instead

# First, make a data frame containing descrip: 
# id.descrip <- setup[, c('id', 'descrip')]
# biogas.BMP <- merge(biogas, id.descrip, by = 'id')
# biogas.BMP1 <- merge(biogas.BMP, BMP, by = 'descrip')

#biogas.BMP1 <- biogas.BMP1[ , c('method', 'id', 'descrip', 'elapsed.time', 'mean', 'sd', 'se', 'n', 'id.exper')]

# Add rsd to data frames
# BMP$rsd <- 100 * BMP$sd/BMP$mean
# yld$rsd <- 100 * yld$sd/yld$mean
# BMP1$rsd <- 100 * BMP1$sd/BMP1$mean
# yld1$rsd <- 100 * yld1$sd/yld1$mean
BMP2$rsd <- 100 * BMP2$sd/BMP2$mean
yld2$rsd <- 100 * yld2$sd/yld2$mean

# Reshaping into column structures instead
# BMP.all <- reshape(data = BMP, 
#               idvar = c('descrip', 'exper', 'elapsed.time', 'n'), 
#               timevar = 'method',
#               direction = 'wide') 
# names(BMP)
# names(BMP.all)
# 
# # For BMPo
# BMPo.all <- reshape(data = BMPo, 
#                         idvar = c('id', 'exper', 'elapsed.time', 'n'), 
#                         timevar = 'method',
#                         drop = c('descrip2', 'tare', 'm.inoc', 'm.sub', 'm.water', 'm.tot1', 'm.tot2', 'm.tot', 
#                              'm.tot.sd', 'vol.hs', 'conc.sub.vs', 'm.sub.vs'),
#                         direction = 'wide') 
# 
# # For yield
# yld.all <- reshape(data = yld, 
#                         idvar = c('descrip','exper', 'elapsed.time', 'n'), 
#                         timevar = 'method',
#                         direction = 'wide') 
# names(yld)
# names(yld.all)
# 
