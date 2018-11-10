# Calculates BMP and more

# Experiment 2
# 1p BMP
w <- '1p'

bmp2g21p <- summBg(bgv2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4.ggd',
             when = w)

w <- 'end'
bmp2g2e <- summBg(bgv2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4.ggd',
             when = w)

w <- 30
bmp2g230 <- summBg(bgv2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4.ggd',
             when = w)

w <- 'meas'
bmp2g2a <- summBg(bgv2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4.ggd',
             when = w)


bmp2g2a <- droplevels(subset(bmp2g2a, !is.na(mean) & descrip != 'CB'))
bmp2va <- droplevels(subset(bmp2va, descrip != 'CB'))
# Add zeros
bmp2g2a <- rbind(bmp2g2a, data.frame(descrip = unique(bmp2g2a$descrip), ctime = 0,
                                     mean = 0, se = 0, sd = 0, n = NA))
bmp2va <- rbind(bmp2va, data.frame(descrip = unique(bmp2va$descrip), ctime = 0,
                                     mean = 0, se = 0, sd = 0, n = NA))

bmp2g2a$method <- 'Gas density (GD)'
bmp2va$method <- 'Volumetric'
bmp2cc <- rbind(bmp2g2a, bmp2va)
bmp2cc$lwr <- bmp2cc$mean - bmp2cc$sd
bmp2cc$upr <- bmp2cc$mean + bmp2cc$sd

ggplot(bmp2cc, aes(ctime, mean, colour = descrip)) + 
  facet_wrap(~ method) + geom_line() + geom_point(pch = 1) + 
#  geom_errorbar(aes(ymin = lwr, ymax = upr)) +
  theme_bw() +
  labs(colour = 'Substrate', x = 'Time (d)', y = expression(CH[4]~'yield (mL/g)'))
ggsave('../plots/yld_compb.png', height = 3, width = 6)

# Export
write.csv(bmp2g21p, '../output/BMP2_grav2_1p.csv', row.names = FALSE)
write.csv(bmp2g2e, '../output/BMP2_grav2_end.csv', row.names = FALSE)
write.csv(bmp2g230, '../output/BMP2_grav2_30d.csv', row.names = FALSE)

plot(cvCH4.ggd.g2 ~ cvCH4.ggd.v, data = bg2)
abline(0, 1)

hist(bgv2$xCH4.ggd)

x <- subset(bgv2, cvCH4.ggd < 0)
head(x)


