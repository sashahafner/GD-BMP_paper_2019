# Other plots

d <- yld[yld$method %in% c('grav', 'gd01', 'gd03', 'gd09') , ]
ggplot(d, aes(time.d, mean, lty = method, pch = method, colour = method, group = interaction(descrip, method))) + 
  geom_line() + geom_point() +
  facet_wrap(~ descrip, ncol = 1, scales = 'free') +
  scale_shape_manual(values = c(20, 1, 3, 2)) +
  theme_bw() +
  theme(legend.position = c(0.79, 0.12)) 
ggsave('../plots/yield_curves.pdf', height = 11, width = 5)

