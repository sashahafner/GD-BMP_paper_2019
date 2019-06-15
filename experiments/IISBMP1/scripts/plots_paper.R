# Plots for paper

# Yield curves
d <- yldo[yldo$method %in% c('grav', 'gdt') & 
         yldo$descrip %in% c('Ethanol', 'FI1') , ]
d$method2 <- ifelse(d$method == 'grav', 'Gravimetric', 'GD')
ggplot(d, aes(time.d, cvCH4, lty = method2, pch = method2, group = interaction(id, method2))) + 
  geom_line() + geom_point() +
  facet_wrap(~ descrip, ncol = 1, scales = 'free') +
  labs(x = 'Incubation time (d)', y = expression('Specific'~CH[4]~'production'~(mL~g^'-1')), lty = 'Method', 
       pch = 'Method') +
  scale_shape_manual(values = c(20, 1, 3, 2)) +
  theme_bw() +
  theme(legend.position = c(0.77, 0.11)) 
  #theme(legend.position = 'none') 
ggsave('../plots_paper/yield_curves_S1.pdf', height = 5, width = 3.3)
ggsave('../plots_paper/yield_curves_S1.png', height = 5, width = 3.3)


# xCH4
d01 <- cbg.gdi
d01 <- merge(setup, d01, by = 'id')
d01 <- d01[d01$descrip %in% c('FI1') & d01$time.d > 0 & !is.na(d01$xCH4.GC), ]
d01$xCH4.GC.cum <- d01$cvCH4/d01$cvBg
head(d01)
d03 <- cbg.gdt
d03 <- merge(setup, d03, by = 'id')
d03 <- d03[d03$descrip %in% c('FI1') & d03$time.d > 0 , ]
dv <- cbg.vol
dv <- merge(setup, dv, by = 'id')
dv <- dv[dv$descrip %in% c('FI1') & dv$time.d > 0 , ]
dv$xCH4.GC.cum <- dv$cvCH4/dv$cvBg

dg <- cbg.grav
dg <- merge(setup, dg, by = 'id')
dg <- dg[dg$descrip %in% c('FI1') & dg$time.d > 0 , ]
dg$xCH4.GC.cum <- dg$cvCH4/dg$cvBg

#pdf('../plots_paper/xCH4_comp_S1.pdf', height = 4, width = 3.8)
png('../plots_paper/xCH4_comp_S1.png', height = 4, width = 3.8, units = 'in', res = 600)

  plot(xCH4 ~ time.d, data = d01, type = 'n', las = 1,
       xlab = 'Incubation time (d)', ylab = expression('CH'[4]~'conc. (mol. frac.)')) 
  grid()

  d01 <- d01[order(d01$time.d), ]
  for (i in unique(d01$id)) {
    dd <- d01[d01$id == i, ]
    lines(xCH4 ~ time.d, data = dd, type = 'o', pch = 19, col = 'gray65', cex = 0.7)
  }

  for (i in unique(d01$id)) {
    dd <- d01[d01$id == i, ]
    lines(xCH4.GC ~ time.d, data = dd, type = 'o', pch = 1, col = 'black', lty = 2)
  }

  legend('topright', c('GC', expression('GD'[i])), 
         pch = c(1, 19), 
         lty = c(2, 1),
         col = c('black', 'gray65'), bty = 'n')
dev.off()


#pdf('../plots_paper/xCH4_comp_cum_S1.pdf', height = 4, width = 3.8)
png('../plots_paper/xCH4_comp_cum_S1.png', height = 4, width = 3.8, units = 'in', res = 600)

  plot(xCH4.GC.cum ~ time.d, data = d01, type = 'n', las = 1, ylim = c(0.52, 0.57),
       xlab = 'Incubation time (d)', ylab = expression('CH'[4]~'conc. (mol. frac.)')) 
  grid()

  dv <- dv[order(dv$time.d), ]
  for (i in unique(d01$id)) {
    dd <- dv[dv$id == i, ]
    lines(xCH4.GC.cum ~ time.d, data = dd, type = 'o', pch = 1, col = 'black', lty = 2)
  }

  #dg <- dg[order(dg$time.d), ]
  #for (i in unique(d01$id)) {
  #  dd <- dg[dg$id == i, ]
  #  lines(xCH4.GC.cum ~ time.d, data = dd, type = 'o', pch = 1, col = 'red', lty = 2)
  #}

  for (i in unique(d03$id)) {
    dd <- d03[d03$id == i, ]
    lines(xCH4 ~ time.d, data = dd, col = 'black', lty = 1, lwd = 2)
  }

  legend('topright', c('GC', expression('GD'[t])), 
         pch = c(1, -1), 
         lty = c(2, 1),
         lwd = c(1, 2),
         col = c('black', 'black'), bty = 'n')

dev.off()

