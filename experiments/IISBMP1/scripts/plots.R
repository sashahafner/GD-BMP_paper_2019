# Plots

# Some other possibilities . . .
cbg.all$pid <- interaction(cbg.all$id, cbg.all$method)
ggplot(cbg.all, aes(elapsed.time, cvCH4, group = pid)) +
  geom_line(aes(colour = method)) +
  facet_wrap(~ descrip)
ggsave('../plots/cum_CH4.png')

# More interesting with yld

# Plot of data before corrected for inoculum (grav) - maybe change coloring for descrip (need to add descrip column)
ggplot(cbg.grav.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Gravimetric") +
  labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/gravimetric_biogas.png')

# Plot of data before corrected for inoculum (vol)
ggplot(cbg.vol.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Volumetric") +
  labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/volumetric_biogas.png')

# Plot of data before corrected for inoculum (man)
ggplot(cbg.man.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Manometric") +
  labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/manometric_biogas.png')

# Plot of data before corrected for inoculum (GD)
ggplot(cbg.gd.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("GD Method") +
  labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/GD_biogas.png')


# All plots above are made for experiment 1, not 2 


# ----------------------

# Plot mean data for each substrate (with ino and substrate correction) 

ggplot(BMP1, aes(method, mean, colour = descrip)) + 
         geom_point() + geom_line(aes(group = descrip)) + 
         geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
         position=position_dodge(0.05)) + 
         labs(x = 'Method', y = 'Mean Cumulative CH4 [mL]', colour = 'Description')  + 
         theme_bw() + 
         theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP.png')


# Plot with reverse of method/descrip [1]
ggplot(BMP1, aes(descrip, mean, colour = method)) +
  geom_point() + geom_line(aes(group = method)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_reverse.png')

# Plot with reverse of method/descrip [2]
ggplot(BMP2, aes(descrip, mean, colour = method)) +
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
plot(reshaped.BMP$mean.gd, reshaped.BMP$mean.grav)
plot(reshaped.BMP$mean.gd, reshaped.BMP$mean.vol)
plot(reshaped.BMP$mean.gd, reshaped.BMP$mean.man)


plot(reshaped.BMP$mean.grav, reshaped.BMP$mean.man)
plot(reshaped.BMP$mean.grav, reshaped.BMP$mean.vol)

plot(reshaped.BMP$mean.man, reshaped.BMP$mean.vol)
