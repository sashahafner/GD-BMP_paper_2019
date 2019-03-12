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
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_R2gd3grav.png')

# Plot with reverse of method/descrip
ggplot(BMP.gd3.grav, aes(descrip, mean, colour = method)) +
  geom_point() + geom_line(aes(group = method)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_reverse_R2.2.png')

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
ggsave('../plots/BMP_barplot.R2.pdf', height = 6, width = 6, scale = 1.2)
ggsave('../plots/BMP_barplot.R2.png')


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
ggsave('../plots/method_comparison_BMP.png')


# Plot with reverse of method/descrip
ggplot(BMP, aes(descrip, mean, colour = method)) +
  geom_point() + geom_line(aes(group = method)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_reverse.png')

# Barplot option
BMP$lwr <- BMP$mean - BMP$sd
BMP$upr <- BMP$mean + BMP$sd
ggplot(BMP) +
  geom_col(aes(descrip, mean, fill = method), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method), position = 'dodge', colour = 'gray55') +
  #facet_grid(. ~ exper, scales = 'free_x') +
  labs(x = 'Substrate', y = expression('BMP'~(mL~g^'-1')), fill = 'Method') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#theme_bw() + scale_fill_manual(values = c('gray65', 'gray95'))  +
#theme(legend.position = 'none')
ggsave('../plots/BMP_barplot.pdf', height = 6, width = 6, scale = 1.2)
ggsave('../plots/BMP_barplot.png')
