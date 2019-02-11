
# Rearrange and organization of calculated biogas data prior to analysis 

# Bind by rows
# To make the plot possible grouped by substrate type and ISR and not triplicates a substring is constructud
cbg.grav$grav.subs.type <- substr(cbg.grav$id, 1, 2)
cbg.vol$vol.subs.type <- substr(cbg.vol$id, 1, 2)
cbg.man$man.subs.type <- substr(cbg.man$id, 1, 2)
cbg.gd$gd.subs.type <- substr(cbg.gd$id, 1, 2)

# Add method column in each corrected result
cbg.man.corr$method <- "manometric"
cbg.vol.corr$method <- "volumetric"
cbg.grav.corr$method <- "gravimetric"
cbg.gd.corr$method <- "GD"

# Make result table from all three methods
cbg.all <- rbind(cbg.man.corr, cbg.grav.corr, cbg.vol.corr, cbg.gd.corr)


# Bind by column instead
colnames(cbg.grav.corr) <- paste(colnames(cbg.grav.corr), "grav", sep = "_")
colnames(cbg.vol.corr) <- paste(colnames(cbg.vol.corr), "vol", sep = "_")
colnames(cbg.man.corr) <- paste(colnames(cbg.man.corr), "man", sep = "_")
colnames(cbg.gd.corr) <- paste(colnames(cbg.gd.corr), "gd", sep = "_")

cbg.all.c <- cbind(cbg.man.corr, cbg.grav.corr, cbg.vol.corr, cbg.gd.corr)

# Leaks are a problem we need to deal with
# Just to see it (need to move this code, to leaks.R?)
leaks <- mutate(group_by(biogas, id), leak.m = c(NA, mass.final[-length(mass.final)] - mass.init[-1]))
plot(sort((leaks$leak.m)))
abline(0, 0)