
# Numerical comparison of results

# Calculate difference (compared to manometric method) - WHICH ONE TO COMPARE ALL TOO? man? gd?
BMP.all$man.grav.diff <- BMP.all$mean.man - BMP.all$mean.grav
BMP.all$man.grav.diff.perc <- (BMP.all$man.grav.diff/BMP.all$mean.man)*100

# -----------------

# # Try using ANOVA
# 
# mod.cbg <- aov(mean ~ descrip+method, data = BMP)
# summary(mod.cbg)
# 
# # Check for assumptions for ANOVA
# par(mfrow=c(1,1))
# plot(mod.cbg,1)
# plot(mod.cbg,2)
# plot(mod.cbg,3)
# plot(mod.cbg,4)
# plot(mod.cbg,5)
# plot(mod.cbg,6)
# dev.off()
# 
# hist(BMP$mean)
# 
# # Not quite a normal distributed data set
# # If we end up using an ANOVA some kind of transformation may be needed. 
# 
# # Try making a Tukey test to test if the methods are different from eachother 
# table.Tukey <- TukeyHSD(mod.cbg, "method", conf.level = 0.95)
# 
# png("../plots/Tukey.png", height = 1080/2, width = 1940/3)
# par(mar = c(3, 9, 0.4, 2.1))
# plot(table.Tukey, las = 1, col = "blue", cex.axis = 1.1, font = 1)
# dev.off()
# 
