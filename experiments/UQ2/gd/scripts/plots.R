# Plots

# Some other possibilities . . .
# cbg.gd$pid <- interaction(cbg.gd$descrip, cbg.gd$method)
# ggplot(cbg.gd, aes(elapsed.time, cvCH4, group = pid)) +
#   geom_line(aes(colour = )) +
#   facet_wrap(~ descrip)
# ggsave('../plots/cum_CH4.png')

# More interesting with yld
yld$pid <- interaction(yld$descrip, yld$method)
ggplot(yld, aes(elapsed.time, mean, group = pid)) +
  geom_line(aes(colour = method)) +
  facet_wrap(~ descrip)
ggsave('../plots/yld.interaction.png')

# Plot of data before corrected for inoculum (grav)
ggplot(cbg.gd, aes(elapsed.time, cvCH4, colour = id )) +
  geom_point() +
  geom_line() + 
  ggtitle("GD") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/gd_biogas.png')


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