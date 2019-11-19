# Calculate different methods of cumBgGD

# Set biogas options
options(unit.pres = 'hPa')

cbg.gdt <- calcBgGD(biogas, 
                         temp.vol = 'temp.air', pres.vol = 'pres.amb',
                         temp.grav = 30, pres.grav = 1500,
                         id.name = 'id', vol.name = 'vol',
                         m.pre.name = 'mass.init', m.post.name = 'mass.final',
                         comp.name = 'xCH4', time.name = 'time.d', 
                         vented.mass = FALSE, averaging = 'final', vmethod = 'vol',
                         extrap = TRUE, 
                         addt0 = TRUE, showt0 = TRUE)


cbg.gdt.hc <- calcBgGD(biogas,
                               temp.vol = 'temp.air', pres.vol = 'pres.amb',
                               temp.grav = 30, pres.grav = 1500,
                               id.name = 'id', vol.name = 'vol',
                               m.pre.name = 'mass.init', m.post.name = 'mass.final',
                               comp.name = 'xCH4', time.name = 'time.d',
                               vented.mass = FALSE, averaging = 'final', vmethod = 'vol',
                               temp.init = 20, pres.init = 1013.25, headspace = setup, 
                               vol.hs.name = 'vol.hs', headcomp = 'N2',
                               extrap = TRUE,
                               addt0 = TRUE, showt0 = TRUE)

cbg.list <- list(gdt.hc = cbg.gdt.hc, gdt = cbg.gdt)


