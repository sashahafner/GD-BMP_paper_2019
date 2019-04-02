# Make plots for xCH4
# Original, but adjusted axis - Camilla!
method.lab <- c("gd01" = "A) GD, no averaging, interval", "gd02" = "B) GD, cumulative average", "gd03" = "C) GD, total average", "grav.GC" = "D) GC (grav)")

ggplot(xCH4.all, aes(elapsed.time, xCH4)) + 
  geom_point(data = xCH4.no.gd3) + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = expression('CH'[4]*' mole fraction'))  + 
  theme_bw() + ylim(0.3,0.8) + 
  theme(text = element_text(size = 8)) +
  facet_grid( ~ method, labeller = as_labeller(method.lab)) + 
ggsave('../plots/xCH4.comparison_R1_original.png', width = 6, height = 3)


# Plot methods with gd3 method as a straight line - Sasha prefers!
xCH4.all.1 <- subset(xCH4.all, !method == 'gd3')

xCH4.gd3.C1 <- subset(xCH4.gd3, id == 'C1')
length(unique(xCH4.gd3.C1$xCH4))
xCH4.gd3.C2 <- subset(xCH4.gd3, id == 'C2')
length(unique(xCH4.gd3.C2$xCH4))
xCH4.gd3.C3 <- subset(xCH4.gd3, id == 'C3')
length(unique(xCH4.gd3.C3$xCH4))

ggplot(xCH4.all.1, aes(elapsed.time, xCH4)) + 
    geom_point(data = xCH4.no.gd3) + geom_line(aes(group = id)) + 
    labs(x = 'Time [d]', y = 'CH4 Composition')  + 
    theme_bw() + ylim(0.3,0.8) + 
    theme(text = element_text(size = 8)) +
    facet_grid( ~ method )  +
  annotate(geom = 'line', color = 'black', x=c(min(xCH4.gd3.C1$elapsed.time), max(xCH4.gd3.C1$elapsed.time)), y = c(mean(xCH4.gd3.C1$xCH4), mean(xCH4.gd3.C1$xCH4))) +
  annotate(geom = 'line', color = 'black', x=c(min(xCH4.gd3.C2$elapsed.time), max(xCH4.gd3.C2$elapsed.time)), y = c(mean(xCH4.gd3.C2$xCH4), mean(xCH4.gd3.C2$xCH4))) +
  annotate(geom = 'line', color = 'black', x=c(min(xCH4.gd3.C3$elapsed.time), max(xCH4.gd3.C3$elapsed.time)), y = c(mean(xCH4.gd3.C3$xCH4), mean(xCH4.gd3.C3$xCH4)))
ggsave('../plots/xCH4.comparison_R1_Sasha.png', width = 6, height = 3)

# Can also be added with only one line for gd3, but mean: mean(a,b,c)


# ---------------------------------------------------------------------
# aligned on top of each other
ggplot(xCH4.all, aes(elapsed.time, xCH4)) + 
    geom_point() + geom_line(aes(group = id)) + 
    labs(x = 'Time [d]', y = 'CH4 Composition')  + 
    # ggtitle('Composition Comparison among Averaging') +
    # geom_hline(yintercept = xCH4.gd3[1, xCH4]) +
    theme_bw() + 
    theme(text = element_text(size = 8)) +
    facet_grid( method ~ . )
ggsave('../plots/xCH4.comparison_R1_horizontal.png', , width = 3, height = 6)

# Aligned 2x2
ggplot(xCH4.all, aes(elapsed.time, xCH4)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition')  + 
  #ggtitle('Composition Comparison among Averaging') +
  # geom_hline(yintercept = xCH4.gd3[1, xCH4]) +
  theme_bw() + 
  theme(text = element_text(size = 8)) +
  facet_wrap(method ~ . )
ggsave('../plots/xCH4.comparison_R1.wrap.png', , width = 4, height = 4)


# ---------------
#grav/man (GC data)
ggplot(xCH4, aes(elapsed.time, xCH4, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition grav') +
  theme_bw() + 
  theme(text = element_text(size = 8)) +
  ggsave('../plots/xCH4.grav.png', , width = 6, height = 3)

#gd1 (int, grav, total)
ggplot(xCH4, aes(elapsed.time, xCH4_gd01, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition gd1') +
  theme_bw() + 
  theme(text = element_text(size = 8)) +
ggsave('../plots/xCH4.gd1.png', width = 6, height = 3)

# gd2 (cum, grav, total)
ggplot(xCH4, aes(elapsed.time, xCH4_gd02, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition gd2') +
  theme_bw() + 
  theme(text = element_text(size = 8))  +
ggsave('../plots/xCH4.gd2.png', width = 6, height = 3)

#gd3 (final, grav, total)
ggplot(xCH4, aes(elapsed.time, xCH4_gd03, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition gd3') +
  theme_bw() + 
  theme(text = element_text(size = 8)) +
ggsave('../plots/xCH4.gd3.png', width = 6, height = 3)

