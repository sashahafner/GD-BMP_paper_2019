# Rearrange and organization of calculated biogas data prior to analysis 


#----------------

# Bind by rows
cbg.vol$method <- 'vol'
cbg.man$method <- 'man'
cbg.grav$method <- 'grav'
cbg.gd$method <- 'gd'
cbg.all <- biogas:::rbindf(cbg.vol, cbg.man, cbg.grav, cbg.gd)

# Cannot use rbind() because the number of columns do not match, why is it possible to use rbindf()?

# Add substrate type and other needed variables with merge of some columns from setup (Camilla)
cbg.all <- merge(cbg.all, setup[, c('id', 'descrip')], by = 'id')


# Can do similar with yld, BMPo, BMP results. . . (Camilla)

# To make the plot possible grouped by substrate type and ISR and not triplicates a substring is constructud
#cbg.grav$grav.subs.type <- substr(cbg.grav$id, 1, 2)
#cbg.vol$vol.subs.type <- substr(cbg.vol$id, 1, 2)
#cbg.man$man.subs.type <- substr(cbg.man$id, 1, 2)
#cbg.gd$gd.subs.type <- substr(cbg.gd$id, 1, 2)

# Add method column in each corrected result (BMP)
BMP.vol$method <- 'vol'
BMP.man$method <- 'man'
BMP.grav$method <- 'grav'
BMP.gd$method <- 'gd'

# Make result table from all three methods
BMP.all <- rbind(BMP.man, BMP.grav, BMP.vol, BMP.gd)


# ---- 
# Add method column in each corrected result (BMP.o)
BMPo.vol$method <- 'vol'
BMPo.man$method <- 'man'
BMPo.grav$method <- 'grav'
BMPo.gd$method <- 'gd'

# Make result table from all three methods
BMPo.all <- rbind(BMPo.man, BMPo.grav, BMPo.vol, BMPo.gd)

# Add method column in each corrected result (BMP)
yld.vol$method <- 'vol'
yld.man$method <- 'man'
yld.grav$method <- 'grav'
yld.gd$method <- 'gd'

# Make result table from all three methods
yld.all <- rbind(BMP.man, BMP.grav, BMP.vol, BMP.gd)


#----------------
# Bind by column instead
# Better to do reshape or spread() operation I think
colnames(BMP.grav) <- paste(colnames(BMP.grav), "grav", sep = "_")
colnames(BMP.vol) <- paste(colnames(BMP.vol), "vol", sep = "_")
colnames(BMP.man) <- paste(colnames(BMP.man), "man", sep = "_")
colnames(BMP.gd) <- paste(colnames(BMP.gd), "gd", sep = "_")

BMP.all.c <- cbind(BMP.man, BMP.grav, BMP.vol, BMP.gd)

# Maybe do this for other cases too. 


#----------------
# Leaks are a problem we need to deal with
# Just to see it (need to move this code, to leaks.R?)
leaks <- mutate(group_by(biogas, id), leak.m = c(NA, mass.final[-length(mass.final)] - mass.init[-1]))
plot(sort((leaks$leak.m)))
abline(0, 0)
