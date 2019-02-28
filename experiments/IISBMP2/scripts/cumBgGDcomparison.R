# Calculate different methods of cumBgGD

# Set biogas options
options(unit.pres = 'kPa')

# cbg.gd1 <- cumBgGD(biogas, 
#                   temp = 20, pres = 101.325, 
#                   id.name = 'id', vol.name = 'vol',
#                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
#                   comp.name = 'xCH4', time.name = 'elapsed.time', 
#                   vented.mass = FALSE, averaging = 'int', vmethod = 'grav',
#                   # temp.init = 20, 
#                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
#                   # extrap = FALSE
#                   addt0 = TRUE, showt0 = TRUE)
# 
# cbg.gd2 <- cumBgGD(biogas, 
#                    temp = 20, pres = 101.325, 
#                    id.name = 'id', vol.name = 'vol',
#                    m.pre.name = 'mass.init', m.post.name = 'mass.final',
#                    comp.name = 'xCH4', time.name = 'elapsed.time', 
#                    vented.mass = FALSE, averaging = 'cumulative', vmethod = 'grav',
#                    # temp.init = 20, 
#                    # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
#                    # extrap = FALSE
#                    addt0 = TRUE, showt0 = TRUE)
# 
# cbg.gd3 <- cumBgGD(biogas, 
#                    temp = 20, pres = 101.325, 
#                    id.name = 'id', vol.name = 'vol',
#                    m.pre.name = 'mass.init', m.post.name = 'mass.final',
#                    comp.name = 'xCH4', time.name = 'elapsed.time', 
#                    vented.mass = FALSE, averaging = 'final', vmethod = 'grav',
#                    # temp.init = 20, 
#                    # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
#                    # extrap = FALSE
#                    addt0 = TRUE, showt0 = TRUE)
# 
# cbg.gd4 <- cumBgGD(biogas, 
#                    temp = 20, pres = 101.325, 
#                    id.name = 'id', vol.name = 'vol',
#                    m.pre.name = 'mass.init', m.post.name = 'mass.final',
#                    comp.name = 'xCH4', time.name = 'elapsed.time', 
#                    vented.mass = TRUE, averaging = 'int', vmethod = 'grav',
#                    # temp.init = 20, 
#                    # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
#                    # extrap = FALSE
#                    addt0 = TRUE, showt0 = TRUE)
# 
# cbg.gd5 <- cumBgGD(biogas, 
#                    temp = 20, pres = 101.325, 
#                    id.name = 'id', vol.name = 'vol',
#                    m.pre.name = 'mass.init', m.post.name = 'mass.final',
#                    comp.name = 'xCH4', time.name = 'elapsed.time', 
#                    vented.mass = TRUE, averaging = 'cumulative', vmethod = 'grav',
#                    # temp.init = 20, 
#                    # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
#                    # extrap = FALSE
#                    addt0 = TRUE, showt0 = TRUE)
# 
# cbg.gd6 <- cumBgGD(biogas, 
#                    temp = 20, pres = 101.325, 
#                    id.name = 'id', vol.name = 'vol',
#                    m.pre.name = 'mass.init', m.post.name = 'mass.final',
#                    comp.name = 'xCH4', time.name = 'elapsed.time', 
#                    vented.mass = FALSE, averaging = 'final', vmethod = 'grav',
#                    # temp.init = 20, 
#                    # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
#                    # extrap = FALSE
#                    addt0 = TRUE, showt0 = TRUE)

# ------------------------

cbg.gd7 <- cumBgGD(biogas, 
                   temp = 20, pres = 101.325, 
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = FALSE, averaging = 'int', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = FALSE
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd8 <- cumBgGD(biogas, 
                   temp = 20, pres = 101.325, 
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = FALSE, averaging = 'cumulative', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = FALSE
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd9 <- cumBgGD(biogas, 
                   temp = 20, pres = 101.325, 
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = FALSE, averaging = 'final', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = FALSE
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd10 <- cumBgGD(biogas, 
                   temp = 20, pres = 101.325, 
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = TRUE, averaging = 'int', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = FALSE
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd11 <- cumBgGD(biogas, 
                   temp = 20, pres = 101.325, 
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = TRUE, averaging = 'cumulative', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = FALSE
                   addt0 = TRUE, showt0 = TRUE)

cbg.gd12 <- cumBgGD(biogas, 
                   temp = 20, pres = 101.325, 
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = TRUE, averaging = 'final', vmethod = 'vol',
                   # temp.init = 20, 
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = FALSE
                   addt0 = TRUE, showt0 = TRUE)
