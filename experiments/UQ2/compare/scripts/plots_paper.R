# Plots for paper

d <- yldo[yldo$method %in% c('grav', 'gdt'), ]
d$method2 <- ifelse(d$method == 'grav', 'Gravimetric', 'GD')
d$descrip2 <- ifelse(d$descrip == 'L', 'Cellulose', 'FI3')
ggplot(d, aes(time.d, cvCH4, lty = method2, pch = method2, group = interaction(id, method2))) + 
  geom_line() + geom_point() +
  facet_wrap(~ descrip2, ncol = 1, scales = 'free') +
  labs(x = 'Incubation time (d)', y = expression('Yield'~(mL~g^'-1')), lty = 'Method', 
       pch = 'Method') +
  scale_shape_manual(values = c(20, 1, 3, 2)) +
  theme_bw() +
  theme(legend.position = c(0.79, 0.12)) 
  #theme(legend.position = 'none') 
ggsave('../plots_paper/yield_curves_UQ2.pdf', height = 5, width = 3.3)
