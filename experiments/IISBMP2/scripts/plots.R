# Plots

# Some other possibilities . . .
cbg.all$pid <- interaction(cbg.all$id, cbg.all$method)
ggplot(cbg.all, aes(elapsed.time, cvCH4, group = pid)) +
  geom_line(aes(colour = method)) +
  facet_wrap(~ descrip)
ggsave('../plots/cum_CH4.png')

# More interesting with yld
yld$pid <- interaction(yld$descrip, yld$method)
ggplot(yld, aes(elapsed.time, mean, group = pid)) +
  geom_line(aes(colour = method)) +
  facet_wrap(~ descrip)
ggsave('../plots/yld.interaction.png')


# Plot of data before corrected for inoculum (grav)
ggplot(cbg.grav, aes(elapsed.time, cvCH4, colour = id )) +
  geom_point() +
  geom_line() + 
  ggtitle("Gravimetric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/gravimetric_biogas.png')

# Plot of data before corrected for inoculum (vol)
ggplot(cbg.vol, aes(elapsed.time, cvCH4, colour = id )) +
  geom_point() +
  geom_line() + 
  ggtitle("Volumetric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/volumetric_biogas.png')

# Plot of data before corrected for inoculum (GD)
ggplot(cbg.gd, aes(elapsed.time, cvCH4, colour = id )) +
  geom_point() +
  geom_line() + 
  ggtitle("GD Method") +
  labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/GD_biogas.png')


# ----------------------

# Plot mean data for each substrate (with ino and substrate correction) 

ggplot(BMP, aes(method, mean, colour = descrip)) + 
         geom_point() + geom_line(aes(group = descrip)) + 
         geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
         position=position_dodge(0.05)) + 
         labs(x = 'Method', y = 'Mean Cumulative CH4 [mL]', colour = 'Description')  + 
         theme_bw() + 
         theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP.png')


# Plot with reverse of method/descrip
ggplot(BMP, aes(descrip, mean, colour = method)) +
  geom_point() + geom_line(aes(group = method)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_reverse.png')

# Extra: Plot mean data for each substrate (with ino and substrate correction) - But change to get the full amount of bottles


# ----------------------

# Plots for method comparison directly
jpeg('../plots/method_comparison_to_GD.png')
par(mfrow=c(2,1))
plot(BMP.all$mean.gd, BMP.all$mean.grav)         
abline(0,1)
plot(BMP.all$mean.gd, BMP.all$mean.vol)
abline(0,1)
dev.off()

# Plots for comparion all methods
jpeg('../plots/method_comparison_all_methods.png')
par(mfrow=c(3,1))
plot(BMP.all$mean.gd, BMP.all$mean.grav)
abline(0,1)
plot(BMP.all$mean.gd, BMP.all$mean.vol)         
abline(0,1)
plot(BMP.all$mean.vol, BMP.all$mean.grav)
abline(0,1)
dev.off()


# # Plots
# ggplot(cbg.gd, aes(elapsed.time, cvCH4, colour = id)) + 
#   geom_line() + geom_point()  
# ggsave('../plots/cvCH4_gd.png')
# 
# ggplot(yld, aes(time.d, cvCH4, colour = substrate, group = id)) + 
#   geom_line() + geom_point() + labs(x = 'Time (d)', y = 'CH4 yield (mL/g)', colour = 'Substrate')
# ggsave('../plots/yield_gd.png')
# 
# ggplot(rates, aes(time.d, log10(rrvCH4), colour = id)) + 
#   geom_line() + geom_point()  + geom_hline(yintercept = log10(c(1, 0.5)))
# ggsave('../plots/rrates.png')

ggplot(yld, aes(elapsed.time, mean, colour = descrip))  + geom_point() + labs(x = 'Time (d)', y = 'CH4 yield (mL/g)', colour = 'descrip')
ggsave('../plots/yield_gd.png')
