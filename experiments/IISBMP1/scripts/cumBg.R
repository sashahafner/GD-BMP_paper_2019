# Calculate biogas production

options(unit.pres = 'bar', pres.std = 1.01325)

# Experiment 1

# Grav
bgm1 <- cumBg(vpmx1, 'mass', temp = 31, pres = 1.5, 
             data.struct = 'longcombo',
             id.name = 'id', time.name = 'ctime', dat.name = 'mass.final', comp.name = 'xCH4',
             temp.init = 21.55,
             headspace = setup1, vol.hs.name = 'vol.hs', headcomp = 'N2',
             extrap = TRUE,
             addt0 = TRUE)

# No headspace correction
bgm1nc <- cumBg(vpmx1, 'mass', temp = 31, pres = 1.5, 
             data.struct = 'longcombo',
             id.name = 'id', time.name = 'ctime', dat.name = 'mass.final', comp.name = 'xCH4',
             temp.init = 21.55,
             extrap = TRUE,
             addt0 = TRUE)

# Pressure
d <- vpmx1[!is.na(vpmx1$pres), ]
bgp1 <- cumBg(d, 'pres', temp = 27,
             data.struct = 'longcombo',
             id.name = 'id', time.name = 'ctime', dat.name = 'pres', comp.name = 'xCH4', temp.init = 21.55,
             pres.resid = 0.0, pres.init = 0.0, headspace = setup1, vol.hs.name = 'vol.hs',
             pres.amb = 1.01, absolute = FALSE,
             extrap = TRUE,
             addt0 = TRUE)

# Volumetric
d <- vpmx1[!is.na(vpmx1$vol), ]
bgv1 <- cumBg(d, 'vol', temp = 21, pres = 1.01,
             data.struct = 'longcombo',
            id.name = 'id', time.name = 'ctime', dat.name = 'vol', temp.init = 21,
            extrap = TRUE,
             addt0 = TRUE)

# Merge
bg1 <- merge(bgm1, bgp1, by = c('exper', 'id', 'date', 'time', 'sheet.order', 'mass.init', 'pres', 'vol', 'mass.final', 'notes', 'date.time', 'ctime'), 
            all = TRUE, suffixes = c('.m', ''))
bg1 <- merge(bg1, bgv1, by = c('exper', 'id', 'date', 'time', 'sheet.order', 'mass.init', 'pres', 'vol', 'mass.final', 'notes', 'date.time', 'ctime'), 
            all = TRUE, suffixes = c('.p', '.v'))
bg1 <- merge(setup1, bg1, by = c('exper', 'id'))
head(bg1)

# Export
write.csv(bgm1, '../output/bg1.csv', row.names = FALSE)

# Experiment 2
# Grav
bgm2 <- cumBg(vpmx2, 'mass', temp = 31, pres = 1.5, 
             comp = 1, # NTS: why is comp needed here???? and not above???
             data.struct = 'longcombo',
             id.name = 'id', time.name = 'ctime', dat.name = 'mass.final', comp.name = 'xCH4',
             temp.init = 18.9,
             headspace = setup2, vol.hs.name = 'vol.hs', headcomp = 'N2',
             extrap = TRUE)

# Pressure
# Drop time zero obs
d <- vpmx2[vpmx2$date != '17012017', ]
bgp2 <- cumBg(d, 'pres', temp = 31,
             data.struct = 'longcombo',
             id.name = 'id', time.name = 'ctime', dat.name = 'pres', comp.name = 'xCH4', temp.init = 21,
             pres.resid = 0.0, pres.init = 0.0, headspace = setup2, vol.hs.name = 'vol.hs',
             pres.amb = 1.01, absolute = FALSE,
             extrap = TRUE)

# Vol
# Drop time zero obs
bgv2 <- cumBg(d, 'vol', temp = 21, pres = 1.01,
             data.struct = 'longcombo',
            id.name = 'id', time.name = 'ctime', dat.name = 'vol', temp.init = 21,
            extrap = TRUE)

# Merge
bg2 <- merge(bgm2, bgp2, by = c('exper', 'id', 'date', 'time', 'sheet.order', 'mass.init', 'pres', 'vol', 'mass.final', 'notes', 'date.time', 'ctime'), 
            all = TRUE, suffixes = c('.m', ''))
bg2 <- merge(bg2, bgv2, by = c('exper', 'id', 'date', 'time', 'sheet.order', 'mass.init', 'pres', 'vol', 'mass.final', 'notes', 'date.time', 'ctime'), 
            all = TRUE, suffixes = c('.p', '.v'))
bg2 <- merge(setup2, bg2, by = c('exper', 'id'))
head(bg2)

# Stack 2 experiments
bg <- rbind(bg1, bg2)
bgm <- rbind(bgm1, bgm2)

# Export
write.csv(bgm2, '../output/bg2.csv', row.names = FALSE)

