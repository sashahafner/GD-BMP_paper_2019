# cumBg() calls

# Set biogas options
options(unit.pres = 'kPa')

# Remember to change the biogas further on to meas if correct

# Manometric biogas calculation
cbg.man <- cumBg(biogas, dat.type = 'pres', comp = comp, temp = 35,
                 data.struct = 'long',
                 id.name = 'id', time.name = 'elapsed.time',
                 dat.name = 'pres.init', comp.name = 'xCH4',
                 temp.init = 20,
                 pres.resid = 'pres.resid', pres.init = 0, pres.amb = 101.325,
                 headspace = setup, vol.hs.name = 'vol.hs',
                 addt0 = FALSE, extrap = TRUE,
                 absolute = FALSE)

# Should the pres.init = 'pres.init' instead of the numeric value? 
# check if the temperature and pressure is recorded or should be adjusted

cbg.man.corr <- summBg(cbg.man, setup, id.name = "id", 
                       time.name = 'elapsed.time', descrip.name = 'descrip', 
                       inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                       when = "end", extrap = TRUE)

# Gravimetric biogas calculation
cbg.grav <- cumBg(biogas, dat.type = 'mass', comp = comp, temp = 35, pres = 150,
                  data.struct = 'long',
                  id.name = 'id', time.name = 'elapsed.time',
                  dat.name = 'mass.final', comp.name = 'xCH4',
                  headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  showt0 = FALSE, temp.init = 20,
                  addt0 = FALSE, extrap = TRUE)

# Check temp, pres etc. is correct 
# dat.name for this calculation - is it the difference or just the final mass?

cbg.grav.corr <- summBg(cbg.grav, setup, id.name = "id", 
                       time.name = 'elapsed.time', descrip.name = 'descrip', 
                       inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                       when = "end", extrap = TRUE)


# Volumetric biogas calculation
cbg.vol <- cumBg(biogas, dat.type = 'vol', comp = comp, temp = 35, pres = 101.325,
                  data.struct = 'long',
                  id.name = 'id', time.name = 'elapsed.time',
                  dat.name = 'vol', comp.name = 'xCH4',
                  headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  showt0 = FALSE, temp.init = 20,
                  addt0 = FALSE, extrap = TRUE) 

cbg.vol.corr <- summBg(cbg.vol, setup, id.name = "id", 
                       time.name = 'elapsed.time', descrip.name = 'descrip', 
                       inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                       when = "end", extrap = TRUE)


biogas <- biogas[order(biogas$id, biogas$elapsed.time), ]
cbg.gd <- as.data.frame(mutate(group_by(biogas, id), cvol = cumsum(vol), cmassloss = mass.final[1]-mass.final))

# Make a GD data frame
cbg.gd$xCH4 <- gdComp(cbg.gd$cmassloss, cbg.gd$cvol, temp = 20, pres = 101.325)


# volumetric less sensitive to comp.therefore, use this one with GD. Can also try others afterwards. 
## But when using dat.type = 'vol' - wont it affect the results which method is used? 
cbg.gd <- cumBg(cbg.gd, dat.type = 'vol', temp = 20, pres = 101.325,
                 data.struct = 'longcombo',
                 id.name = 'id', time.name = 'elapsed.time',
                 dat.name = 'vol', comp.name = 'xCH4',
                 headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                 showt0 = FALSE, temp.init = 20,
                 addt0 = FALSE, extrap = TRUE) 

cbg.gd.corr <- summBg(cbg.gd, setup, id.name = "id", 
                       time.name = 'elapsed.time', descrip.name = 'descrip', 
                       inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                       when = "end", extrap = TRUE)


# To make the plot possible grouped by substrate type and ISR and not triplicates a substring is constructud
cbg.grav$grav.subs.type <- substr(cbg.grav$id, 1, 2)
cbg.vol$vol.subs.type <- substr(cbg.vol$id, 1, 2)
cbg.man$man.subs.type <- substr(cbg.man$id, 1, 2)
cbg.gd$gd.subs.type <- substr(cbg.gd$id, 1, 2)

# Add method column in each corrected result
cbg.man.corr$method <- "manometric"
cbg.vol.corr$method <- "volumetric"
cbg.grav.corr$method <- "gravimetric"
cbg.gd.corr$method <- "GD"

# Make result table from all three methods
cbg.all <- rbind(cbg.man.corr, cbg.grav.corr, cbg.vol.corr, cbg.gd.corr)
  

# Bind by column instead
colnames(cbg.grav.corr) <- paste(colnames(cbg.grav.corr), "grav", sep = "_")
colnames(cbg.vol.corr) <- paste(colnames(cbg.vol.corr), "vol", sep = "_")
colnames(cbg.man.corr) <- paste(colnames(cbg.man.corr), "man", sep = "_")
colnames(cbg.gd.corr) <- paste(colnames(cbg.gd.corr), "gd", sep = "_")

cbg.all.c <- cbind(cbg.man.corr, cbg.grav.corr, cbg.vol.corr, cbg.gd.corr)

# Leaks are a problem we need to deal with
# Just to see it (need to move this code, to leaks.R?)
leaks <- mutate(group_by(biogas, id), leak.m = c(NA, mass.final[-length(mass.final)] - mass.init[-1]))
plot(sort((leaks$leak.m)))
abline(0, 0)


# Merge man and grav dataset to use for optimize function
#cbg <- merge(cbg.man.corr, cbg.grav.corr, cbg.vol.corr, by = c('descrip', 'date.time', 'mean'), 
#            suffixes = c('.man', '.grav', '.vol'))

# # Some observations missing for grav data dropped above
# # Recalc vCH4 vBg for man (also grav to be safe, but should not be needed)
# cbg <- ddply(cbg, 'id', mutate,
#              vBg.grav = diff(c(0, cvBg.grav)),
#              vCH4.grav = diff(c(0, cvCH4.grav)),
#              vBg.man = diff(c(0, cvBg.man)),
#              vCH4.man = diff(c(0, cvCH4.man))
# )
# 
# # Calculate difference
# cbg$vBg.diff <- cbg$vBg.man - cbg$vBg.grav
# cbg$vCH4.diff <- cbg$vCH4.man - cbg$vCH4.grav
# cbg$cvBg.diff <- cbg$cvBg.man - cbg$cvBg.grav
# cbg$cvCH4.diff <- cbg$cvCH4.man - cbg$cvCH4.grav


# ANOVA
# mod.BMP <- aov(mean ~ descrip*method, data = cbg.all)
# summary(mod.BMP)
# mod.BMP
