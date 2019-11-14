
x$cvBg.grav
x$cvBg.grav/x$cmass.tot.
x$cmass.tot.


x <- subset(cbg.gdt, id == 'I1')
x <- subset(cbg.gdt, id == 'I2')
x
x$vol
x$vol/x$mass.tot
x$date.time

x <- subset(cbg.grav,  id %in% c('I1', 'I2', 'I3'))
library(dplyr)


BMPo$fv.inoc
mean(BMPo$fv.inoc)
median(BMPo$fv.inoc)
head(BMPo)

ggplot(cbg.comb) +
       geom_abline(intercept = 0, slope = 1) + 
       geom_abline(intercept = c(-0.05, 0.05), slope = 1, lty = 2, colour = 'gray45') + 
       geom_point(aes(xCH4c.grav, xCH4c.gdt.hc, shape = descrip), colour = 'gray45') +
       geom_point(aes(xCH4c.grav, xCH4c.gdt, shape = descrip)) +
       theme_bw()

ggplot(cbg.comb, aes(cvBg.grav/vol.hs, aerr1, colour = descrip)) +
       geom_point(shape = 19) +
       geom_point(aes(cvBg.grav/vol.hs, aerr2), shape = 2) +
       geom_abline(intercept = 0, slope = 1)


x <- subset(cbg.comb, descrip != 'I')
t.test(x$aerr1)
t.test(x$aerr2)

plot(xCH4c.grav ~ xCH4c.gdt, data = cbg.comb)
abline(0, 1)
abline(0.1, 1)
abline(-0.1, 1)

table(cbg.comb$id, cbg.comb$time.d)
dim(cbg.comb)
head(cbg.comb)

head(cbg.comb)
dfsumm(cbg.comb)

x <- subset(cbg.comb, is.na(xCH4.GD))
head(x)

xCH4.comp <- as.data.frame(summarise(group_by(cbg.comb, id), xCH4.gdt = xCH4[method == 'gdt' & time.d == max(time.d)],
                                     xCH4.gc = cvCH4[method == 'grav' & time.d == max(time.d)]/
                                     cvBg[method == 'grav' & time.d == max(time.d)],
                                     adiff = xCH4.gdt - xCH4.gc))


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

##pdf('../plots_paper/xCH4_comp_cum_S1.pdf', height = 4, width = 3.8)
#png('../plots_paper/xCH4_comp_cum_S1.png', height = 4, width = 3.8, units = 'in', res = 600)
#
#  plot(xCH4.GC.cum ~ time.d, data = d01, type = 'n', las = 1, ylim = c(0.52, 0.57),
#       xlab = 'Incubation time (d)', ylab = expression('CH'[4]~'conc. (mol. frac.)')) 
#  grid()
#
#  dv <- dv[order(dv$time.d), ]
#  for (i in unique(d01$id)) {
#    dd <- dv[dv$id == i, ]
#    lines(xCH4.GC.cum ~ time.d, data = dd, type = 'o', pch = 1, col = 'black', lty = 2)
#  }
#
#  #dg <- dg[order(dg$time.d), ]
#  #for (i in unique(d01$id)) {
#  #  dd <- dg[dg$id == i, ]
#  #  lines(xCH4.GC.cum ~ time.d, data = dd, type = 'o', pch = 1, col = 'red', lty = 2)
#  #}
#
#  for (i in unique(d03$id)) {
#    dd <- d03[d03$id == i, ]
#    lines(xCH4 ~ time.d, data = dd, col = 'black', lty = 1, lwd = 2)
#  }
#
#  legend('topright', c('GC', expression('GD'[t])), 
#         pch = c(1, -1), 
#         lty = c(2, 1),
#         lwd = c(1, 2),
#         col = c('black', 'black'), bty = 'n')
#
#dev.off()
#

ggplot() +
  geom_line(data = d01, aes(time.d, xCH4.GC, group = id)) + 
  geom_line(data = d01, aes(time.d, xCH4, group = id), col = 'gray45', lty = 2) +
  geom_line(data = d03, aes(time.d, xCH4, group = id), col = 'gray45', lty = 1)  +
  labs(x = 'Incubation time (d)', y = expression('x'[CH[4]]~'(mol. frac)')) +
  theme_bw() +
  theme(legend.position = 'none') 
ggsave('../plots_paper/xCH4_comp.pdf', height = 3, width = 3)



# Some other possibilities . . .
# cbg.all$pid <- interaction(cbg.all$id.exper, cbg.all$method)
# ggplot(cbg.all, aes(elapsed.time, cvCH4, group = pid)) +
#   geom_line(aes(colour = method)) +
#   facet_wrap(~ descrip)
# ggsave('../plots/cum_CH4.png')

# # More interesting with yld
yld1$pid <- interaction(yld1$descrip, yld1$method)
ggplot(yld1, aes(elapsed.time, mean, group = pid)) +
  geom_line(aes(colour = method)) +
  facet_wrap(~ descrip)
ggsave('../plots/yld.interaction_exper1.png')

yld2$pid <- interaction(yld2$descrip, yld2$method)
ggplot(yld2, aes(elapsed.time, mean, group = pid)) +
  geom_line(aes(colour = method)) +
  facet_wrap(~ descrip)
ggsave('../plots/yld.interaction_exper2.png')


# Plot of data before corrected for inoculum (grav) - maybe change coloring for descrip (need to add descrip column)
ggplot(cbg.grav.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Gravimetric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/gravimetric_biogas_exper1.png')

# Plot of data before corrected for inoculum (vol)
ggplot(cbg.vol.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Volumetric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/volumetric_biogas_exper1.png')

# Plot of data before corrected for inoculum (man)
ggplot(cbg.man.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Manometric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/manometric_biogas_exper1.png')

# Plot of data before corrected for inoculum (GD)
ggplot(cbg.gd.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("GD Method") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/GD_biogas_exper1.png')


# All plots above are made for experiment 1, not 2 
# for exper 2
# Plot of data before corrected for inoculum (grav) - maybe change coloring for descrip (need to add descrip column)
ggplot(cbg.grav.list[[2]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Gravimetric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/gravimetric_biogas_exper2.png')

# Plot of data before corrected for inoculum (vol)
ggplot(cbg.vol.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Volumetric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/volumetric_biogas_exper2.png')

# Plot of data before corrected for inoculum (man)
ggplot(cbg.man.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("Manometric") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/manometric_biogas_exper2.png')

# Plot of data before corrected for inoculum (GD)
ggplot(cbg.gd.list[[1]], aes(elapsed.time, cvCH4, colour = id, group = id.exper )) +
  geom_point() +
  geom_line() + 
  ggtitle("GD Method") +
  labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/GD_biogas_exper2.png')


# ----------------------

# Plot mean data for each substrate (with ino and substrate correction) 
ggplot(BMP1, aes(method, mean, colour = descrip)) + 
         geom_point() + geom_line(aes(group = descrip)) + 
         geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
         position=position_dodge(0.05)) + 
         labs(x = 'Method', y = 'Mean Cumulative CH4 [mL]', colour = 'Description')  + 
         theme_bw() + 
         theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_exper1.png')

ggplot(BMP2, aes(method, mean, colour = descrip)) + 
  geom_point() + geom_line(aes(group = descrip)) + 
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) + 
  labs(x = 'Method', y = 'Mean Cumulative CH4 [mL]', colour = 'Description')  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_exper2.png')

# Plot with reverse of method/descrip [1]
ggplot(BMP1, aes(descrip, mean, colour = method)) +
  geom_point() + geom_line(aes(group = method)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_reverse_exper1.png')

# Plot with reverse of method/descrip [2]
ggplot(BMP2, aes(descrip, mean, colour = method)) +
  geom_point() + geom_line(aes(group = method)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_reverse_exper2.png')

# Barplot option
BMP1$lwr <- BMP1$mean - BMP1$sd
BMP1$upr <- BMP1$mean + BMP1$sd
ggplot(BMP1) +
    geom_col(aes(descrip, mean, fill = method), position = 'dodge', colour  = 'black') +
    geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method), position = 'dodge', colour = 'gray55') +
    #facet_grid(. ~ exper, scales = 'free_x') +
    labs(x = 'Substrate', y = expression('BMP'~(mL~g^'-1')), fill = 'Method') +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
    #theme_bw() + scale_fill_manual(values = c('gray65', 'gray95'))  +
    #theme(legend.position = 'none')
ggsave('../plots/BMP1_comp_bars.pdf', height = 6, width = 6, scale = 1.2)

BMP2$lwr <- BMP2$mean - BMP2$sd
BMP2$upr <- BMP2$mean + BMP2$sd
ggplot(BMP2) +
    geom_col(aes(descrip, mean, fill = method), position = 'dodge', colour  = 'black') +
    geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method), position = 'dodge', colour = 'gray55') +
    #facet_grid(. ~ exper, scales = 'free_x') +
    labs(x = 'Substrate', y = expression('BMP'~(mL~g^'-1')), fill = 'Method') +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
    #theme_bw() + scale_fill_manual(values = c('gray65', 'gray95'))  +
    #theme(legend.position = 'none')
ggsave('../plots/BMP2_comp_bars.pdf', height = 6, width = 6, scale = 1.2)
ggsave('../plots/BMP2_comp_bars.png')

# Extra: Plot mean data for each substrate (with ino and substrate correction) - But change to get the full amount of bottles


# ----------------------

# Plots for method comparison directly
plot(BMP.all$mean.gd, BMP.all$mean.grav)         # Seems to be no relation to grav
plot(BMP.all$mean.gd, BMP.all$mean.man)          # Looks okay similar to man
plot(BMP.all$mean.gd, BMP.all$mean.vol)          # Looks okay similar to vol

plot(BMP.all$mean.vol, BMP.all$mean.man)
plot(BMP.all$mean.vol, BMP.all$mean.grav)

plot(BMP.all$mean.man, BMP.all$mean.grav)


# Plots for method comparison directly
jpeg('../plots/method_comparison_to_GD.png')
par(mfrow=c(3,1))
plot(BMP.all$mean.gd, BMP.all$mean.grav)        
abline(0,1)
plot(BMP.all$mean.gd, BMP.all$mean.man)         
abline(0,1)
plot(BMP.all$mean.gd, BMP.all$mean.vol)         
abline(0,1)
dev.off()

# Plots for comparion all methods
jpeg('../plots/method_comparison_all_methods.png')
par(mfrow=c(3,2))
plot(BMP.all$mean.gd, BMP.all$mean.grav)         
abline(0,1)
plot(BMP.all$mean.gd, BMP.all$mean.man)          
abline(0,1)
plot(BMP.all$mean.gd, BMP.all$mean.vol)          
abline(0,1)
plot(BMP.all$mean.vol, BMP.all$mean.man)
abline(0,1)
plot(BMP.all$mean.vol, BMP.all$mean.grav)
abline(0,1)
plot(BMP.all$mean.man, BMP.all$mean.grav)
abline(0,1)
dev.off()

# Divided into each expriment
BMP.all.1 <- subset(BMP.all, exper == 1)
BMP.all.2 <- subset(BMP.all, exper == 2)

# Experiment 1
# Plots for method comparison directly
jpeg('../plots/method_comparison_to_GD_exper1.png')
par(mfrow=c(3,1))
plot(BMP.all.1$mean.gd, BMP.all.1$mean.grav)        
abline(0,1)
plot(BMP.all.1$mean.gd, BMP.all.1$mean.man)          
abline(0,1)
plot(BMP.all.1$mean.gd, BMP.all.1$mean.vol)          
abline(0,1)
dev.off()

# Plots for comparion all methods
jpeg('../plots/method_comparison_all_method_exper1.png')
par(mfrow=c(3,2))
plot(BMP.all.1$mean.gd, BMP.all.1$mean.grav)         
abline(0,1)
plot(BMP.all.1$mean.gd, BMP.all.1$mean.man)          
abline(0,1)
plot(BMP.all.1$mean.gd, BMP.all.1$mean.vol)          
abline(0,1)
plot(BMP.all.1$mean.vol, BMP.all.1$mean.man)
abline(0,1)
plot(BMP.all.1$mean.vol, BMP.all.1$mean.grav)
abline(0,1)
plot(BMP.all.1$mean.man, BMP.all.1$mean.grav)
abline(0,1)
dev.off()

# Experiment 2
# Plots for method comparison directly
jpeg('../plots/method_comparison_to_GD_exper2.png')
par(mfrow=c(3,1))
plot(BMP.all.2$mean.gd, BMP.all.2$mean.grav)        
abline(0,1)
plot(BMP.all.2$mean.gd, BMP.all.2$mean.man)          
abline(0,1)
plot(BMP.all.2$mean.gd, BMP.all.2$mean.vol)          
abline(0,1)
dev.off()

# Plots for comparion all methods
jpeg('../plots/method_comparison_all_method_exper2.png')
par(mfrow=c(3,2))
plot(BMP.all.2$mean.gd, BMP.all.2$mean.grav)         
abline(0,1)
plot(BMP.all.2$mean.gd, BMP.all.2$mean.man)          
abline(0,1)
plot(BMP.all.2$mean.gd, BMP.all.2$mean.vol)          
abline(0,1)
plot(BMP.all.2$mean.vol, BMP.all.2$mean.man)
abline(0,1)
plot(BMP.all.2$mean.vol, BMP.all.2$mean.grav)
abline(0,1)
plot(BMP.all.2$mean.man, BMP.all.2$mean.grav)
abline(0,1)
dev.off()


ggplot() +
  geom_line(data = d01, aes(time.d, xCH4.GC, group = id)) + 
  geom_line(data = d01, aes(time.d, xCH4, group = id), col = 'gray45', lty = 2) +
  geom_line(data = d03, aes(time.d, xCH4, group = id), col = 'gray45', lty = 1)  +
  labs(x = 'Incubation time (d)', y = expression('x'[CH[4]]~'(mol. frac)')) +
  theme_bw() +
  theme(legend.position = 'none') 
ggsave('../plots_paper/xCH4_comp.pdf', height = 3, width = 3)



