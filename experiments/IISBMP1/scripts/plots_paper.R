# Plots for paper

# Yield curves
d <- yldo[yldo$method %in% c('vol', 'gdt') & 
         yldo$descrip %in% c('Cellulose', 'FI1') , ]
d$method2 <- ifelse(d$method == 'vol', 'Volumetric', 'GD')
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

head(cbg.gdi)
subset(d01, time.d < 1.5)
options(width = 65)

pdf('../plots_paper/xCH4_comp_S1.pdf', height = 4, width = 3.8)
#png('../plots_paper/xCH4_comp_S1.png', height = 4, width = 3.8, units = 'in', res = 600)

  plot(xCH4.GD ~ time.d, data = d01, type = 'n', las = 1,
       xlab = 'Incubation time (d)', ylab = expression('CH'[4]~'conc. (mol. frac.)')) 
  grid()

  d01 <- d01[order(d01$time.d), ]
  for (i in unique(d01$id)) {
    dd <- d01[d01$id == i, ]
    lines(xCH4.GD ~ time.d, data = dd, type = 'o', pch = 19, col = 'gray65', cex = 0.7)
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

ggplot(cbg.comb) +
       geom_abline(intercept = 0, slope = 1) + 
       geom_abline(intercept = 0, slope = c(0.9, 1.1), lty = 2, colour = 'gray45') + 
       geom_point(data = subset(cbg.comb, descrip == 'Ethanol'), 
                  aes(xCH4c.grav, xCH4c.gdt.hc, shape = descrip), colour = 'gray45') +
       geom_point(aes(xCH4c.grav, xCH4c.gdt, shape = descrip)) +
       #labs(x = 'GC', y = expression('GD'[t]~'or'~'GD'[v]), shape = 'Substrate') +
       labs(x = expression('GC CH'[4]~'conc. (mol. frac.)'), 
            y = expression('GD CH'[4]~'conc. (mol. frac.)'), shape = 'Substrate') +
       #labs(x = expression('GC'~x[CH[4]]~'(mol.frac.)'), 
       #     y = expression('GD'~x[CH[4]]~'(mol.frac.)'), shape = 'Substrate') +
       xlim(0.45, 0.78) + ylim(0.45, 0.78) +
       theme_bw() +
       theme(legend.pos = 'none', axis.text = element_text(size = 9)) +
       #theme(legend.pos = c(0.84, 0.23)) +
       guides(shape = guide_legend(ncol = 2)) 
ggsave('../plots_paper/xCH4_comp_final_S1.pdf', height = 3.8, width = 4, scale = 0.70)

