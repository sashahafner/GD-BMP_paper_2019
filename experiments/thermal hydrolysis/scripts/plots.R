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

# EVENTUALLY SAVE SOME OF THE IMPORTANT PLOTS BY SAVING COMMAND!

# Plot mean data for each substrate (with ino and substrate correction) 

ggplot(cbg.all, aes(method, mean, colour = descrip)) + 
         geom_point() + geom_line(aes(group = descrip)) + 
         labs(x = 'Method', y = 'Mean Cumulative CH4 [mL]', colour = 'Description')  + 
         theme_bw() + 
         theme(text = element_text(size = 10))

# Add plot

# Gravimetric and volumetric are similar

# Plot with reverse of method/descrip
ggplot(cbg.all, aes(descrip, mean, colour = method)) +
  geom_point() + geom_line() +
  labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10))


# Plot mean data for each substrate (with ino and substrate correction) - But change to get the full amount of bottles

