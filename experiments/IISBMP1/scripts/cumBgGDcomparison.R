# Calculate different methods of cumBgGD

# Set biogas options
options(unit.pres = 'bar', pres.std = 1.01325)

# # ADD THIS DATA FRAME FOR ONLY NO LEAK BOTTLES FROM EXPER 2
# biogas <- no.leaks2.biogas
# biogas <- subset(biogas, !id %in% c('C4', 'C5'))

# Biogas by gd
biogas <- biogas[order(biogas$id.exper, biogas$elapsed.time), ]
biogas.gd <- biogas[!is.na(biogas$vol) & !is.na(biogas$mass.init) & !is.na(biogas$mass.final), ]


# !!!Delete composition to get it to calculate composition. This is not going to be included!!!
biogas.gd <- subset(biogas.gd, select = -c(xCH4, xCH4.oa))

cbg.gd01 <- cumBgGD(biogas.gd,
                  temp.vol = 20, pres.vol = 1.01325,
                  temp.grav = 30, pres.grav = 1.5,
                  id.name = 'id.exper', vol.name = 'vol',
                  m.pre.name = 'mass.init', m.post.name = 'mass.final',
                  comp.name = 'xCH4', time.name = 'elapsed.time',
                  vented.mass = FALSE, averaging = 'int', vmethod = 'grav',
                  # temp.init = 20,
                  # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  extrap = TRUE, 
                  addt0 = TRUE, showt0 = TRUE)

cbg.gd02 <- cumBgGD(biogas.gd,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time',
                   vented.mass = FALSE, averaging = 'cumulative', vmethod = 'grav',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd03 <- cumBgGD(biogas.gd,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time',
                   vented.mass = FALSE, averaging = 'final', vmethod = 'grav',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE, 
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd04 <- cumBgGD(biogas.gd,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time',
                   vented.mass = TRUE, averaging = 'int', vmethod = 'grav',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd05 <- cumBgGD(biogas.gd,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time',
                   vented.mass = TRUE, averaging = 'cumulative', vmethod = 'grav',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)
 
cbg.gd06 <- cumBgGD(biogas.gd,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time',
                   vented.mass = FALSE, averaging = 'final', vmethod = 'grav',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

# ------------------------

cbg.gd07 <- cumBgGD(biogas.gd,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time',
                   vented.mass = FALSE, averaging = 'int', vmethod = 'vol',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd08 <- cumBgGD(biogas.gd, 
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = FALSE, averaging = 'cumulative', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd09 <- cumBgGD(biogas.gd,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time',
                   vented.mass = FALSE, averaging = 'final', vmethod = 'vol',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd10 <- cumBgGD(biogas.gd,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time',
                   vented.mass = TRUE, averaging = 'int', vmethod = 'vol',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd11 <- cumBgGD(biogas.gd,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time',
                   vented.mass = TRUE, averaging = 'cumulative', vmethod = 'vol',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd12 <- cumBgGD(biogas.gd,
                   temp.vol = 20, pres.vol = 1.01325,
                   temp.grav = 30, pres.grav = 1.5,
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time',
                   vented.mass = TRUE, averaging = 'final', vmethod = 'vol',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE,
                   addt0 = TRUE, showt0 = TRUE)
