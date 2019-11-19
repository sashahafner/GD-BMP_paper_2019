# cumBg() calls and gdComp
# NTS: is extrapolation for BMP really needed?

# Set biogas options
options(unit.pres = 'mbar')

# Calculation of cumulative biogas based on both experiments at the same time 

cbg.man <- cumBg(biogas, dat.type = 'pres', temp = 30,
                 data.struct = 'longcombo',
                 id.name = 'id', time.name = 'time.d',
                 dat.name = 'pres.init', comp.name = 'xCH4',
                 temp.init = 20,
                 pres.resid = 0, pres.init = 0, pres.amb = 1013.25,
                 headspace = setup, vol.hs.name = 'vol.hs',
                 absolute = FALSE)


# Gravimetric biogas calculation
cbg.grav <- cumBg(biogas, dat.type = 'mass', 
                  temp = 30, pres = 1500,
                  data.struct = 'longcombo',
                  id.name = 'id', time.name = 'time.d',
                  dat.name = 'mass.final', comp.name = 'xCH4',
                  headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  temp.init = 20)


cbg.list <- list(man = cbg.man, grav = cbg.grav)
