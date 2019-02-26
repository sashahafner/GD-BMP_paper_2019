# Plots

# Some other possibilities . . .
cbg.all$pid <- interaction(cbg.all$id.exper, cbg.all$method)
ggplot(cbg.all, aes(elapsed.time, cvCH4, group = pid)) +
  geom_line(aes(colour = method)) +
  facet_wrap(~ descrip)
ggsave('../plots/cum_CH4.png')

# # More interesting with yld
yld1$pid <- interaction(yld1$descrip, yld1$method)
ggplot(yld1, aes(elapsed.time, mean, group = pid)) +
  geom_line(aes(colour = method)) +
  facet_wrap(~ descrip)
ggsave('../plots/yld.interaction_exper1.png')

yld2$pid <- interaction(yld2$descrip, yld2$method)
ggplot(yld2, aes(elapsed.time, mean, group = pid)) +
  geom_line(aes(colour = method)) +
  facet_wrap(~ descrip)
ggsave('../plots/yld.interaction_exper2.png')


# Plot of data before corrected for inoculum (grav) - maybe change coloring for descrip (need to add descrip column)
ggplot(cbg.grav.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Gravimetric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/gravimetric_biogas_exper1.png')

# Plot of data before corrected for inoculum (vol)
ggplot(cbg.vol.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Volumetric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/volumetric_biogas_exper1.png')

# Plot of data before corrected for inoculum (man)
ggplot(cbg.man.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Manometric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/manometric_biogas_exper1.png')

# Plot of data before corrected for inoculum (GD)
ggplot(cbg.gd.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("GD Method") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/GD_biogas_exper1.png')


# All plots above are made for experiment 1, not 2 
# for exper 2
# Plot of data before corrected for inoculum (grav) - maybe change coloring for descrip (need to add descrip column)
ggplot(cbg.grav.list[[2]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Gravimetric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/gravimetric_biogas_exper2.png')

# Plot of data before corrected for inoculum (vol)
ggplot(cbg.vol.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Volumetric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/volumetric_biogas_exper2.png')

# Plot of data before corrected for inoculum (man)
ggplot(cbg.man.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Manometric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/manometric_biogas_exper2.png')

# Plot of data before corrected for inoculum (GD)
ggplot(cbg.gd.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("GD Method") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/GD_biogas_exper2.png')


# ----------------------

# Plot mean data for each substrate (with ino and substrate correction) 
ggplot(BMP1, aes(method, mean, colour = descrip)) + 
         geom_point() + geom_line(aes(group = descrip)) + 
         geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
         position=position_dodge(0.05)) + 
         labs(x = 'Method', y = 'Mean Cumulative CH4 [mL]', colour = 'Description')  + 
         theme_bw() + 
         theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_exper1.png')

ggplot(BMP2, aes(method, mean, colour = descrip)) + 
  geom_point() + geom_line(aes(group = descrip)) + 
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) + 
  labs(x = 'Method', y = 'Mean Cumulative CH4 [mL]', colour = 'Description')  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_exper2.png')

# Plot with reverse of method/descrip [1]
ggplot(BMP1, aes(descrip, mean, colour = method)) +
  geom_point() + geom_line(aes(group = method)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_reverse_exper1.png')

# Plot with reverse of method/descrip [2]
ggplot(BMP2, aes(descrip, mean, colour = method)) +
  geom_point() + geom_line(aes(group = method)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_reverse_exper2.png')

# Barplot option

BMP1$lwr <- BMP1$mean - BMP1$sd
BMP1$upr <- BMP1$mean + BMP1$sd
ggplot(BMP1) +
    geom_col(aes(descrip, mean, fill = method), position = 'dodge', colour  = 'black') +
    geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method), position = 'dodge', colour = 'gray55') +
    #facet_grid(. ~ exper, scales = 'free_x') +
    labs(x = 'Substrate', y = expression('BMP'~(mL~g^'-1')), fill = 'Method') +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
    #theme_bw() + scale_fill_manual(values = c('gray65', 'gray95'))  +
    #theme(legend.position = 'none')
ggsave('../plots/BMP1_comp_bars.pdf', height = 6, width = 6, scale = 1.2)

BMP2$lwr <- BMP2$mean - BMP2$sd
BMP2$upr <- BMP2$mean + BMP2$sd
ggplot(BMP2) +
    geom_col(aes(descrip, mean, fill = method), position = 'dodge', colour  = 'black') +
    geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method), position = 'dodge', colour = 'gray55') +
    #facet_grid(. ~ exper, scales = 'free_x') +
    labs(x = 'Substrate', y = expression('BMP'~(mL~g^'-1')), fill = 'Method') +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
    #theme_bw() + scale_fill_manual(values = c('gray65', 'gray95'))  +
    #theme(legend.position = 'none')
ggsave('../plots/BMP2_comp_bars.pdf', height = 6, width = 6, scale = 1.2)

# Extra: Plot mean data for each substrate (with ino and substrate correction) - But change to get the full amount of bottles


# ----------------------

# Plots for method comparison directly
plot(BMP.all$mean.gd, BMP.all$mean.grav)         # Seems to be no relation to grav
plot(BMP.all$mean.gd, BMP.all$mean.man)          # Looks okay similar to man
plot(BMP.all$mean.gd, BMP.all$mean.vol)          # Looks okay similar to vol

plot(BMP.all$mean.vol, BMP.all$mean.man)
plot(BMP.all$mean.vol, BMP.all$mean.grav)

plot(BMP.all$mean.man, BMP.all$mean.grav)


# Plots for method comparison directly
jpeg('../plots/method_comparison_to_GD.png')
par(mfrow=c(3,1))
plot(BMP.all$mean.gd, BMP.all$mean.grav)        
abline(0,1)
plot(BMP.all$mean.gd, BMP.all$mean.man)         
abline(0,1)
plot(BMP.all$mean.gd, BMP.all$mean.vol)         
abline(0,1)
dev.off()

# Plots for comparion all methods
jpeg('../plots/method_comparison_all_methods.png')
par(mfrow=c(3,2))
plot(BMP.all$mean.gd, BMP.all$mean.grav)         
abline(0,1)
plot(BMP.all$mean.gd, BMP.all$mean.man)          
abline(0,1)
plot(BMP.all$mean.gd, BMP.all$mean.vol)          
abline(0,1)
plot(BMP.all$mean.vol, BMP.all$mean.man)
abline(0,1)
plot(BMP.all$mean.vol, BMP.all$mean.grav)
abline(0,1)
plot(BMP.all$mean.man, BMP.all$mean.grav)
abline(0,1)
dev.off()

# Divided into each expriment
BMP.all.1 <- subset(BMP.all, exper == 1)
BMP.all.2 <- subset(BMP.all, exper == 2)

# Experiment 1
# Plots for method comparison directly
jpeg('../plots/method_comparison_to_GD_exper1.png')
par(mfrow=c(3,1))
plot(BMP.all.1$mean.gd, BMP.all.1$mean.grav)        
abline(0,1)
plot(BMP.all.1$mean.gd, BMP.all.1$mean.man)          
abline(0,1)
plot(BMP.all.1$mean.gd, BMP.all.1$mean.vol)          
abline(0,1)
dev.off()

# Plots for comparion all methods
jpeg('../plots/method_comparison_all_method_exper1.png')
par(mfrow=c(3,2))
plot(BMP.all.1$mean.gd, BMP.all.1$mean.grav)         
abline(0,1)
plot(BMP.all.1$mean.gd, BMP.all.1$mean.man)          
abline(0,1)
plot(BMP.all.1$mean.gd, BMP.all.1$mean.vol)          
abline(0,1)
plot(BMP.all.1$mean.vol, BMP.all.1$mean.man)
abline(0,1)
plot(BMP.all.1$mean.vol, BMP.all.1$mean.grav)
abline(0,1)
plot(BMP.all.1$mean.man, BMP.all.1$mean.grav)
abline(0,1)
dev.off()

# Experiment 2
# Plots for method comparison directly
jpeg('../plots/method_comparison_to_GD_exper2.png')
par(mfrow=c(3,1))
plot(BMP.all.2$mean.gd, BMP.all.2$mean.grav)        
abline(0,1)
plot(BMP.all.2$mean.gd, BMP.all.2$mean.man)          
abline(0,1)
plot(BMP.all.2$mean.gd, BMP.all.2$mean.vol)          
abline(0,1)
dev.off()

# Plots for comparion all methods
jpeg('../plots/method_comparison_all_method_exper2.png')
par(mfrow=c(3,2))
plot(BMP.all.2$mean.gd, BMP.all.2$mean.grav)         
abline(0,1)
plot(BMP.all.2$mean.gd, BMP.all.2$mean.man)          
abline(0,1)
plot(BMP.all.2$mean.gd, BMP.all.2$mean.vol)          
abline(0,1)
plot(BMP.all.2$mean.vol, BMP.all.2$mean.man)
abline(0,1)
plot(BMP.all.2$mean.vol, BMP.all.2$mean.grav)
abline(0,1)
plot(BMP.all.2$mean.man, BMP.all.2$mean.grav)
abline(0,1)
dev.off()

