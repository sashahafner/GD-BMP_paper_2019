# Make plots for xCH4

#xCH4 all comparison
ggplot(xCH4.all, aes(elapsed.time, xCH4)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition')  + 
  # ggtitle('Composition Comparison among Averaging') +
  # geom_hline(yintercept = xCH4.gd3[1, xCH4]) +
  theme_bw() + 
  theme(text = element_text(size = 8)) +
  facet_grid( ~ method )
  ggsave('../plots/xCH4.comparison_R1.png')
# ggsave('../plots/xCH4.comparison.wrap.png')
# , color = id
  
  ggplot(xCH4.all, aes(elapsed.time, xCH4)) + 
    geom_point() + geom_line(aes(group = id)) + 
    labs(x = 'Time [d]', y = 'CH4 Composition')  + 
    # ggtitle('Composition Comparison among Averaging') +
    # geom_hline(yintercept = xCH4.gd3[1, xCH4]) +
    theme_bw() + 
    theme(text = element_text(size = 8)) +
    facet_grid( method ~ . )
  ggsave('../plots/xCH4.comparison_R1_horizontal.png')
  # ggsave('../plots/xCH4.comparison.wrap.png')
  # , color = id
  
ggplot(xCH4.all, aes(elapsed.time, xCH4)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition')  + 
  #ggtitle('Composition Comparison among Averaging') +
  # geom_hline(yintercept = xCH4.gd3[1, xCH4]) +
  theme_bw() + 
  theme(text = element_text(size = 8)) +
  facet_wrap(method ~ . )
ggsave('../plots/xCH4.comparison_R1.wrap.png')


ggplot(xCH4.all, aes(elapsed.time, xCH4, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition Comparison') +
  theme_bw() + 
  theme(text = element_text(size = 8)) +
  facet_wrap(~ method)   # What is the best grid after adding all (or chosen) gd methods
ggsave('../plots/xCH4.comparison.wrap.png')

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

