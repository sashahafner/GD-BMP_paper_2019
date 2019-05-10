# cumBg() calls to calculate CH4 production

# Set biogas options
options(unit.pres = 'bar', pres.std = 1.01325)

# Remove bottles that showed interval leakage (C4 and C5 leaked, not C6, but drop all of CB)
biogas <- subset(biogas, !id %in% c('C4', 'C5', 'C6', 'I3', 'L2'))

# Manometric biogas calculation
cbg.man <- cumBg(biogas, dat.type = 'pres', temp = 30,
                 data.struct = 'longcombo',
                 id.name = 'id', time.name = 'time.d',
                 dat.name = 'pres.init', comp.name = 'xCH4.GC',
                 temp.init = 20,
                 pres.resid = 0, pres.init = 0, pres.amb = 1.01325,
                 headspace = setup, vol.hs.name = 'vol.hs',
                 extrap = TRUE,
                 absolute = FALSE)

# Gravimetric biogas calculation
cbg.grav <- cumBg(biogas, dat.type = 'mass', 
                  temp = 30, pres = 1.50,
                  data.struct = 'longcombo',
                  id.name = 'id', time.name = 'time.d',
                  dat.name = 'mass.final', comp.name = 'xCH4.GC',
                  headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  temp.init = 20,
                  extrap = TRUE)

# Volumetric biogas calculation
cbg.vol <- cumBg(biogas, dat.type = 'vol', 
                 temp = 20, pres = 1.01325,
                 data.struct = 'longcombo',
                 id.name = 'id', time.name = 'time.d',
                 dat.name = 'vol', comp.name = 'xCH4.GC',
                 extrap = TRUE) 

# GD calculations
cbg.gd01 <- cumBgGD(biogas,
                  temp.vol = 20, pres.vol = 1.01325,
                  temp.grav = 30, pres.grav = 1.5,
                  id.name = 'id', vol.name = 'vol',
                  m.pre.name = 'mass.init', m.post.name = 'mass.final',
                  comp.name = 'xCH4', time.name = 'time.d',
                  vented.mass = FALSE, averaging = 'int', vmethod = 'grav',
                  # temp.init = 20,
                  # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  extrap = TRUE, 
                  addt0 = TRUE, showt0 = TRUE)

cbg.gd02 <- cumBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'time.d',
                   vented.mass = FALSE, averaging = 'cumulative', vmethod = 'grav',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd03 <- cumBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'time.d',
                   vented.mass = FALSE, averaging = 'final', vmethod = 'grav',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE, 
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd04 <- cumBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'time.d',
                   vented.mass = TRUE, averaging = 'int', vmethod = 'grav',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd05 <- cumBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'time.d',
                   vented.mass = TRUE, averaging = 'cumulative', vmethod = 'grav',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)
 
cbg.gd06 <- cumBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'time.d',
                   vented.mass = TRUE, averaging = 'final', vmethod = 'grav',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd07 <- cumBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'time.d',
                   vented.mass = FALSE, averaging = 'int', vmethod = 'vol',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd08 <- cumBgGD(biogas, 
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'time.d', 
                   vented.mass = FALSE, averaging = 'cumulative', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd09 <- cumBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'time.d',
                   vented.mass = FALSE, averaging = 'final', vmethod = 'vol',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd10 <- cumBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'time.d',
                   vented.mass = TRUE, averaging = 'int', vmethod = 'vol',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd11 <- cumBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'time.d',
                   vented.mass = TRUE, averaging = 'cumulative', vmethod = 'vol',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd12 <- cumBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'time.d',
                   vented.mass = TRUE, averaging = 'final', vmethod = 'vol',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

# Combine all cbg data together
cbg.list <- list(man = cbg.man,
                 vol = cbg.vol,
                 grav = cbg.grav,
                 gd01 = cbg.gd01,
                 gd02 = cbg.gd02,
                 gd03 = cbg.gd03,
                 gd04 = cbg.gd04,
                 gd05 = cbg.gd05,
                 gd06 = cbg.gd06,
                 gd07 = cbg.gd07,
                 gd08 = cbg.gd08,
                 gd09 = cbg.gd09,
                 gd10 = cbg.gd10,
                 gd11 = cbg.gd11,
                 gd12 = cbg.gd12
                )
