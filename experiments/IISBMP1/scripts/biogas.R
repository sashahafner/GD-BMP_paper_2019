# cumBg() calls and gdComp
# NTS: is extrapolation for BMP really needed?

# Set biogas options
options(unit.pres = 'bar', pres.std = 1.01325)


# NB: Sasha calculates for biogas for each experiment individually, why not do it from one dataset? 

# Set BMP duration for all calls
when.BMP <- 30

# Manometric biogas calculation
cbg.man <- cumBg(biogas, dat.type = 'pres', comp = comp, temp = 35,
                 id.name = 'id', time.name = 'elapsed.time',
                 dat.name = 'pres.init', comp.name = 'xCH4',
                 temp.init = 20,
                 pres.resid = 'pres.resid', pres.init = 0, pres.amb = 1.01325,
                 headspace = setup, vol.hs.name = 'vol.hs',
                 extrap = TRUE,
                 absolute = FALSE)

# How to handle comp when it is included in the biogas dataframe?

# Pressure - from Sashas, eventually include the removal of NAs
d <- vpmx1[!is.na(vpmx1$pres), ]
bgp1 <- cumBg(d, 'pres', temp = 27,
              data.struct = 'longcombo',
              id.name = 'id', time.name = 'ctime', dat.name = 'pres', comp.name = 'xCH4', temp.init = 21.55,
              pres.resid = 0.0, pres.init = 0.0, headspace = setup1, vol.hs.name = 'vol.hs',
              pres.amb = 1.01, absolute = FALSE,
              extrap = TRUE,
              addt0 = TRUE)

# Should the pres.init = 'pres.init' instead of the numeric value? 
# No
# NTS: check if the temperature and pressure is recorded or should be adjusted

BMP.man <- summBg(cbg.man, setup, id.name = "id", 
                  time.name = 'elapsed.time', descrip.name = 'descrip', 
                  inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                  when = when.BMP, extrap = TRUE)

# o for "obs" = one value for each bottle
BMPo.man <- summBg(cbg.man, setup, id.name = "id", 
                  time.name = 'elapsed.time', descrip.name = 'descrip', 
                  inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                  when = when.BMP, extrap = TRUE, show.obs = TRUE)

# yld for yield
yld.man <- summBg(cbg.man, setup, id.name = "id", 
                  time.name = 'elapsed.time', descrip.name = 'descrip', 
                  inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                  when = 'meas', extrap = TRUE)

# Gravimetric biogas calculation
cbg.grav <- cumBg(biogas, dat.type = 'mass', comp = comp, temp = 30, pres = 150,
                  id.name = 'id', time.name = 'elapsed.time',
                  dat.name = 'mass.final', comp.name = 'xCH4',
                  headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  temp.init = 20,
                  extrap = TRUE)

# NTS: Check temp, pres etc. is correct 
# dat.name for this calculation - is it the difference or just the final mass?
# Final mass

BMP.grav <- summBg(cbg.grav, setup, id.name = "id", 
                   time.name = 'elapsed.time', descrip.name = 'descrip', 
                   inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                   when = when.BMP, extrap = TRUE)

# o for "obs" = one value for each bottle
BMPo.grav <- summBg(cbg.grav, setup, id.name = "id", 
                   time.name = 'elapsed.time', descrip.name = 'descrip', 
                   inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                   when = when.BMP, extrap = TRUE, show.obs = TRUE)

# yld for yield
yld.grav <- summBg(cbg.grav, setup, id.name = "id", 
                  time.name = 'elapsed.time', descrip.name = 'descrip', 
                  inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                  when = 'meas', extrap = TRUE)


# Volumetric biogas calculation
cbg.vol <- cumBg(biogas, dat.type = 'vol', comp = comp, temp = 20, pres = 101.325,
                 id.name = 'id', time.name = 'elapsed.time',
                 dat.name = 'vol', comp.name = 'xCH4',
                 headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                 extrap = TRUE) 

BMP.vol <- summBg(cbg.vol, setup, id.name = "id", 
                  time.name = 'elapsed.time', descrip.name = 'descrip', 
                  inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                  when = when.BMP, extrap = TRUE)


# o for "obs" = one value for each bottle
BMPo.vol <- summBg(cbg.vol, setup, id.name = "id", 
                   time.name = 'elapsed.time', descrip.name = 'descrip', 
                   inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                   when = when.BMP, extrap = TRUE, show.obs = TRUE)

# yld for yield
yld.vol <- summBg(cbg.vol, setup, id.name = "id", 
                  time.name = 'elapsed.time', descrip.name = 'descrip', 
                  inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                  when = 'meas', extrap = TRUE)


biogas <- biogas[order(biogas$id, biogas$elapsed.time), ]
cbg.gd <- as.data.frame(mutate(group_by(biogas, id), cvol = cumsum(vol), cmassloss = mass.final[1]-mass.final))

# Make a GD data frame
cbg.gd$xCH4 <- gdComp(cbg.gd$cmassloss, cbg.gd$cvol, temp = 20, pres = 101.325)


# volumetric less sensitive to comp.therefore, use this one with GD. Can also try others afterwards. 
## But when using dat.type = 'vol' - wont it affect the results which method is used? 
cbg.gd <- cumBg(cbg.gd, dat.type = 'vol', temp = 20, pres = 101.325,
                 data.struct = 'longcombo',
                 id.name = 'id', time.name = 'elapsed.time',
                 dat.name = 'vol', comp.name = 'xCH4',
                 headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                 showt0 = FALSE, temp.init = 20,
                 addt0 = FALSE, extrap = TRUE) 

BMP.gd <- summBg(cbg.gd, setup, id.name = "id", 
                 time.name = 'elapsed.time', descrip.name = 'descrip', 
                 inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                 when = when.BMP, extrap = TRUE)

# o for "obs" = one value for each bottle
BMPo.gd <- summBg(cbg.gd, setup, id.name = "id", 
                   time.name = 'elapsed.time', descrip.name = 'descrip', 
                   inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                   when = when.BMP, extrap = TRUE, show.obs = TRUE)

# yld for yield
yld.gd <- summBg(cbg.gd, setup, id.name = "id", 
                  time.name = 'elapsed.time', descrip.name = 'descrip', 
                  inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                  when = 'meas', extrap = TRUE)
