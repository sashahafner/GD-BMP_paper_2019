# Plots for presentation

BMP$lwr <- BMP$mean - BMP$sd
BMP$upr <- BMP$mean + BMP$sd

unique(BMP$method)
d <- subset(BMP, method %in% c('man', 'vol', 'grav', 'gdt'))
ggplot(d) + 
  geom_col(aes(descrip, mean, fill = method), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method), position = 'dodge', colour = 'gray55')  +
  labs(x = 'Substrate', y = 'BMP (mL/g)', fill = 'Method')
ggsave('../plots_pres/1A_BMP.png', scale = 0.6)

d <- yldo[yldo$method %in% c('grav', 'gdt', 'vol') & 
         yldo$descrip %in% c('Cellulose', 'FI1') , ]
mm <- c(grav = 'Grav. w/ GC', vol = 'Vol w/ GC', gdt = 'GD')
d$method2 <- mm[d$method]
d$descrip[d$descrip == 'FI1'] <- 'Animal feed'
ggplot(d, aes(time.d, cvCH4, colour = method2, lty = method2, pch = method2, group = interaction(id, method2))) + 
  geom_line() + geom_point() +
  facet_wrap(~ descrip, ncol = 2, scales = 'free') +
  labs(x = 'Incubation time (d)', y = expression('Specific'~CH[4]~'production'~(mL~g^'-1')), lty = 'Method', 
       colour = 'Method',
       pch = 'Method') +
  scale_shape_manual(values = c(20, 1, 3, 2)) +
  theme_bw() +
  theme(legend.position = c(0.87, 0.4)) 
  #theme(legend.position = 'none') 
ggsave('../plots_pres/yield_curves_1A_wide_color.png', height = 4, width = 9, scale = 0.7)


