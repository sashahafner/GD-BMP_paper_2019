# Plots (not for paper)

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


