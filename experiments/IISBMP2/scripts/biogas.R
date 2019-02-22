# cumBg() calls
# NTS: is extrapolation for BMP really needed?

# Set biogas options
options(unit.pres = 'hPa')

# Gravimetric biogas calculation
cbg.grav <- cumBg(biogas, dat.type = 'mass', comp = 0.6, temp = 'temp.air', pres = 'pres.amb',
                  id.name = 'id', time.name = 'elapsed.time',
                  dat.name = 'mass.final',
                  headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  temp.init = 20,
                  extrap = TRUE)

# Should we use the columns for temp and pres.amb or temp = 30, pres = 150?(remember to correct to the unit hPa)

# Volumetric biogas calculation
cbg.vol <- cumBg(biogas.vol, dat.type = 'vol', comp = 0.6, temp = 'temp.air', pres = 'pres.amb',
                 id.name = 'id', time.name = 'elapsed.time',
                 dat.name = 'vol', comp.name = 'xCH4',
                 headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                 extrap = TRUE) 

# Use above or temp = 20, pres = 101.325 (remember to correct to the unit hPa)

# DOES IT MAKE ANY SENSE TO INCLUDE ABOVE METHODS WITOUH COMP?

# New gd function
cbg.gd <- cumBgGD(biogas, 
                  # temp = 20, pres = 101.325, 
                  temp = 'temp.air', pres = 'pres.amb',
                  id.name = 'id',vol.name = 'vol',
                  m.pre.name = 'mass.init', m.post.name = 'mass.final',
                  comp.name = 'xCH4', time.name = 'elapsed.time', 
                  vented.mass = TRUE, averaging = 'int', 
                  # temp.init = 20, 
                  # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  # extrap = FALSE, 
                  addt0 = TRUE, showt0 = TRUE)


# Merge
#cbg <- merge(cbg.vol, cbg.grav, by = 1:13, suffixes = c('.vol', '.grav'))

