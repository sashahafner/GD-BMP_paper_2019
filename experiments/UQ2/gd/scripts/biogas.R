# cumBg() calls and gdComp
# NTS: is extrapolation for BMP really needed?

# Set biogas options
options(unit.pres = 'mbar', pres.std = 1013.25)

# Biogas by gd
biogas <- biogas[order(biogas$id, biogas$elapsed.time), ]
biogas.gd <- biogas[!is.na(biogas$vol) & !is.na(biogas$mass.init) & !is.na(biogas$mass.final), ]

# New gd function
cbg.gd <- cumBgGD(biogas.gd, 
                   temp = 20, pres = 1013.25, 
                   id.name = 'id',vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = TRUE, averaging = 'int', 
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = TRUE, 
                   addt0 = TRUE, showt0 = TRUE)