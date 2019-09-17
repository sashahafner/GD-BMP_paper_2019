
d <- yldo[yldo$method %in% c('grav', 'gdt'), ]
d$method2 <- ifelse(d$method == 'grav', 'Grav. w/ GC', 'GD')
d$descrip2 <- ifelse(d$descrip == 'L', 'Cellulose', 'Animal feed')

ggplot(d, aes(time.d, cvCH4, lty = method2, pch = method2, group = interaction(id, method2))) + 
  geom_line() + geom_point() +
  facet_wrap(~ descrip2, ncol = 2, scales = 'free') +
  labs(x = 'Incubation time (d)', y = expression('Specific'~CH[4]~'production (SMP)'~(mL~g^'-1')), lty = 'Method', 
       pch = 'Method') +
  scale_shape_manual(values = c(20, 1, 3, 2)) +
  theme_bw() +
  theme(legend.position = c(0.90, 0.21)) 
ggsave('../plots_pres/yield_curves_UQ2_wide.png', height = 4, width = 9, scale = 0.75)

ggplot(d, aes(time.d, cvCH4, lty = method2, colour = method2, group = interaction(id, method2))) + 
  geom_line() + geom_point() +
  facet_wrap(~ descrip2, ncol = 2, scales = 'free') +
  labs(x = 'Incubation time (d)', y = expression('Specific'~CH[4]~'prod. (SMP)'~(mL~g^'-1')), lty = 'Method', 
       colour = 'Method') +
  theme_bw() +
  theme(legend.position = c(0.90, 0.21)) 
ggsave('../plots_pres/yield_curves_UQ2_wide_color.png', height = 4, width = 9, scale = 0.7)


BMP$lwr <- BMP$mean - BMP$sd
BMP$upr <- BMP$mean + BMP$sd
d <- BMP
d$method <- as.character(d$method)
d$descrip <- as.character(d$descrip)
d$descrip[d$descrip == 'C'] <- 'FI3'
d$descrip[d$descrip == 'L'] <- 'Cellulose'

ggplot(d) + 
  geom_col(aes(descrip, mean, fill = method), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method), position = 'dodge', colour = 'gray55') +
  labs(x = 'Substrate', y = 'BMP (mL/g)', fill = 'Method')
ggsave('../plots_pres/2_BMP.png', scale = 0.7)

