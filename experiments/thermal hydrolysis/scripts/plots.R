# Plots

# Plot of data before corrected for inoculum (grav)
ggplot(cbg.grav, aes(elapsed.time, cvCH4, colour = grav.subs.type, group = id )) +
  geom_point() +
  geom_line() + 
  ggtitle("Gravimetric") +
  labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/gravimetric_biogas.png')

# Plot of data before corrected for inoculum (vol)
ggplot(cbg.vol, aes(elapsed.time, cvCH4, colour = vol.subs.type, group = id )) +
  geom_point() +
  geom_line() + 
  ggtitle("Volumetric") +
  labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/volumetric_biogas.png')

# Plot of data before corrected for inoculum (man)
ggplot(cbg.man, aes(elapsed.time, cvCH4, colour = man.subs.type, group = id )) +
  geom_point() +
  geom_line() + 
  ggtitle("Manometric") +
  labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/manometric_biogas.png')

# Plot of data before corrected for inoculum (GD)
ggplot(cbg.gd, aes(elapsed.time, cvCH4, colour = gd.subs.type, group = id )) +
  geom_point() +
  geom_line() + 
  ggtitle("GD Method") +
  labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/GD_biogas.png')



# ----------------------

# Plot mean data for each substrate (with ino and substrate correction) 

ggplot(BMP.all, aes(method, mean, colour = descrip)) + 
         geom_point() + geom_line(aes(group = descrip)) + 
         geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
         position=position_dodge(0.05)) + 
         labs(x = 'Method', y = 'Mean Cumulative CH4 [mL]', colour = 'Description')  + 
         theme_bw() + 
         theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP.png')


# Plot with reverse of method/descrip
ggplot(BMP.all, aes(descrip, mean, colour = method)) +
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
plot(BMP.all.c$mean_gd, BMP.all.c$mean_grav)         # Seems to be no relation to grav
plot(BMP.all.c$mean_gd, BMP.all.c$mean_man)          # Looks okay similar to man
plot(BMP.all.c$mean_gd, BMP.all.c$mean_vol)          # Looks okay similar to vol

plot(BMP.all.c$mean_vol, BMP.all.c$mean_man)
plot(BMP.all.c$mean_vol, BMP.all.c$mean_grav)

plot(BMP.all.c$mean_man, BMP.all.c$mean_grav)


# plot(BMP.all.c$mean_vol, BMP.all.c$mean_man)
# mod1 = lm(mean_vol~mean_man, data = BMP.all.c)
# modsum = summary(mod1)
# abline(mod1)
