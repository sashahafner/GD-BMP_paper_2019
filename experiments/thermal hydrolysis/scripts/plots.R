# Plots (not for paper)

BMP$lwr <- BMP$mean - BMP$sd
BMP$upr <- BMP$mean + BMP$sd

ggplot(BMP) + 
  geom_col(aes(descrip, mean, fill = method), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method), position = 'dodge', colour = 'gray55') 
ggsave('../plots/BMP.png')

d <- merge(cbg.gdv, setup, by = 'id')
ggplot(d, aes(time.d, xCH4, group = id)) + 
  geom_line() +
  facet_wrap(~ descrip)
ggsave('../plots/xCH4_GDv.png')

d <- merge(cbg.gdt, setup, by = 'id')
ggplot(d, aes(time.d, xCH4, group = id)) + 
  geom_line() +
  facet_wrap(~ descrip)
ggsave('../plots/xCH4_GDt.png')

d <- merge(cbg.grav, setup, by = 'id')
ggplot(d, aes(time.d, xCH4, group = id)) + 
  geom_line() +
  facet_wrap(~ descrip)
ggsave('../plots/xCH4_GC.png')

ggplot(yld, aes(time.d, mean, group = interaction(descrip, method), colour = method)) + 
  geom_line() +
  facet_wrap(~ descrip)
ggsave('../plots/yield.png')

d <- merge(leaks, setup, by = 'id')
ggplot(d, aes(time.d, mass.leak, group = id, colour = descrip)) + 
  geom_line() +
  geom_hline(yintercept = detect.lim.int, colour = 'gray45') +
  facet_wrap(~ descrip)
ggsave('../plots/leaks.png')

ggplot(d, aes(time.d, cmass.leak, group = id, colour = descrip)) + 
  geom_line() +
  geom_hline(yintercept = detect.lim.tot, colour = 'gray45') +
  facet_wrap(~ descrip)
ggsave('../plots/leaks_tot.png')
