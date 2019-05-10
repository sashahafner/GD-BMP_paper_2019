# cumBg() calls and gdComp
# NTS: is extrapolation for BMP really needed?

# Set biogas options
options(unit.pres = 'kPa')

# Manometric biogas calculation
cbg.man <- cumBg(biogas, dat.type = 'pres', comp = comp, temp = 30,
                 id.name = 'id', time.name = 'time.d',
                 dat.name = 'pres.init', comp.name = 'xCH4',
                 temp.init = 20,
                 pres.resid = 'pres.resid', pres.init = 0, pres.amb = 101.325,
                 headspace = setup, vol.hs.name = 'vol.hs',
                 extrap = TRUE,
                 absolute = FALSE)

# Gravimetric biogas calculation
cbg.grav <- cumBg(biogas, dat.type = 'mass', comp = comp, temp = 30, pres = 150,
                  id.name = 'id', time.name = 'time.d',
                  dat.name = 'mass.final', comp.name = 'xCH4',
                  headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  temp.init = 20,
                  extrap = TRUE)

# Volumetric biogas calculation
cbg.vol <- cumBg(biogas, dat.type = 'vol', comp = comp, temp = 20, pres = 101.325,
                 id.name = 'id', time.name = 'time.d',
                 dat.name = 'vol', comp.name = 'xCH4',
                 headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                 extrap = TRUE) 


# New gd function
cbg.gdv <- cumBgGD(biogas,
                   temp.vol = 20, pres.vol = 101.325,
                   temp.grav = 30, pres.grav = 150,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'time.d',
                   vented.mass = TRUE, averaging = 'final', vmethod = 'grav',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gdt <- cumBgGD(biogas,
                   temp.vol = 20, pres.vol = 101.325,
                   temp.grav = 30, pres.grav = 150,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'time.d',
                   vented.mass = FALSE, averaging = 'final', vmethod = 'vol',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

# Combine all cbg data together
cbg.list <- list(man = cbg.man,
                 vol = cbg.vol,
                 grav = cbg.grav,
                 gdt = cbg.gdt,
                 gdv = cbg.gdv
                )

