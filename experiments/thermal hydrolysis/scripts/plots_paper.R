# Plots for paper

ggplot(cbg.comb) +
       geom_abline(intercept = 0, slope = 1) + 
       geom_abline(intercept = c(-0.05, 0.05), slope = 1, lty = 2, colour = 'gray45') + 
       geom_point(aes(xCH4c.grav, xCH4c.gdv.hc, colour = descrip)) +
       geom_point(aes(xCH4c.grav, xCH4c.gdt), colour = 'gray45') +
       labs(x = 'GC', y = expression('GD'[t]~'or'~'GD'[v]), colour = 'Substrate') +
       #labs(x = expression('GC'~x[CH[4]]~'(mol.frac.)'), 
       #     y = expression('GD'~x[CH[4]]~'(mol.frac.)'), colour = 'Substrate') +
#       xlim(0.4, 0.85) + ylim(0.4, 0.85) +
       theme_bw() +
       #theme(legend.pos = 'none', axis.text = element_text(size = 9)) +
       theme(legend.pos = c(0.84, 0.23)) +
       guides(colour = guide_legend(ncol = 2)) 
ggsave('../plots/xCH4_comp_final.png', height = 3.8, width = 4, scale = 0.70)



ggplot(cbg.comb, aes(cvCH4.grav, aerr1)) + 
  geom_point()
ggsave('../plots/aerr_v_cvBg.png')

