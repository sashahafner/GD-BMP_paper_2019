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
cbg.gdv <- calcBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4.GD', time.name = 'time.d',
                   vented.mass = TRUE, averaging = 'final', vmethod = 'grav',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

# Note that m.pre.name is not required unless vented.mass is used
cbg.gdi <- calcBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.post.name = 'mass.final',
                   comp.name = 'xCH4.GD', time.name = 'time.d',
                   vented.mass = FALSE, averaging = 'int', vmethod = 'vol',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gdc <- calcBgGD(biogas, 
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4.GD', time.name = 'time.d', 
                   vented.mass = FALSE, averaging = 'cumulative', vmethod = 'vol',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

# comp.sub needed here because of leakage
cbg.gdt <- calcBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.post.name = 'mass.final',
                   comp.name = 'xCH4.GD', time.name = 'time.d',
                   vented.mass = FALSE, averaging = 'final', vmethod = 'vol',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE, comp.sub = 'lim')

# With headspace correction
cbg.gdt.hc <- calcBgGD(biogas,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4.GDHC', time.name = 'time.d',
                   vented.mass = FALSE, averaging = 'final', vmethod = 'vol',
                   temp.init = 20, pres.init = 1.01325, headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE, comp.sub = 'lim')

# Get inoculum-only values from uncorrected results (corrected results probably not correct for inoculum)
cbg.gdt.hc <- cbg.gdt.hc[!cbg.gdt.hc$id %in% c('I1', 'I2', 'I3'), ] 
cbg.gdt.hc <- rbindf(cbg.gdt.hc, cbg.gdt[cbg.gdt$id %in% c('I1', 'I2', 'I3'), ])

# Combine all cbg data together
cbg.list <- list(man = cbg.man,
                 vol = cbg.vol,
                 grav = cbg.grav,
                 gdt = cbg.gdt,
                 gdt.hc = cbg.gdt.hc,
                 gdv = cbg.gdv,
                 gdi = cbg.gdi,
                 gdc = cbg.gdc
                )
