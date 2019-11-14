# Calculate variations between methods

vari <- summarise(group_by(BMP, descrip), 
                           mean.subs = mean(mean),
                           stddev = mean(sd),
                           stderr = mean(se), 
                           min = min(mean),
                           max = max(mean), 
                           diff.perc = (max(mean)-min(mean))/max(mean)*100)

vari.grav.gd3 <- summarise(group_by(BMP.gd3.grav, descrip), 
                  mean.subs = mean(mean),
                  stddev = mean(sd),
                  stderr = mean(se), 
                  min = min(mean),
                  max = max(mean), 
                  diff.perc = (max(mean)-min(mean))/max(mean)*100)

                          
# Variations in gd methods
gd.vari <- summarise(group_by(BMP.gd, descrip), 
            mean.sub = mean(mean),
            min = min(mean),
            max = max(mean), 
            diff.perc = (max(mean)-min(mean))/max(mean)*100)

# Eventually add a variation for gd methods to grav
BMP.all <- reshape(data = BMP, 
                   idvar = c('descrip', 'elapsed.time', 'n', 'leak.l'), 
                   timevar = 'method',
                   direction = 'wide') 

# Plots for comparion all methods
jpeg('../plots/method_comparison_all_methods.png')
par(mfrow=c(4,3))
plot(BMP.all$mean.grav, BMP.all$mean.gd1)         
abline(0,1)
plot(BMP.all$mean.grav, BMP.all$mean.gd2)          
abline(0,1)
plot(BMP.all$mean.grav, BMP.all$mean.gd3)          
abline(0,1)
plot(BMP.all$mean.grav, BMP.all$mean.gd4)          
abline(0,1)
plot(BMP.all$mean.grav, BMP.all$mean.gd5)
abline(0,1)
plot(BMP.all$mean.grav, BMP.all$mean.gd6)          
abline(0,1)
plot(BMP.all$mean.grav, BMP.all$mean.gd7)          
abline(0,1)
plot(BMP.all$mean.grav, BMP.all$mean.gd8)
abline(0,1)
plot(BMP.all$mean.grav, BMP.all$mean.gd9)          
abline(0,1)
plot(BMP.all$mean.grav, BMP.all$mean.gd10)          
abline(0,1)
plot(BMP.all$mean.grav, BMP.all$mean.gd11)          
abline(0,1)
plot(BMP.all$mean.grav, BMP.all$mean.gd12)          
abline(0,1)
dev.off()
