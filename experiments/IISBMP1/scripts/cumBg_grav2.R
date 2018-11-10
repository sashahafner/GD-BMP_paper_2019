# Calculate biogas production

options(unit.pres = 'bar', pres.std = 1.01325)

# Experiment 2
# Grav

# Ignore odd xCH4
#xxx <- vpmx2
#vpmx2 <- xxx
table(is.na(vpmx2$xCH4.ggd))
vpmx2[!is.na(vpmx2$xCH4.ggd) & (vpmx2$xCH4.ggd < 0.2 | vpmx2$xCH4.ggd > 0.8), 'xCH4.ggd'] <- NA
table(is.na(vpmx2$xCH4.ggd))

vpmx2 <- subset(vpmx2, !id %in% c('C5', 'L2')) # Some kind of problems with xCH4

bgg22 <- cumBg(vpmx2, 'mass', temp = 31, pres = 1.5, 
             comp = 1, 
             data.struct = 'longcombo',
             id.name = 'id', time.name = 'ctime', dat.name = 'mass.final', comp.name = 'xCH4.ggd',
             temp.init = 18.9,
##             headspace = setup2, vol.hs.name = 'vol.hs', headcomp = 'N2',
             extrap = TRUE)

# Merge
bg2 <- merge(bgm2, bgp2, by = c('exper', 'id', 'date', 'time', 'sheet.order', 'mass.init', 'pres', 'vol', 
                                'mass.final', 'notes', 'date.time', 'ctime'), 
            all = TRUE, suffixes = c('', '.p'))

bg2 <- merge(bg2, bgv2, by = c('exper', 'id', 'date', 'time', 'sheet.order', 'mass.init', 'pres', 'vol', 
                               'mass.final', 'notes', 'date.time', 'ctime'), 
            all = TRUE, suffixes = c('', '.v'))

bg2 <- merge(bg2, bgg22, by = c('exper', 'id', 'date', 'time', 'sheet.order', 'mass.init', 'pres', 'vol', 
                               'mass.final', 'notes', 'date.time', 'ctime'), 
            all = TRUE, suffixes = c('.m', '.g2'))

bg2 <- merge(setup2, bg2, by = c('exper', 'id'))
head(bg2)

# NTS: bg2 updated. . . needs to be sorted out (already merged earlier)
