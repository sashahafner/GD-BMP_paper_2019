# Plots

# Plot of data before corrected for inoculum (grav)
ggplot(cbg.grav, aes(elapsed.time, cvCH4, colour = grav.subs.type, group = id )) +
  geom_point() +
  geom_line() + 
  labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))


# Plot of data before corrected for inoculum (vol)
ggplot(cbg.vol, aes(elapsed.time, cvCH4, colour = vol.subs.type, group = id )) +
  geom_point() +
  geom_line() + 
  labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))

# Plot of data before corrected for inoculum (man)
ggplot(cbg.man, aes(elapsed.time, cvCH4, colour = man.subs.type, group = id )) +
  geom_point() +
  geom_line() + 
  labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))

