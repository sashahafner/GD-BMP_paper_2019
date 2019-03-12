# Plots
ggplot(BMP, aes(method, mean), fill = method, color = method) +
  geom_bar(stat = 'identity', color = 'black') + 
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2)+
  ggtitle("GD Method") +
  labs(x = "Method", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  facet_grid(~ descrip) + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/GD_methods_barplot.png')
# See how "nice" Substrate D is - which has no leaks

# yld
yld$pid <- interaction(yld$descrip, yld$method)
ggplot(yld, aes(elapsed.time, mean, group = pid)) +
  geom_line(aes(colour = method)) +
  facet_wrap(~ descrip)
ggsave('../plots/yld.interaction.png')

# Plot of data before corrected for inoculum (GD)
ggplot(cbg.gd, aes(elapsed.time, cvCH4, colour = id )) +
  geom_point() +
  geom_line() + 
  ggtitle("GD Method") +
  labs(x = "Elapsed Time [hr]", y = "Cumulative CH4 [mL]", colour = "Substrate")  + 
  theme_bw() + 
  theme(text = element_text(size = 10))
ggsave('../plots/GD_biogas.png')


# ----------------------

# Plot mean data for each substrate (with ino and substrate correction) 

ggplot(BMP, aes(method, mean, colour = descrip)) + 
         geom_point() + geom_line(aes(group = descrip)) + 
         geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
         position=position_dodge(0.05)) + 
         labs(x = 'Method', y = 'BMP [mL]', colour = 'Description')  + 
         theme_bw() + 
         theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP.png')


# Plot with reverse of method/descrip
ggplot(BMP, aes(descrip, mean, colour = method)) +
  geom_point() + geom_line(aes(group = method)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(x = 'Description', y = 'BMP [mL]', colour = 'Method')  +
  theme_bw() +
  theme(text = element_text(size = 10))
ggsave('../plots/method_comparison_BMP_reverse.onlyGD.png')
ggsave('../plots/method_comparison_BMP_reverse.png')

# ----------------------

# # Plots
# ggplot(cbg.gd, aes(elapsed.time, cvCH4, colour = id)) + 
#   geom_line() + geom_point()  
# ggsave('../plots/cvCH4_gd.png')
# 
# ggplot(yld, aes(time.d, cvCH4, colour = substrate, group = id)) + 
#   geom_line() + geom_point() + labs(x = 'Time (d)', y = 'CH4 yield (mL/g)', colour = 'Substrate')
# ggsave('../plots/yield_gd.png')
# 
# ggplot(rates, aes(time.d, log10(rrvCH4), colour = id)) + 
#   geom_line() + geom_point()  + geom_hline(yintercept = log10(c(1, 0.5)))
# ggsave('../plots/rrates.png')

ggplot(yld, aes(elapsed.time, mean, colour = descrip))  + geom_point() + labs(x = 'Time (d)', y = 'CH4 yield (mL/g)', colour = 'descrip')
ggsave('../plots/yield_gd.png')
