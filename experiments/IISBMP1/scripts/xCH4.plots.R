# Make plots for xCH4

# Plot GC measured results
comp1 <- merge(comp1, setup[, c('id.exper', 'descrip')], by = c("id.exper"), all.x = TRUE)    # Change to comp later on
comp1$method <- 'GC'

ggplot(comp1, aes(elapsed.time, xCH4, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id.exper)) +
  # geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2, position=position_dodge(0.05)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition GC') +
  theme_bw() + 
  theme(text = element_text(size = 8))
ggsave('../plots/xCH4comp.png')
# All but inoculum and celulose decreaes in methane composition during time - is it normal? 
# Is most methane produced in the beginning of the experiments and then "vented-out"? Hence composition decreases. 


# man, grav and vol methods  - These should be the same as it is calculated from GC
# - What has been done in code to keep the xCH4 at the highest level instead of dropping?
ggplot(cbg.grav, aes(elapsed.time, xCH4, colour = descrip)) +
  geom_point() + geom_line(aes(group = id))+
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  +
  ggtitle('Composition Gravimetric GC') +
  theme_bw() +
  theme(text = element_text(size = 8))
ggsave('../plots/xCH4grav.png')

# ggplot(cbg.man, aes(elapsed.time, xCH4, colour = descrip)) + 
#   geom_point() + geom_line(aes(group = id.exper)) +
#   labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
#   ggtitle('Composition Manometric') +
#   theme_bw() + 
#   theme(text = element_text(size = 8))
# ggsave('../plots/xCH4man.png')

# 
# ggplot(cbg.vol, aes(elapsed.time, xCH4, colour = descrip)) +
#   geom_point() + geom_line(aes(group = id)) +
#   labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  +
#   ggtitle('Composition Gravimetric') +
#   theme_bw() +
#   theme(text = element_text(size = 8))
# ggsave('../plots/xCH4grav.png')


# ----------------

# Plot all gd methods composition in one plot
cbg.gd.all <- biogas:::rbindf(
  # cbg.vol, cbg.man, 
cbg.grav, 
  #cbg.gd, 
  cbg.gd01, cbg.gd02, cbg.gd03, cbg.gd04, cbg.gd05, cbg.gd06, 
  comp1, 
  cbg.gd07,
  cbg.gd08, cbg.gd09,
  cbg.gd10,
  cbg.gd11, cbg.gd12
  )

ggplot(cbg.gd.all, aes(elapsed.time, xCH4, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id.exper)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition Comparison') +
  theme_bw() + 
  theme(text = element_text(size = 8)) +
  facet_grid(method ~. )   # What is the best grid after adding all (or chosen) gd methods
ggsave('../plots/xCH4.png')

ggplot(cbg.gd.all, aes(elapsed.time, xCH4, colour = descrip)) + 
  geom_point() + geom_line(aes(group = id.exper)) + 
  labs(x = 'Time [d]', y = 'CH4 Composition', colour = 'Substrate')  + 
  ggtitle('Composition Comparison') +
  theme_bw() + 
  theme(text = element_text(size = 8)) +
  facet_wrap(method ~. )   # What is the best grid after adding all (or chosen) gd methods
ggsave('../plots/xCH4.wrap.png')

# ---------------

# grav methods
ggplot(cbg.gd01, aes(elapsed.time, xCH4, colour = descrip)) +
  geom_point() + geom_line(aes(group = id.exper))
ggsave('../plots/xCH4gd1.png')
ggplot(cbg.gd02, aes(elapsed.time, xCH4, colour = descrip)) +
  geom_point() + geom_line(aes(group = id.exper))
ggsave('../plots/xCH4gd2.png')
ggplot(cbg.gd03, aes(elapsed.time, xCH4, colour = descrip)) +
  geom_point() + geom_line(aes(group = id.exper))
ggsave('../plots/xCH4gd3.png')
ggplot(cbg.gd04, aes(elapsed.time, xCH4, colour = descrip)) +
  geom_point() + geom_line(aes(group = id.exper))
ggsave('../plots/xCH4gd4.png')
ggplot(cbg.gd05, aes(elapsed.time, xCH4, colour = descrip)) +
  geom_point() + geom_line(aes(group = id.exper))
ggsave('../plots/xCH4gd5.png')
ggplot(cbg.gd06, aes(elapsed.time, xCH4, colour = descrip)) +
  geom_point() + geom_line(aes(group = id.exper))
ggsave('../plots/xCH4gd6.png')

ggplot(cbg.gd07, aes(elapsed.time, xCH4, colour = descrip)) +
  geom_point() + geom_line(aes(group = id.exper))
ggsave('../plots/xCH4gd7.png')
ggplot(cbg.gd10, aes(elapsed.time, xCH4, colour = descrip)) +
  geom_point() + geom_line(aes(group = id.exper))
ggsave('../plots/xCH4gd10.png')
 
# # Straight (final)
ggplot(cbg.gd09, aes(elapsed.time, xCH4, colour = descrip)) +
  geom_point() + geom_line(aes(group = id.exper))
ggsave('../plots/xCH4gd9.png')
ggplot(cbg.gd12, aes(elapsed.time, xCH4, colour = descrip)) +
  geom_point() + geom_line(aes(group = id.exper))
ggsave('../plots/xCH4gd12.png')
 
ggplot(cbg.gd08, aes(elapsed.time, xCH4, colour = descrip)) +
  geom_point() + geom_line(aes(group = id.exper))
ggsave('../plots/xCH4gd8.png')
ggplot(cbg.gd11, aes(elapsed.time, xCH4, colour = descrip)) +
  geom_point() + geom_line(aes(group = id.exper))
ggsave('../plots/xCH4gd11.png')

# It only seems to be the cumulative and final averaging method that makes sense in order to get methane content. 
# Using the final averaging method only gives one methane content for the full experiment. 
# Using cummulative xCH4 also decreases for the last three (approx) measurements 
