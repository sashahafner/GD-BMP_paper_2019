# cumBg() calls and gdComp
# NTS: is extrapolation for BMP really needed?

# Set biogas options
options(unit.pres = 'mbar', pres.std = 1013.25)

# Calculation of cumulative biogas based on both experiments at the same time 

cbg.man <- cumBg(biogas, dat.type = 'pres', temp = 30,
                 data.struct = 'longcombo',
                 id.name = 'id', time.name = 'time.d',
                 dat.name = 'pres.init', comp.name = 'xCH4',
                 temp.init = 20,
                 pres.resid = 0, pres.init = 0, pres.amb = 1013.25,
                 headspace = setup, vol.hs.name = 'vol.hs',
                 extrap = TRUE,
                 absolute = FALSE)
# NTS: check if the temperature and pressure is recorded or should be adjusted

# Gravimetric biogas calculation
which(is.na(biogas$mass.init))
which(is.na(biogas$mass.final))

# Do we need to remove mass.init data when zero for first bottles
#biogas.grav <- biogas[!is.na(biogas$mass.init), ]
cbg.grav <- cumBg(biogas, dat.type = 'mass', 
                  temp = 30, pres = 1500,
                  data.struct = 'longcombo',
                  id.name = 'id', time.name = 'time.d',
                  dat.name = 'mass.final', comp.name = 'xCH4',
                  headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  temp.init = 20,
                  extrap = TRUE)


cbg.list <- list(man = cbg.man,
                 grav = cbg.grav
                )
