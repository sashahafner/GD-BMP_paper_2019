# cumBg() calls and gdComp
# NTS: is extrapolation for BMP really needed?

# Set biogas options
options(unit.pres = 'bar', pres.std = 1.01325)

# ADD THIS DATA FRAME FOR ONLY NO LEAK BOTTLES FROM EXPER 2
biogas <- no.leaks2.biogas
biogas <- subset(biogas, !id %in% c('C4', 'C5'))


# Calculation of cumulative biogas based on both experiments at the same time 

# Manometric biogas calculation
which(is.na(biogas$pres.init))
# biogas.man <- biogas[!is.na(biogas$pres.init), ]

cbg.man <- cumBg(biogas, dat.type = 'pres', temp = 30,
                 data.struct = 'longcombo',
                 id.name = 'id.exper', time.name = 'elapsed.time',
                 dat.name = 'pres.init', comp.name = 'xCH4',
                 temp.init = 20,
                 pres.resid = 0, pres.init = 0, pres.amb = 1.01325,
                 headspace = setup, vol.hs.name = 'vol.hs',
                 extrap = TRUE,
                 absolute = FALSE)

# NTS: check if the temperature and pressure is recorded or should be adjusted


# Gravimetric biogas calculation
which(is.na(biogas$mass.init))
which(is.na(biogas$mass.final))

biogas.grav <- biogas[!is.na(biogas$mass.init), ]
cbg.grav <- cumBg(biogas.grav, dat.type = 'mass', 
                  temp = 30, pres = 1.50,
                  data.struct = 'longcombo',
                  id.name = 'id.exper', time.name = 'elapsed.time',
                  dat.name = 'mass.final', comp.name = 'xCH4',
                  headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  temp.init = 20,
                  extrap = TRUE)

# Volumetric biogas calculation
which(is.na(biogas$vol))

cbg.vol <- cumBg(biogas, dat.type = 'vol', 
                 temp = 20, pres = 1.01325,
                 data.struct = 'longcombo',
                 id.name = 'id.exper', time.name = 'elapsed.time',
                 dat.name = 'vol', comp.name = 'xCH4',
                 headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                 extrap = TRUE) 

