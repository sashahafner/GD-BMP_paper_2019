# cumBg() calls

# Set biogas options
options(unit.pres = 'hPa')

cbg.vol <- cumBg(biogas.vol, dat.type = 'vol', comp = 0.60, temp = 'temp.air', pres = 'pres.amb',
                  data.struct = 'long', id.name = 'id', time.name = 'time.d',
                  dat.name = 'vol', temp.init = 20)

cbg.grav <- cumBg(biogas, dat.type = 'mass', comp = 0.60, temp = 'temp.air', pres = 'pres.amb',
                  data.struct = 'long', id.name = 'id', time.name = 'time.d',
                  dat.name = 'mass.final', temp.init = 20)

# Merge
cbg <- merge(cbg.vol, cbg.grav, by = 1:13, suffixes = c('.vol', '.grav'))
