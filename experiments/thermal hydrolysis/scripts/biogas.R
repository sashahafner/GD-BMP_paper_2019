# cumBg() calls

# Set biogas options
options(unit.pres = 'kPa')

# Delete all water samples and samples from the first sampling
biogas <- droplevels(subset(meas, !id %in% c("W1", "W2", "W3")))
biogas <- droplevels(subset(biogas, !date %in% c("14022017")))


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

cbg.vol.corr <- summBg(cbg.grav, setup, id.name = "id", 
                       time.name = 'elapsed.time', descrip.name = 'descrip', 
                       inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                       when = "end", extrap = TRUE)

# To make the plot possible grouped by substrate type and ISR and not triplicates a substring is constructud
cbg.grav$grav.subs.type <- substr(cbg.grav$id, 1, 2)
cbg.vol$vol.subs.type <- substr(cbg.vol$id, 1, 2)
cbg.man$man.subs.type <- substr(cbg.man$id, 1, 2)



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


