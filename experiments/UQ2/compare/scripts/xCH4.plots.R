# Make plots for xCH4

# #cbg.gd$method <- 'gd'
# cbg.gd1$method <- 'gd1'
# cbg.gd2$method <- 'gd2'
# cbg.gd3$method <- 'gd3'
# # cbg.gd4$method <- 'gd4'
# cbg.gd5$method <- 'gd5'
# # cbg.gd6$method <- 'gd6'
# #cbg.gd7$method <- 'gd7'
# cbg.gd8$method <- 'gd8'
# # cbg.gd9$method <- 'gd9'
# # cbg.gd10$method <- 'gd10'
# # cbg.gd11$method <- 'gd11'
# # cbg.gd12$method <- 'gd12'


# Plot all gd methods composition in one plot
cbg.gd.all <- biogas:::rbindf(
  cbg.gd1, cbg.gd2, cbg.gd3, 
  #cbg.gd4, 
  cbg.gd5, 
  #cbg.gd6, cbg.gd7, 
  cbg.gd8
  # cbg.gd9, 
  # cbg.gd10, 
  # cbg.gd11, cbg.gd12
  )

ggplot(data = xCH4) + 
  geom_point(aes(elapsed.time, xCH4, color = id), na.rm = TRUE) + 
  geom_point(aes(elapsed.time, xCH4_gd1), na.rm = TRUE)


ggplot(xCH4, elapsed.time)) 
  geom_point() + geom_line() + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition Comparison') +
  theme_bw() + 
  theme(text = element_text(size = 8)) +
ggsave('../plots/xCH4.png')

# ---------------
#grav/man (GC data)
ggplot(xCH4, aes(elapsed.time, xCH4, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition grav') +
  theme_bw() + 
  theme(text = element_text(size = 8))
  ggsave('../plots/xCH4.grav.png')

#gd1 (int, grav, total)
ggplot(xCH4, aes(elapsed.time, xCH4_gd1, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition gd1') +
  theme_bw() + 
  theme(text = element_text(size = 8)) +
ggsave('../plots/xCH4.gd1.png')

# gd2 (cum, grav, total)
ggplot(xCH4, aes(elapsed.time, xCH4_gd2, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition gd2') +
  theme_bw() + 
  theme(text = element_text(size = 8)) 
ggsave('../plots/xCH4.gd2.png')

#gd3 (final, grav, total)
ggplot(xCH4, aes(elapsed.time, xCH4_gd3, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition gd3') +
  theme_bw() + 
  theme(text = element_text(size = 8)) 
ggsave('../plots/xCH4.gd3.png')

#gd5 (cum, grav, vented)
ggplot(xCH4, aes(elapsed.time, xCH4_gd5, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition gd1') +
  theme_bw() + 
  theme(text = element_text(size = 8)) 
ggsave('../plots/xCH4.gd5.png')

#gd8 (cum, vol, vented)
ggplot(xCH4, aes(elapsed.time, xCH4_gd8, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition gd8') +
  theme_bw() + 
  theme(text = element_text(size = 8))
ggsave('../plots/xCH4.gd8.png')
