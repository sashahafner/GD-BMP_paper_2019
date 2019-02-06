# cumBg() calls

# Set biogas options
options(unit.pres = 'kPa')

# Delete all water samples and samples from the first sampling
biogas <- droplevels(subset(meas, !id %in% c("W1", "W2", "W3")))
biogas <- droplevels(subset(biogas, !date %in% c("14022017")))
biogas <- 

# Manometric biogas calculation
cbg.man <- cumBg(biogas, dat.type = 'pres', comp = comp, temp = 35,
                 data.struct = 'long',
                 id.name = 'id', time.name = 'day',
                 dat.name = 'pres.init', comp.name = 'xCH4',
                 temp.init = 20,
                 pres.resid = 'pres.resid', pres.init = 1.013,
                 headspace = setup, vol.hs.name = 'vol.hs',
                 addt0 = FALSE, extrap = FALSE)


# Should the pres.init = 'pres.init' instead of the numeric value? 
# Observing a problem with comp (structure(list(id = c("I1,I2,...))))








# # Merge man and grav dataset to use for optimize function
# cbg <- merge(cbg.man, cbg.grav, by = c('id', 'exper', 'date', 'time','time.d'), 
#              suffixes = c('.man', '.grav'))
# 
# # Some observations missing for grav data dropped above
# # Recalc vCH4 vBg for man (also grav to be safe, but should not be needed)
# cbg <- ddply(cbg, 'id', mutate, 
#                      vBg.grav = diff(c(0, cvBg.grav)), 
#                      vCH4.grav = diff(c(0, cvCH4.grav)),
#                      vBg.man = diff(c(0, cvBg.man)), 
#                      vCH4.man = diff(c(0, cvCH4.man))
#                      )
# 
# # Calculate difference
# cbg$vBg.diff <- cbg$vBg.man - cbg$vBg.grav
# cbg$vCH4.diff <- cbg$vCH4.man - cbg$vCH4.grav
# cbg$cvBg.diff <- cbg$cvBg.man - cbg$cvBg.grav
# cbg$cvCH4.diff <- cbg$cvCH4.man - cbg$cvCH4.grav
