# Make plots for xCH4

cbg.gd$method <- 'gd'
# cbg.gd1$method <- 'gd1'
# cbg.gd2$method <- 'gd2'
# cbg.gd3$method <- 'gd3'
# cbg.gd4$method <- 'gd4'
# cbg.gd5$method <- 'gd5'
# cbg.gd6$method <- 'gd6'
cbg.gd7$method <- 'gd7'
cbg.gd8$method <- 'gd8'
cbg.gd9$method <- 'gd9'
cbg.gd10$method <- 'gd10'
cbg.gd11$method <- 'gd11'
cbg.gd12$method <- 'gd12'


# Plot all gd methods composition in one plot
cbg.gd.all <- biogas:::rbindf(
  #cbg.gd1, cbg.gd2, gbg.gd3, cbg.gd4, cbg.gd5, cbg.gd6, 
  cbg.gd7, 
  cbg.gd8, cbg.gd9, 
  cbg.gd10, 
  cbg.gd11, cbg.gd12)

ggplot(cbg.gd.all, aes(elapsed.time, xCH4, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition Comparison') +
  theme_bw() + 
  theme(text = element_text(size = 8)) +
  facet_grid(method ~. )   # What is the best grid after adding all (or chosen) gd methods
ggsave('../plots/xCH4.png')

# ---------------

# Negative xCH4
ggplot(cbg.gd7, aes(elapsed.time, xCH4, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id))
ggsave('../plots/xCH4gd7.png')
ggplot(cbg.gd10, aes(elapsed.time, xCH4, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id))
ggsave('../plots/xCH4gd10.png')

# Straight (final)
ggplot(cbg.gd9, aes(elapsed.time, xCH4, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id))
ggsave('../plots/xCH4gd9.png')
ggplot(cbg.gd12, aes(elapsed.time, xCH4, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id))
ggsave('../plots/xCH4gd12.png')

ggplot(cbg.gd8, aes(elapsed.time, xCH4, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id))
ggsave('../plots/xCH4gd8.png')
ggplot(cbg.gd11, aes(elapsed.time, xCH4, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id))
ggsave('../plots/xCH4gd11.png')