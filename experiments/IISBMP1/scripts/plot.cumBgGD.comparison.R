# Plots for results 3.2

# USED IN PAPER PART 3A. 
BMPSubC <- subset(BMP2, descrip == 'FIC')
BMPSubC$lwr <- BMPSubC$mean - BMPSubC$sd
BMPSubC$upr <- BMPSubC$mean + BMPSubC$sd

labels <- c(gd01 = 'GD01', gd02 = 'GD02', gd03 = 'GD03', gd04 = 'GD04', gd05 = 'GD05', gd06 = 'GD06',
            gd07 = 'GD07', gd08 = 'GD08', gd09 = 'GD09', gd10 = 'GD10', gd11 = 'GD11', gd12 = 'GD12',
            grav = 'Gravimetric')
BMPSubC$method.label <- labels[BMPSubC$method]

# Only plot with substrate C
ggplot(BMPSubC) +
  geom_col(aes(method.label, mean, fill = descrip), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(method.label, ymin = lwr, ymax = upr, group = descrip), position = 'dodge', colour = 'gray55') +
  #facet_grid(. ~ exper, scales = 'free_x') +
  labs(x = 'Method', y = expression('BMP [mL/g]'), fill = 'Substrate') + theme_bw()+ 
  theme(axis.text.x = element_text(angle = 30, hjust = 1))  + guides(fill = FALSE) +
ggsave('../plots/BarplotR_3A.png')

# Same plot but only with GD3
d <- subset(BMP2, method %in% c('grav', 'gd03'))

d$lwr <- d$mean - d$sd
d$upr <- d$mean + d$sd

ggplot(d) +
  geom_col(aes(descrip, mean, fill = method), position = 'dodge', colour  = 'black') + 
  geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method), position = 'dodge', colour = 'gray55') +
  labs(x = "Substrate", y =expression('BMP [mL/g]'), fill = 'Method') + theme_bw() +
  scale_fill_discrete(labels = c("GD", "Gravimetric")) +
  theme(text = element_text(size = 10), legend.title = element_blank(), legend.position = "right") +
 ggsave('../plots/Barplot_R3B.png',width = 5, height = 3 )


# ----------------------------------------------------------------------


yld2$pid <- interaction(yld2$descrip, yld2$method)
ggplot(yld2, aes(elapsed.time, mean, group = pid)) +
  geom_line(aes(colour = method)) +
  facet_wrap(~ descrip)
ggsave('../plots/yld.interaction_exper2.png')

ggplot(BMP2, aes(method, mean, colour = descrip)) + 
  geom_point() + geom_line(aes(group = descrip)) + 
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) + 
  labs(x = 'Method', y = 'Mean Cumulative CH4 [mL]', colour = 'Description')  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
#ggsave('../plots/method_comparison_BMP_exper2.png')
ggsave('../plots/method_comparison_BMP_exper2_good_substrate.png')

# Plot with reverse of method/descrip [2]
ggplot(BMP2, aes(descrip, mean, colour = method)) +
  geom_point() + geom_line(aes(group = method)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_reverse_exper2.png')
#ggsave('../plots/method_comparison_BMP_reverse_exper2_good_substrate.png')


# Barplot option
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
ggsave('../plots/BMP2_comp_bars_good_substrate.pdf', height = 6, width = 6, scale = 1.2)
ggsave('../plots/BMP2_comp_bars_good_substrate.png')
# ggsave('../plots/BMP2_comp_bars_good_substrate.pdf', height = 6, width = 6, scale = 1.2)
# ggsave('../plots/BMP2_comp_bars_good_substrate.png')

# Barplot option for presentation
dd <- subset(BMP2, method %in% c('grav', 'gd03'))
dd$method <- factor(dd$method, levels = c('grav', 'gd03'), labels = c('Grav.', 'GD'))
ggplot(dd) +
  geom_col(aes(descrip, mean, fill = method), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method), position = 'dodge', colour = 'gray55') +
  labs(x = 'Substrate', y = expression('BMP'~(mL~g^'-1')), fill = 'Method') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave('../plots/BMP2_comp_bars_good_substrate_v2.png', height = 4, width = 5, scale = 0.8)

# Barplot option
ggplot(BMP2) +
  geom_col(aes(method, mean, fill = descrip), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(method, ymin = lwr, ymax = upr, group = descrip), position = 'dodge', colour = 'gray55') +
  #facet_grid(. ~ exper, scales = 'free_x') +
  labs(x = 'Method', y = expression('BMP'~(mL~g^'-1')), fill = 'Substrate') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#theme_bw() + scale_fill_manual(values = c('gray65', 'gray95'))  +
#theme(legend.position = 'none')
ggsave('../plots/BMP2_comp_bars_reverse.png')

SubA <- subset(BMP2, descrip == 'A')
ggplot(SubA) +
  geom_col(aes(method, mean, fill = descrip), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(method, ymin = lwr, ymax = upr, group = descrip), position = 'dodge', colour = 'gray55') +
  #facet_grid(. ~ exper, scales = 'free_x') +
  labs(x = 'Method', y = expression('BMP'~(mL~g^'-1')), fill = 'Substrate') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#theme_bw() + scale_fill_manual(values = c('gray65', 'gray95'))  +
#theme(legend.position = 'none')
ggsave('../plots/BMP2_comp_bars_A.png')

SubB <- subset(BMP2, descrip == 'B')
ggplot(SubB) +
  geom_col(aes(method, mean, fill = descrip), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(method, ymin = lwr, ymax = upr, group = descrip), position = 'dodge', colour = 'gray55') +
  #facet_grid(. ~ exper, scales = 'free_x') +
  labs(x = 'Method', y = expression('BMP'~(mL~g^'-1')), fill = 'Substrate') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#theme_bw() + scale_fill_manual(values = c('gray65', 'gray95'))  +
#theme(legend.position = 'none')
ggsave('../plots/BMP2_comp_bars_B.png')

SubC <- subset(BMP2, descrip == 'C')
ggplot(SubC) +
  geom_col(aes(method, mean, fill = descrip), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(method, ymin = lwr, ymax = upr, group = descrip), position = 'dodge', colour = 'gray55') +
  #facet_grid(. ~ exper, scales = 'free_x') +
  labs(x = 'Method', y = expression('BMP'~(mL~g^'-1')), fill = 'Substrate') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#theme_bw() + scale_fill_manual(values = c('gray65', 'gray95'))  +
#theme(legend.position = 'none')
ggsave('../plots/BMP2_comp_bars_C.png')

SubEtOH <- subset(BMP2, descrip == 'Ethanol')
ggplot(SubEtOH) +
  geom_col(aes(method, mean, fill = descrip), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(method, ymin = lwr, ymax = upr, group = descrip), position = 'dodge', colour = 'gray55') +
  #facet_grid(. ~ exper, scales = 'free_x') +
  labs(x = 'Method', y = expression('BMP'~(mL~g^'-1')), fill = 'Substrate') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#theme_bw() + scale_fill_manual(values = c('gray65', 'gray95'))  +
#theme(legend.position = 'none')
ggsave('../plots/BMP2_comp_bars_EtOH.png')
