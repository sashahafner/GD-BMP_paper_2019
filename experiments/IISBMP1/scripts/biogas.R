# cumBg() calls and gdComp
# NTS: is extrapolation for BMP really needed?

# Set biogas options
options(unit.pres = 'bar', pres.std = 1.01325)

# NB: Sasha calculates for biogas for each experiment individually, why not do it from one dataset? 

# Set BMP duration for all calls
when.BMP <- 30

# Only use experiment 1 (remeber to change to biogas1 when removing the NAs too)
# biogas1 <- biogas[biogas$exper == 1, ]

# Manometric biogas calculation
which(is.na(biogas$pres.init))
biogas.man <- biogas[!is.na(biogas$pres.init), ]

cbg.man <- cumBg(biogas.man, dat.type = 'pres', temp = 35,
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
                  temp = 30, pres = 1.01,
                  data.struct = 'longcombo',
                  id.name = 'id.exper', time.name = 'elapsed.time',
                  dat.name = 'mass.final', comp.name = 'xCH4',
                  headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  temp.init = 20,
                  extrap = TRUE)

# Volumetric biogas calculation
which(is.na(biogas$vol))

biogas.vol <- biogas[!is.na(biogas$vol), ]
cbg.vol <- cumBg(biogas.vol, dat.type = 'vol', 
                 temp = 20, pres = 1.01325,
                 data.struct = 'longcombo',
                 id.name = 'id.exper', time.name = 'elapsed.time',
                 dat.name = 'vol', comp.name = 'xCH4',
                 headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                 extrap = TRUE) 


# Biogas by gd
biogas <- biogas[order(biogas$id, biogas$elapsed.time), ]
biogas.gd <- biogas[!is.na(biogas$vol) & !is.na(biogas$mass.init) & !is.na(biogas$mass.final), ]

cbg.gd <- as.data.frame(mutate(group_by(biogas.gd, id.exper), cvol = cumsum(vol), cmassloss = mass.final[1]-mass.final))

# Make a GD data frame
cbg.gd$xCH4 <- gdComp(cbg.gd$cmassloss, cbg.gd$cvol, temp = 20, pres = 1.01325)


# volumetric less sensitive to comp.therefore, use this one with GD. Can also try others afterwards. 
## But when using dat.type = 'vol' - wont it affect the results which method is used? 

cbg.gd <- cumBg(cbg.gd, dat.type = 'vol', 
                 temp = 20, pres = 1.01325,
                 data.struct = 'longcombo',
                 id.name = 'id.exper', time.name = 'elapsed.time',
                 dat.name = 'vol', comp.name = 'xCH4',
                 headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                 showt0 = FALSE, temp.init = 20,
                 addt0 = FALSE, extrap = TRUE) 


cbg.list <- list(vol = cbg.vol, man = cbg.man, grav = cbg.grav, gd = cbg.gd) 
BMP <- summBg(cbg.list, setup, id.name = "id.exper",
              time.name = 'elapsed.time', descrip.name = 'descrip',
              inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = when.BMP, extrap = TRUE, set.name = 'method')
# As there is only one value in 5 of the id.exper interpolation is not possile. 

# o for "obs" = one value for each bottle
#BMPo <- ... show.obs = TRUE)
BMPo <- summBg(cbg.list, setup, id.name = "id.exper",
               time.name = 'elapsed.time', descrip.name = 'descrip',
               inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
               when = when.BMP, extrap = TRUE, set.name = 'method', show.obs = TRUE)

# yld for yield
#yld <- ... when = 'meas')
yld <- summBg(cbg.list, setup, id.name = "id.exper",
              time.name = 'elapsed.time', descrip.name = 'descrip',
              inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = 'meas', extrap = TRUE, set.name = 'method')
