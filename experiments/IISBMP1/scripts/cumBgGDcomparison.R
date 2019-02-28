# Calculate different methods of cumBgGD

# Set biogas options
options(unit.pres = 'bar', pres.std = 1.01325)

# Biogas by gd
biogas <- biogas[order(biogas$id.exper, biogas$elapsed.time), ]
biogas.gd <- biogas[!is.na(biogas$vol) & !is.na(biogas$mass.init) & !is.na(biogas$mass.final), ]

# !!!Delete composition to get it to calculate composition. This is not going to be included!!!
biogas.gd <- subset(biogas.gd, select = -c(xCH4, xCH4.oa))

cbg.gd <- cumBgGD(biogas.gd, 
                  temp = 20, pres = 1.01325, 
                  id.name = 'id.exper',vol.name = 'vol',
                  m.pre.name = 'mass.init', m.post.name = 'mass.final',
                  comp.name = 'xCH4', time.name = 'elapsed.time', 
                  vented.mass = TRUE, averaging = 'int', 
                  # temp.init = 20, 
                  # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  vmethod = 'vol',
                  # extrap = TRUE, 
                  addt0 = TRUE, showt0 = TRUE)


# cbg.gd1 <- cumBgGD(biogas.gd, 
#                   temp = 20, pres = 1.01325, 
#                   id.name = 'id.exper', vol.name = 'vol',
#                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
#                   comp.name = 'xCH4', time.name = 'elapsed.time', 
#                   vented.mass = FALSE, averaging = 'int', vmethod = 'grav',
#                   # temp.init = 20, 
#                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
#                   # extrap = FALSE
#                   addt0 = TRUE, showt0 = TRUE)
# 
# cbg.gd2 <- cumBgGD(biogas.gd, 
#                    temp = 20, pres = 1.01325, 
#                    id.name = 'id.exper', vol.name = 'vol',
#                    m.pre.name = 'mass.init', m.post.name = 'mass.final',
#                    comp.name = 'xCH4', time.name = 'elapsed.time', 
#                    vented.mass = FALSE, averaging = 'cumulative', vmethod = 'grav',
#                    # temp.init = 20, 
#                    # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
#                    # extrap = FALSE
#                    addt0 = TRUE, showt0 = TRUE)
# 
# cbg.gd3 <- cumBgGD(biogas.gd, 
#                    temp = 20, pres = 1.01325, 
#                    id.name = 'id.exper', vol.name = 'vol',
#                    m.pre.name = 'mass.init', m.post.name = 'mass.final',
#                    comp.name = 'xCH4', time.name = 'elapsed.time', 
#                    vented.mass = FALSE, averaging = 'final', vmethod = 'grav',
#                    # temp.init = 20, 
#                    # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
#                    # extrap = FALSE
#                    addt0 = TRUE, showt0 = TRUE)
# 
# cbg.gd4 <- cumBgGD(biogas.gd, 
#                    temp = 20, pres = 1.01325, 
#                    id.name = 'id.exper', vol.name = 'vol',
#                    m.pre.name = 'mass.init', m.post.name = 'mass.final',
#                    comp.name = 'xCH4', time.name = 'elapsed.time', 
#                    vented.mass = TRUE, averaging = 'int', vmethod = 'grav',
#                    # temp.init = 20, 
#                    # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
#                    # extrap = FALSE
#                    addt0 = TRUE, showt0 = TRUE)
# 
# cbg.gd5 <- cumBgGD(biogas.gd, 
#                    temp = 20, pres = 1.01325, 
#                    id.name = 'id.exper', vol.name = 'vol',
#                    m.pre.name = 'mass.init', m.post.name = 'mass.final',
#                    comp.name = 'xCH4', time.name = 'elapsed.time', 
#                    vented.mass = TRUE, averaging = 'cumulative', vmethod = 'grav',
#                    # temp.init = 20, 
#                    # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
#                    # extrap = FALSE
#                    addt0 = TRUE, showt0 = TRUE)
# 
# cbg.gd6 <- cumBgGD(biogas.gd, 
#                    temp = 20, pres = 1.01325, 
#                    id.name = 'id.exper', vol.name = 'vol',
#                    m.pre.name = 'mass.init', m.post.name = 'mass.final',
#                    comp.name = 'xCH4', time.name = 'elapsed.time', 
#                    vented.mass = FALSE, averaging = 'final', vmethod = 'grav',
#                    # temp.init = 20, 
#                    # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
#                    # extrap = FALSE
#                    addt0 = TRUE, showt0 = TRUE)

# ------------------------

cbg.gd7 <- cumBgGD(biogas.gd, 
                   temp = 20, pres = 1.01325, 
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = FALSE, averaging = 'int', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = FALSE
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd8 <- cumBgGD(biogas.gd, 
                   temp = 20, pres = 1.01325, 
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = FALSE, averaging = 'cumulative', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = FALSE
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd9 <- cumBgGD(biogas.gd, 
                   temp = 20, pres = 1.01325, 
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = FALSE, averaging = 'final', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = FALSE
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd10 <- cumBgGD(biogas.gd, 
                   temp = 20, pres = 1.01325, 
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = TRUE, averaging = 'int', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = FALSE
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd11 <- cumBgGD(biogas.gd, 
                   temp = 20, pres = 1.01325, 
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = TRUE, averaging = 'cumulative', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = FALSE
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd12 <- cumBgGD(biogas.gd, 
                   temp = 20, pres = 1.01325, 
                   id.name = 'id.exper', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = TRUE, averaging = 'final', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = FALSE
                   addt0 = TRUE, showt0 = TRUE)
