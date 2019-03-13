# Calculate variations between methods

vari <- summarise(group_by(BMP.gd03.06.grav, descrip), 
                           mean.subs = mean(mean),
                           stddev = mean(sd),
                           stderr = mean(se), 
                           min = min(mean),
                           max = max(mean), 
                           diff.perc = (max(mean)-min(mean))/max(mean)*100)

# Maximum variation between grav, gd03 and gd06: 
overall <- max(vari$diff.perc)
                          
# Variations in gd methods
BMP.gd03.06 <- subset(BMP.gd03.06.grav, !method == 'grav')
gd.vari <- summarise(group_by(BMP.gd03.06, descrip), 
            mean.sub = mean(mean),
            min = min(mean),
            max = max(mean), 
            diff.perc = (max(mean)-min(mean))/max(mean)*100)
# Maximum variation between gd03 and gd06: 
gd.03.06 <- c(max(gd.vari$diff.perc))

BMP.gd03.grav <- subset(BMP, method == 'grav' | method == 'gd03')
vari.grav.gd03 <- summarise(group_by(BMP.gd03.grav, descrip), 
                           mean.subs = mean(mean),
                           stddev = mean(sd),
                           stderr = mean(se), 
                           min = min(mean),
                           max = max(mean), 
                           diff.perc = (max(mean)-min(mean))/max(mean)*100)
# Maximum variation between gd03 and grav: 
gd.03.grav <- max(vari.grav.gd03$diff.perc)

BMP.gd06.grav <- subset(BMP, method == 'grav' | method == 'gd06')
vari.grav.gd06 <- summarise(group_by(BMP.gd06.grav, descrip), 
                            mean.subs = mean(mean),
                            stddev = mean(sd),
                            stderr = mean(se), 
                            min = min(mean),
                            max = max(mean), 
                            diff.perc = (max(mean)-min(mean))/max(mean)*100)
# Maximum variation between gd03 and grav: 
gd.06.grav <- max(vari.grav.gd06$diff.perc)


# Make table of variations
max.variation <- c('maximum variation')
variations <- data.frame('maximum variation', gd.03.06, gd.03.grav, gd.06.grav, overall)

# Eventually add a variation for gd methods to grav
BMP.all <- reshape(data = BMP, 
                   idvar = c('descrip', 'elapsed.time', 'n', 'leak.l'), 
                   timevar = 'method',
                   direction = 'wide') 

# # Plots for comparion all methods
# jpeg('../plots/method_comparison_all_methods.png')
# par(mfrow=c(4,3))
# plot(BMP.all$mean.grav, BMP.all$mean.gd1)         
# abline(0,1)
# plot(BMP.all$mean.grav, BMP.all$mean.gd2)          
# abline(0,1)
# plot(BMP.all$mean.grav, BMP.all$mean.gd3)          
# abline(0,1)
# plot(BMP.all$mean.grav, BMP.all$mean.gd4)          
# abline(0,1)
# plot(BMP.all$mean.grav, BMP.all$mean.gd5)
# abline(0,1)
# plot(BMP.all$mean.grav, BMP.all$mean.gd6)          
# abline(0,1)
# plot(BMP.all$mean.grav, BMP.all$mean.gd7)          
# abline(0,1)
# plot(BMP.all$mean.grav, BMP.all$mean.gd8)
# abline(0,1)
# plot(BMP.all$mean.grav, BMP.all$mean.gd9)          
# abline(0,1)
# plot(BMP.all$mean.grav, BMP.all$mean.gd10)          
# abline(0,1)
# plot(BMP.all$mean.grav, BMP.all$mean.gd11)          
# abline(0,1)
# plot(BMP.all$mean.grav, BMP.all$mean.gd12)          
# abline(0,1)
# dev.off()
