# Plots (not for paper)

d <- yldo[yldo$method == 'gdt' & yldo$id == 'C3', ]
png('../plots/graph_abstract.png', height = 300, width = 300, pointsize = 12)
plot(cvCH4 ~ time.d, data = d, type = 'o', xlab = '', ylab = '', axes = FALSE, pch = 19, cex = 1)
box()
dev.off()

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


BMP$lwr <- BMP$mean - BMP$sd
BMP$upr <- BMP$mean + BMP$sd

ggplot(BMP) + 
  geom_col(aes(descrip, mean, fill = method), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method), position = 'dodge', colour = 'gray55') 
ggsave('../plots/BMP.png')

ggplot(yld, aes(time.d, mean, group = interaction(descrip, method), colour = method)) + 
  geom_line() +
  facet_wrap(~ descrip)
ggsave('../plots/yield.png')
