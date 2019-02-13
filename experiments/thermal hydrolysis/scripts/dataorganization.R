
# Rearrange and organization of calculated biogas data prior to analysis 


#----------------

# Bind by rows
# To make the plot possible grouped by substrate type and ISR and not triplicates a substring is constructud
cbg.grav$grav.subs.type <- substr(cbg.grav$id, 1, 2)
cbg.vol$vol.subs.type <- substr(cbg.vol$id, 1, 2)
cbg.man$man.subs.type <- substr(cbg.man$id, 1, 2)
cbg.gd$gd.subs.type <- substr(cbg.gd$id, 1, 2)

# Add method column in each corrected result
BMP.man$method <- "manometric"
BMP.vol$method <- "volumetric"
BMP.grav$method <- "gravimetric"
BMP.gd$method <- "GD"

# Make result table from all three methods
BMP.all <- rbind(BMP.man, BMP.grav, BMP.vol, BMP.gd)


#----------------

# Bind by column instead
colnames(BMP.grav) <- paste(colnames(BMP.grav), "grav", sep = "_")
colnames(BMP.vol) <- paste(colnames(BMP.vol), "vol", sep = "_")
colnames(BMP.man) <- paste(colnames(BMP.man), "man", sep = "_")
colnames(BMP.gd) <- paste(colnames(BMP.gd), "gd", sep = "_")

BMP.all.c <- cbind(BMP.man, BMP.grav, BMP.vol, BMP.gd)


#----------------
# Leaks are a problem we need to deal with
# Just to see it (need to move this code, to leaks.R?)
leaks <- mutate(group_by(biogas, id), leak.m = c(NA, mass.final[-length(mass.final)] - mass.init[-1]))
plot(sort((leaks$leak.m)))
abline(0, 0)
