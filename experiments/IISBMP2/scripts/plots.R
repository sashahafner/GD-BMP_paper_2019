# Plots
ggplot(cbg.gd, aes(time.d, cvCH4, colour = id)) + 
  geom_line() + geom_point()  
ggsave('../plots/cvCH4_gd.png')

ggplot(yld, aes(time.d, cvCH4, colour = substrate, group = id)) + 
  geom_line() + geom_point() + labs(x = 'Time (d)', y = 'CH4 yield (mL/g)', colour = 'Substrate')
ggsave('../plots/yield_gd.png')

ggplot(rates, aes(time.d, log10(rrvCH4), colour = id)) + 
  geom_line() + geom_point()  + geom_hline(yintercept = log10(c(1, 0.5)))
ggsave('../plots/rrates.png')


