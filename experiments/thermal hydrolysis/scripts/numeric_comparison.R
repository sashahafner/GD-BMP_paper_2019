
# Numerical comparison of results

# Check if all elapsed time columns are identical
all(cbg.all.c$elapsed.time_man == cbg.all.c$elapsed.time_grav)
all(cbg.all.c$elapsed.time_man == cbg.all.c$elapsed.time_vol)
all(cbg.all.c$elapsed.time_man == cbg.all.c$elapsed.time_gd)

# Check if all n columns are identical
all(cbg.all.c$n_man == cbg.all.c$n_man)
all(cbg.all.c$n_man == cbg.all.c$n_vol)
all(cbg.all.c$n_man == cbg.all.c$n_gd)

cbg.all.c <- subset(cbg.all.c, select = -c(elapsed.time_grav, elapsed.time_vol, elapsed.time_gd, 
                                           descrip_grav, descrip_vol, descrip_gd, 
                                           method_man, method_grav, method_vol, method_gd, 
                                           n_man, n_grav, n_vol, n_gd))

 
# Calculate difference (compared to manometric method) - WHICH ONE TO COMPARE ALL TOO? man? gd?
cbg.all.c$man.grav.diff <- cbg.all.c$mean_man - cbg.all.c$mean_grav
cbg.all.c$man.vol.diff <- cbg.all.c$mean_man - cbg.all.c$mean_vol
cbg.all.c$man.gd.diff <- cbg.all.c$mean_man - cbg.all.c$mean_gd

cbg.diff <- subset(cbg.all.c, select = c(descrip_man, man.grav.diff, man.vol.diff, man.gd.diff))





# ----------------
# ANOVA
# mod.BMP <- aov(mean ~ descrip*method, data = cbg.all)
# summary(mod.BMP)
# mod.BMP
