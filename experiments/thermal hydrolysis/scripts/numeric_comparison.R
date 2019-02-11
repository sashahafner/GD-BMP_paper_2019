
# Numerical comparison of results

# Check if all elapsed time columns are identical
all(cbg.all.c$elapsed.time_man == cbg.all.c$elapsed.time_grav)
all(cbg.all.c$elapsed.time_man == cbg.all.c$elapsed.time_vol)
all(cbg.all.c$elapsed.time_man == cbg.all.c$elapsed.time_gd)


# Check if all n columns are identical
all(cbg.all.c$n_man == cbg.all.c$n_man)
all(cbg.all.c$n_man == cbg.all.c$n_vol)
all(cbg.all.c$n_man == cbg.all.c$n_gd)

cbg.all.c$descrip <- cbg.all.c$descrip_man
cbg.all.c$elapsed.time <- cbg.all.c$elapsed.time_man

cbg.all.c <- subset(cbg.all.c, select = -c(elapsed.time_man, elapsed.time_grav, elapsed.time_vol, elapsed.time_gd, 
                                           descrip_man, descrip_grav, descrip_vol, descrip_gd, 
                                           method_man, method_grav, method_vol, method_gd, 
                                           n_man, n_grav, n_vol, n_gd))

 
# Calculate difference (compared to manometric method) - WHICH ONE TO COMPARE ALL TOO? man? gd?
cbg.all.c$man.grav.diff <- cbg.all.c$mean_man - cbg.all.c$mean_grav
cbg.all.c$man.vol.diff <- cbg.all.c$mean_man - cbg.all.c$mean_vol
cbg.all.c$man.gd.diff <- cbg.all.c$mean_man - cbg.all.c$mean_gd

cbg.diff <- subset(cbg.all.c, select = c(descrip, man.grav.diff, man.vol.diff, man.gd.diff))


# -----------------

# Try using ANOVA

mod.cbg <- aov(mean ~ descrip+method, data = cbg.all)
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

hist(cbg.all$mean)

# Not quite a normal distributed data set
# If we end up using an ANOVA some kind of transformation may be needed. 

# Try making a Tukey test to test if the methods are different from eachother 
table.Tukey <- TukeyHSD(mod.cbg, "method", conf.level = 0.95)

png("../plots/Tukey.png", height = 1080/2, width = 1940/3)

par(mar = c(3, 9, 0.4, 2.1))
plot(table.Tukey, las = 1, col = "blue", cex.axis = 1.1, font = 1)

dev.off()

