# Plots

# Plots for R4 bad data
BMP.gd03.06.grav <- subset(BMP, method == 'gd03' | method == 'gd06' | method == 'grav')
BMP.gd03.06.grav$lwr <- BMP.gd03.06.grav$mean - BMP.gd03.06.grav$sd
BMP.gd03.06.grav$upr <- BMP.gd03.06.grav$mean + BMP.gd03.06.grav$sd

ggplot(BMP.gd03.06.grav) +
  geom_col(aes(method, mean, fill = descrip), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(method, ymin = lwr, ymax = upr, group = descrip), position = 'dodge', colour = 'gray55') +
  #facet_grid(. ~ exper, scales = 'free_x') +
  labs(x = 'Method', y = expression('BMP'~(mL~g^'-1')), fill = 'Substrate') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#theme_bw() + scale_fill_manual(values = c('gray65', 'gray95'))  +
#theme(legend.position = 'none')
ggsave('../plots/barplot_R4A.png')

ggplot(BMP.gd03.06.grav) +
  geom_col(aes(descrip, mean, fill = method), position = 'dodge', colour  = 'black') +
  geom_errorbar(aes(descrip, ymin = lwr, ymax = upr, group = method), position = 'dodge', colour = 'gray55') +
  labs(x = 'Substrate', y = expression('BMP'~(mL~g^'-1')), fill = 'Method') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave('../plots/Barplot2_R4B.png')

# Plot with reverse of method/descrip [2]
q <- subset(BMP.gd03.06.grav, descrip == 'Cellulose' | descrip == 'Ethanol' | descrip == 'Raw sludge' | descrip == 'Sludge C1' | descrip == 'Sludge C2')
q$method <- factor(q$me, levels = c('gd03', 'gd06', 'grav' ), labels = c('Total mass', 'Vented mass', 'Gravimetric'))

ggplot(q, aes(method, mean, colour = descrip)) +
  geom_point() + geom_line(aes(group = descrip)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(x = 'Method', y = expression('Mean cumulative CH'[4]*' [mL]'), colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10), legend.title = element_blank(), legend.position = "right" ) + 
ggsave('../plots/scatter_R4C.png')

# ----------------------------------------


# Plots
ggplot(BMP.gd03.06.grav, aes(method, mean), fill = method, color = method) +
  geom_bar(stat = 'identity', color = 'black') + 
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2)+
  ggtitle("GD Method") +
  labs(x = "Method", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  facet_wrap(~ descrip) +
theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/GD_methods_barplot.png')
# See how "nice" Substrate D is - which has no leaks

# # More interesting with yld
# yld$pid <- interaction(yld$descrip, yld$method)
# ggplot(yld, aes(elapsed.time, mean, group = pid)) +
#   geom_line(aes(colour = method)) +
#   facet_wrap(~ descrip)
# ggsave('../plots/yld.interaction.png')
# 
# ggplot(yld, aes(elapsed.time, mean)) +
#   geom_line(aes(colour = method)) +
#   facet_wrap(~ descrip)
# ggsave('../plots/yld.png')


# ----------------------

ggplot(BMP, aes(method, mean, colour = descrip)) + 
  geom_point() + geom_line(aes(group = descrip)) + 
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) + 
  labs(x = 'Method', y = 'Mean Cumulative CH4 [mL]', colour = 'Description')  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP.png')

# # Plot with reverse of method/descrip
# ggplot(BMP, aes(descrip, mean, colour = method)) +
#   geom_point() + geom_line(aes(group = method)) +
#   geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
#                 position=position_dodge(0.05)) +
#   labs(x = 'Description', y = 'Mean Cumulative CH4 [mL]', colour = 'Method')  +
#   theme_bw() +
#   theme(text = element_text(size = 10))
# ggsave('../plots/method_comparison_BMP_reverse.png')




# Some other possibilities . . .
# cbg.all$pid <- interaction(cbg.all$id, cbg.all$method)
# ggplot(cbg.all, aes(elapsed.time, cvCH4, group = pid)) +
#   geom_line(aes(colour = method)) +
#   facet_wrap(~ descrip)
# ggsave('../plots/cum_CH4.png')


# ---------------
# Individual cbg data

# # Plot of data before corrected for inoculum (grav)
# ggplot(cbg.grav, aes(elapsed.time, cvCH4, colour = id )) +
#   geom_point() +
#   geom_line() + 
#   ggtitle("Gravimetric") +
#   labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
#   theme_bw() + 
#   theme(text = element_text(size = 10))
# ggsave('../plots/gravimetric_biogas.png')
# 
# # Plot of data before corrected for inoculum (vol)
# ggplot(cbg.vol, aes(elapsed.time, cvCH4, colour = id )) +
#   geom_point() +
#   geom_line() + 
#   ggtitle("Volumetric") +
#   labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
#   theme_bw() + 
#   theme(text = element_text(size = 10))
# ggsave('../plots/volumetric_biogas.png')
# 
# # Plot of data before corrected for inoculum (man)
# ggplot(cbg.man, aes(elapsed.time, cvCH4, colour = id )) +
#   geom_point() +
#   geom_line() + 
#   ggtitle("Manometric") +
#   labs(x = "Elapsed Time [day]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
#   theme_bw() + 
#   theme(text = element_text(size = 10))
# ggsave('../plots/manometric_biogas.png')
# 
# # Plot of data before corrected for inoculum (GD)
# ggplot(cbg.gd, aes(elapsed.time, cvCH4, colour = id )) +
#   geom_point() +
#   geom_line() + 
#   ggtitle("GD Method") +
#   labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  +
#   theme_bw() + 
#   theme(text = element_text(size = 10))
# ggsave('../plots/GD_biogas.png')
# 

# -----------
# # Using cbg.all data
# cbg.all$substrate <- substring(cbg.all$id, 1, 1)
# 
# # 2x2 plot
# ggplot(cbg.all, aes(elapsed.time, cvCH4, colour = id)) +
#   geom_point() +
#   geom_line() +
#   facet_wrap(~ method) +
#   ggtitle("All Methods") +
#   labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  +
#   theme_bw() +
#   theme(text = element_text(size = 10))
# ggsave('../plots/all_methods_cumBg.png')
#   
# # Horizontal alignment (1x4)
#   ggplot(cbg.all, aes(elapsed.time, cvCH4, colour = id), group_by(descrip)) +
#     geom_point() +
#     geom_line() +
#     facet_grid(~ method) +
#     ggtitle("All Methods") +
#     labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  +
#     theme_bw() +
#     theme(text = element_text(size = 10), legend.position = "bottom")
# ggsave('../plots/all_methods_cumBg_aligned_horisontal.png')
# 
# # plot each substrate individually 
# ggplot(cbg.all, aes(elapsed.time, cvCH4, colour = method)) +
#   geom_point() +
#   #geom_line() +
#   facet_wrap( ~ substrate) +
#   ggtitle("Grouped by Substrate") +
#   labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Method")  +
#   theme_bw() +
#   theme(text = element_text(size = 10))
# ggsave('../plots/all_methods_cumBg_groupby_substrate.png')



# ----------------------

# # Plots for method comparison directly
# jpeg('../plots/method_comparison_to_GD.png')
# par(mfrow=c(3,1))
# plot(BMP.all$mean.gd10, BMP.all$mean.grav)         # Seems to be no relation to grav
# abline(0,1)
# plot(BMP.all$mean.gd10, BMP.all$mean.man)          # Looks okay similar to man
# abline(0,1)
# plot(BMP.all$mean.gd10, BMP.all$mean.vol)          # Looks okay similar to vol
# abline(0,1)
# dev.off()
# 
# # Plots for comparion all methods
# jpeg('../plots/method_comparison_all_methods.png')
# par(mfrow=c(3,2))
# plot(BMP.all$mean.gd10, BMP.all$mean.grav)         # Seems to be no relation to grav
# abline(0,1)
# plot(BMP.all$mean.gd10, BMP.all$mean.man)          # Looks okay similar to man
# abline(0,1)
# plot(BMP.all$mean.gd10, BMP.all$mean.vol)          # Looks okay similar to vol
# abline(0,1)
# plot(BMP.all$mean.vol, BMP.all$mean.man)
# abline(0,1)
# plot(BMP.all$mean.vol, BMP.all$mean.grav)
# abline(0,1)
# plot(BMP.all$mean.man, BMP.all$mean.grav)
# abline(0,1)
# dev.off()
# 
# 
# jpeg('../plots/method_comparison_gd_methods.png')
# par(mfrow=c(3,2))
# plot(BMP.all$mean.gd10, BMP.all$mean.gd7)         # Seems to be no relation to grav
# abline(0,1)
# plot(BMP.all$mean.gd10, BMP.all$mean.gd8)          # Looks okay similar to man
# abline(0,1)
# plot(BMP.all$mean.gd10, BMP.all$mean.gd9)          # Looks okay similar to vol
# abline(0,1)
# plot(BMP.all$mean.gd10, BMP.all$mean.gd11)
# abline(0,1)
# plot(BMP.all$mean.gd10, BMP.all$mean.gd12)
# abline(0,1)
# plot(BMP.all$mean.gd10, BMP.all$mean.vol)
# abline(0,1)
# dev.off()