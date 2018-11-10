# Plots

ggplot(cbg, aes(cvCH4.grav, cvCH4.man, colour = id)) + 
  geom_abline(intercept = 0, slope = c(0.9, 1, 1.1), col = 'gray32') +
  geom_line() + geom_point()  
ggsave('../plots/grav_v_man.png')

ggplot(cbg, aes(cvCH4.grav, cvCH4.grav2, colour = id)) + 
  geom_abline(intercept = 0, slope = c(0.9, 1, 1.1), col = 'gray32') +
  geom_line() + geom_point()  
ggsave('../plots/grav2_v_grav.png')

ggplot(cbg, aes(time.d, xCH4.grav, colour = id)) + 
  geom_line() + geom_point()  
ggsave('../plots/xCH4_meas.png')

ggplot(cbg, aes(time.d, cvCH4.grav/cvBg.grav, colour = id)) + 
  geom_line() + geom_point()  
ggsave('../plots/xCH4_meas_cum.png')

ggplot(cbg, aes(time.d, xCH4.grav2, colour = id)) + 
  geom_line() + geom_point()  
ggsave('../plots/xCH4_grav2.png')
