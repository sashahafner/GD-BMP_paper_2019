
# Numerical comparison of results

# Check if all elapsed time columns are identical
# all(BMP.all$elapsed.time.man == BMP.all$elapsed.time_grav)
# all(BMP.all$elapsed.time_man == BMP.all$elapsed.time_vol)
# all(BMP.all.c$elapsed.time_man == BMP.all.c$elapsed.time_gd)
# 
# 
# # Check if all n columns are identical
# all(BMP.all.c$n_man == BMP.all.c$n_man)
# all(BMP.all.c$n_man == BMP.all.c$n_vol)
# all(BMP.all.c$n_man == BMP.all.c$n_gd)

BMP.all.c$descrip <- BMP.all.c$descrip_man
BMP.all.c$elapsed.time <- BMP.all.c$elapsed.time_man

BMP.all.c <- subset(BMP.all.c, select = -c(elapsed.time_man, elapsed.time_grav, elapsed.time_vol, elapsed.time_gd, 
                                           descrip_man, descrip_grav, descrip_vol, descrip_gd, 
                                           method_man, method_grav, method_vol, method_gd, 
                                           n_man, n_grav, n_vol, n_gd))

 
# Calculate difference (compared to manometric method) - WHICH ONE TO COMPARE ALL TOO? man? gd?
BMP.all.c$man.grav.diff <- BMP.all.c$mean_man - BMP.all.c$mean_grav
BMP.all.c$man.vol.diff <- BMP.all.c$mean_man - BMP.all.c$mean_vol
BMP.all.c$man.gd.diff <- BMP.all.c$mean_man - BMP.all.c$mean_gd

cbg.diff <- subset(BMP.all.c, select = c(descrip, man.grav.diff, man.vol.diff, man.gd.diff))


# -----------------

# Try using ANOVA

mod.cbg <- aov(mean ~ descrip+method, data = BMP.all)
summary(mod.cbg)

# Check for assumptions for ANOVA
par(mfrow=c(1,1))
plot(mod.cbg,1)
plot(mod.cbg,2)
plot(mod.cbg,3)
plot(mod.cbg,4)
plot(mod.cbg,5)
plot(mod.cbg,6)
dev.off()

hist(BMP.all$mean)

# Not quite a normal distributed data set
# If we end up using an ANOVA some kind of transformation may be needed. 

# Try making a Tukey test to test if the methods are different from eachother 
table.Tukey <- TukeyHSD(mod.cbg, "method", conf.level = 0.95)

png("../plots/Tukey.png", height = 1080/2, width = 1940/3)
par(mar = c(3, 9, 0.4, 2.1))
plot(table.Tukey, las = 1, col = "blue", cex.axis = 1.1, font = 1)
dev.off()

