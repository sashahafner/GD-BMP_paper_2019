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
# Better to do reshape or spread() operation I think
# colnames(BMP.grav) <- paste(colnames(BMP.grav), "grav", sep = "_")
# colnames(BMP.vol) <- paste(colnames(BMP.vol), "vol", sep = "_")
# colnames(BMP.man) <- paste(colnames(BMP.man), "man", sep = "_")
# colnames(BMP.gd) <- paste(colnames(BMP.gd), "gd", sep = "_")
# 
# BMP.all.c <- cbind(BMP.man, BMP.grav, BMP.vol, BMP.gd)

# Maybe do this for other cases too. 

# library(tidyr)
# BMP.c <- spread(BMP, method)

reshape(BMP, varying = "method", direction = "wide") 
names(BMP)

#----------------
# Leaks are a problem we need to deal with
# Just to see it (need to move this code, to leaks.R?)
leaks <- mutate(group_by(biogas, id), leak.m = c(NA, mass.final[-length(mass.final)] - mass.init[-1]))
plot(sort((leaks$leak.m)))
abline(0, 0)
