# cumBg() calls
# NTS: is extrapolation for BMP really needed?

# Set biogas options
options(unit.pres = 'hPa')

# New gd function
cbg.gd <- cumBgGD(biogas, 
                  # temp = 20, pres = 101.325, 
                  temp = 'temp.air', pres = 'pres.amb',
                  id.name = 'id',vol.name = 'vol',
                  m.pre.name = 'mass.init', m.post.name = 'mass.final',
                  comp.name = 'xCH4', time.name = 'elapsed.time', 
                  vented.mass = TRUE, averaging = 'int', 
                  # temp.init = 20, 
                  # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  # extrap = FALSE, 
                  addt0 = TRUE, showt0 = TRUE)


# Merge
#cbg <- merge(cbg.vol, cbg.grav, by = 1:13, suffixes = c('.vol', '.grav'))

