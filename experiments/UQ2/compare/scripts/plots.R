# Plots

# PLOTS FOR RESULT PART 2
# Plot mean data for each substrate (with ino and substrate correction) 
ggplot(BMP.gd3.grav, aes(method, mean, colour = descrip)) + 
  geom_point() + geom_line(aes(group = descrip)) + 
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  geom_hline(yintercept = predBg("C6H10O5"), linetype = "dashed", color = "lightblue", size = 1) +
  geom_hline(yintercept = predBg("C18H32O8N"),linetype = "dashed", color = "red", size = 1) +
  labs(x = 'Method', y = 'Mean Cumulative CH4 [mL]', colour = 'Description')  + 
  theme_bw() + ylim(0,650) +
  theme(text = element_text(size = 10))
ggsave('../plots/scatter_R2a.png')

# Table for BMP.gd3.grav comparison instead of a plot
write.csv(BMP.gd3.grav[, c("method", "descrip", "mean", "sd")], '../output/BMP_grav_gd03_comparison.csv', row.names = FALSE)


# Plot with reverse of method/descrip
ggplot(BMP.gd3.grav, aes(descrip, mean, colour = method)) +
  geom_point() + geom_line(aes(group = method)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10))
ggsave('../plots/scatterR2_not.used.png')

# Barplot option
BMP.gd3.grav$lwr <- BMP.gd3.grav$mean - BMP.gd3.grav$sd
BMP.gd3.grav$upr <- BMP.gd3.grav$mean + BMP.gd3.grav$sd
ggplot(BMP.gd3.grav) +
  geom_col(aes(descrip, mean, fill = method), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method), position = 'dodge', colour = 'gray55') +
  #facet_grid(. ~ exper, scales = 'free_x') +
  labs(x = 'Substrate', y = expression('BMP'~(mL~g^'-1')), fill = 'Method') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#theme_bw() + scale_fill_manual(values = c('gray65', 'gray95'))  +
#theme(legend.position = 'none')
ggsave('../plots/BMP_barplot.R2b.pdf', height = 6, width = 6, scale = 1.2)
ggsave('../plots/BMP_barplot.R2b.png')


# ------------------------------------------------------------

# Plot mean data for each substrate (with ino and substrate correction) 
ggplot(BMP, aes(method, mean, colour = descrip)) + 
  geom_point() + geom_line(aes(group = descrip)) + 
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  geom_hline(yintercept = predBg("C6H10O5"), linetype = "dashed", color = "lightblue", size = 1) +
  geom_hline(yintercept = predBg("C18H32O8N"),linetype = "dashed", color = "red", size = 1) +
  labs(x = 'Method', y = 'Mean Cumulative CH4 [mL]', colour = 'Description')  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/scatter_all_methods.png')


# Plot with reverse of method/descrip
ggplot(BMP, aes(descrip, mean, colour = method)) +
  geom_point() + geom_line(aes(group = method)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10))
#ggsave('../plots/method_comparison_BMP_reverse.png')

# Barplot option
labels <- c(gd01 = 'GD01', gd02 = 'GD02', gd03 = 'GD03', gd04 = 'GD04', gd05 = 'GD05', gd06 = 'GD06',
            gd07 = 'GD07', gd08 = 'GD08', gd09 = 'GD09', gd10 = 'GD10', gd11 = 'GD11', gd12 = 'GD12',
            grav = 'Gravimetric')
BMP$method.label <- labels[BMP$method]
BMP$lwr <- BMP$mean - BMP$sd
BMP$upr <- BMP$mean + BMP$sd
ggplot(BMP) +
  geom_col(aes(descrip, mean, fill = method.label), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method.label), position = 'dodge', colour = 'gray55') +
  #facet_grid(. ~ exper, scales = 'free_x') +
  labs(x = 'Substrate', y = expression('BMP (mL/g)'), fill = 'Method') + theme_bw()+ 
  theme(legend.title = element_blank(), legend.position = "right" ) + 
#theme_bw() + scale_fill_manual(values = c('gray65', 'gray95'))  +
#theme(legend.position = 'none')
ggsave('../plots/BMP_barplot_all.methods.pdf', height = 6, width = 6, scale = 1.2)
ggsave('../plots/BMP_barplot_all.methods.png', height = 4, width = 5 )

ggplot(BMPSubC) +
  geom_col(aes(method.label, mean, fill = descrip), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(method.label, ymin = lwr, ymax = upr, group = descrip), position = 'dodge', colour = 'gray55') +
  #facet_grid(. ~ exper, scales = 'free_x') +
  labs(x = 'Method', y = expression('BMP [mL/g]'), fill = 'Substrate') + theme_bw()+ 
  theme(axis.text.x = element_text(angle = 30, hjust = 1))  + guides(fill = FALSE) +
  ggsave('../plots/BarplotR_3A.png', height = 3, width = 5)



# Yield plot
sub.lab <- c("C" = "Feed ingredient C", "L" = "Cellulose")
ggplot(yld.gd03.grav, aes(elapsed.time, mean, colour = method)) +
  geom_point() + geom_line(aes(group = method)) +
  labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
  theme_bw() + 
  scale_color_hue(labels = c("GD", "Gravimetric")) +
  labs(x = 'Time [d]', y = expression('CH'[4]*' yield [mL/g]'), colour = "Method" , theme()) +
  facet_wrap(~ descrip, labeller = as_labeller(sub.lab)) + theme_bw() +
  theme(text = element_text(size = 10), legend.title = element_blank(), legend.position = "right" ) + 
ggsave('../plots/yld.png', width = 8, height = 3)
