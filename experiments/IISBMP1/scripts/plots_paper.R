# Plots for paper

# Yield curves
d <- yldo[yldo$method %in% c('grav', 'gd03') & 
         yldo$descrip %in% c('Ethanol', 'FI1') , ]
d$method2 <- ifelse(d$method == 'grav', 'Gravimetric', 'GD')
ggplot(d, aes(time.d, cvCH4, lty = method2, pch = method2, group = interaction(id, method2))) + 
  geom_line() + geom_point() +
  facet_wrap(~ descrip, ncol = 1, scales = 'free') +
  labs(x = 'Incubation time (d)', y = expression('Yield'~(mL~g^'-1')), lty = 'Method', 
       pch = 'Method') +
  scale_shape_manual(values = c(20, 1, 3, 2)) +
  theme_bw() +
  theme(legend.position = c(0.79, 0.12)) 
  #theme(legend.position = 'none') 
ggsave('../plots_paper/yield_curves.pdf', height = 5, width = 3.3)


# xCH4
d01 <- cbg.gd01
d01 <- merge(setup, d01, by = 'id')
d01 <- d01[d01$descrip %in% c('FI1') & d01$time.d > 0 & !is.na(d01$xCH4.GC), ]
d03 <- cbg.gd03
d03 <- merge(setup, d03, by = 'id')
d03 <- d03[d03$descrip %in% c('FI1') & d03$time.d > 0 , ]
dv <- cbg.vol
dv <- merge(setup, dv, by = 'id')
dv <- dv[dv$descrip %in% c('FI1') & dv$time.d > 0 , ]
dv$xCH4.GC.cum <- dv$cvCH4/dv$cvBg

pdf('../plots_paper/xCH4_comp.pdf', height = 4, width = 3.8)

  plot(xCH4 ~ time.d, data = d01, type = 'n', las = 1, ylim = c(0, 0.8),
       xlab = 'Incubation time (d)', ylab = expression('CH'[4]~'conc. (mol. frac.)')) 
  grid()

  d01 <- d01[order(d01$time.d), ]
  for (i in unique(d01$id)) {
    dd <- d01[d01$id == i, ]
    lines(xCH4 ~ time.d, data = dd, type = 'o', pch = 19, col = 'gray65')
  }
  for (i in unique(d01$id)) {
    dd <- d01[d01$id == i, ]
    lines(xCH4.GC ~ time.d, data = dd, type = 'o', pch = 1, col = 'black', lty = 2)
  }

  legend('bottomleft', c('GC', expression('GD'[I])), pch = c(1, 19), col = c('black', 'gray65'), bty = 'n')

dev.off()
