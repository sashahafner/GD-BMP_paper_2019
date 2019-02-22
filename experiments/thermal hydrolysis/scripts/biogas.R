# cumBg() calls and gdComp
# NTS: is extrapolation for BMP really needed?

# Set biogas options
options(unit.pres = 'kPa')

# Manometric biogas calculation
cbg.man <- cumBg(biogas, dat.type = 'pres', comp = comp, temp = 30,
                 id.name = 'id', time.name = 'elapsed.time',
                 dat.name = 'pres.init', comp.name = 'xCH4',
                 temp.init = 20,
                 pres.resid = 'pres.resid', pres.init = 0, pres.amb = 101.325,
                 headspace = setup, vol.hs.name = 'vol.hs',
                 extrap = TRUE,
                 absolute = FALSE)

# Should the pres.init = 'pres.init' instead of the numeric value? 
# No
# NTS: check if the temperature and pressure is recorded or should be adjusted

# Gravimetric biogas calculation
cbg.grav <- cumBg(biogas, dat.type = 'mass', comp = comp, temp = 30, pres = 150,
                  id.name = 'id', time.name = 'elapsed.time',
                  dat.name = 'mass.final', comp.name = 'xCH4',
                  headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  temp.init = 20,
                  extrap = TRUE)

# NTS: Check temp, pres etc. is correct 
# dat.name for this calculation - is it the difference or just the final mass?
# Final mass

# Volumetric biogas calculation
cbg.vol <- cumBg(biogas, dat.type = 'vol', comp = comp, temp = 20, pres = 101.325,
                 id.name = 'id', time.name = 'elapsed.time',
                 dat.name = 'vol', comp.name = 'xCH4',
                 headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                 extrap = TRUE) 


# New gd function
cbg.gd1 <- cumBgGD(biogas, 
                  temp = 20, pres = 101.325, 
                  id.name = 'id',vol.name = 'vol',
                  m.pre.name = 'mass.init', m.post.name = 'mass.final',
                  comp.name = 'xCH4', time.name = 'elapsed.time', 
                  vented.mass = TRUE, averaging = 'int', 
                  # temp.init = 20, 
                  # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  # extrap = FALSE, 
                  addt0 = TRUE, showt0 = TRUE)

