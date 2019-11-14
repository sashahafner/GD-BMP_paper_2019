# Plots for paper

d <- yldo[yldo$method %in% c('grav', 'gdt'), ]
d$method2 <- ifelse(d$method == 'grav', 'Gravimetric', 'GD')
d$descrip2 <- ifelse(d$descrip == 'L', 'Cellulose', 'FI3')
ggplot(d, aes(time.d, cvCH4, lty = method2, pch = method2, group = interaction(id, method2))) + 
  geom_line() + geom_point() +
  facet_wrap(~ descrip2, ncol = 1, scales = 'free') +
  labs(x = 'Incubation time (d)', y = expression('Specific'~CH[4]~'production'~(mL~g^'-1')), lty = 'Method', 
       pch = 'Method') +
  scale_shape_manual(values = c(20, 1, 3, 2)) +
  theme_bw() +
  theme(legend.position = c(0.79, 0.11)) 
  #theme(legend.position = 'none') 
ggsave('../plots_paper/yield_curves_UQ2.pdf', height = 5, width = 3.3)
ggsave('../plots_paper/yield_curves_UQ2.png', height = 5, width = 3.3)


plot(cvCH4.gdt ~ cvCH4.grav, data = cbg.comb)
abline(0, 1)
abline(0, 0.9)
abline(0, 1.1)

cbg.comb <- merge(cbg.grav, cbg.gd, by = c('id', 'date', 'time', 'time.d'),
                  suffixes = c('.grav', '.gdt'))

cbg.comb <- subset(cbg.comb, time.d > 26)
cbg.comb <- merge(cbg.comb, setup[, c('id', 'descrip')])

ggplot(cbg.comb) +
       geom_abline(intercept = 0, slope = 1) + 
       geom_abline(intercept = 0, slope = c(0.9, 1.1), lty = 2, colour = 'gray45') + 
       geom_point(aes(cvCH4.grav, cvCH4.gdt, shape = descrip), size = 2) +
       labs(x = expression('GC CH'[4]~'vol. (mL)'), 
            y = expression('GD CH'[4]~'vol (mL)')) +
       #xlim(0.45, 0.78) + ylim(0.45, 0.78) +
       theme_bw() +
       theme(legend.pos = 'none', axis.text = element_text(size = 9)) +
       #theme(legend.pos = c(0.84, 0.23)) +
       guides(shape = guide_legend(ncol = 2)) 
ggsave('../plots_paper/cvCH4_comp_final.pdf', height = 3.8, width = 4, scale = 0.70)

