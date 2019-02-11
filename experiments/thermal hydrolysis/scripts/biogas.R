
# cumBg() calls and gdComp

# Set biogas options
options(unit.pres = 'kPa')

# Remember to change the biogas further on to meas if correct

# Manometric biogas calculation
cbg.man <- cumBg(biogas, dat.type = 'pres', comp = comp, temp = 35,
                 data.struct = 'long',
                 id.name = 'id', time.name = 'elapsed.time',
                 dat.name = 'pres.init', comp.name = 'xCH4',
                 temp.init = 20,
                 pres.resid = 'pres.resid', pres.init = 0, pres.amb = 101.325,
                 headspace = setup, vol.hs.name = 'vol.hs',
                 addt0 = FALSE, extrap = TRUE,
                 absolute = FALSE)

# Should the pres.init = 'pres.init' instead of the numeric value? 
# check if the temperature and pressure is recorded or should be adjusted

cbg.man.corr <- summBg(cbg.man, setup, id.name = "id", 
                       time.name = 'elapsed.time', descrip.name = 'descrip', 
                       inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                       when = "end", extrap = TRUE)

# Gravimetric biogas calculation
cbg.grav <- cumBg(biogas, dat.type = 'mass', comp = comp, temp = 35, pres = 150,
                  data.struct = 'long',
                  id.name = 'id', time.name = 'elapsed.time',
                  dat.name = 'mass.final', comp.name = 'xCH4',
                  headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  showt0 = FALSE, temp.init = 20,
                  addt0 = FALSE, extrap = TRUE)

# Check temp, pres etc. is correct 
# dat.name for this calculation - is it the difference or just the final mass?

cbg.grav.corr <- summBg(cbg.grav, setup, id.name = "id", 
                       time.name = 'elapsed.time', descrip.name = 'descrip', 
                       inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                       when = "end", extrap = TRUE)


# Volumetric biogas calculation
cbg.vol <- cumBg(biogas, dat.type = 'vol', comp = comp, temp = 35, pres = 101.325,
                  data.struct = 'long',
                  id.name = 'id', time.name = 'elapsed.time',
                  dat.name = 'vol', comp.name = 'xCH4',
                  headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                  showt0 = FALSE, temp.init = 20,
                  addt0 = FALSE, extrap = TRUE) 

cbg.vol.corr <- summBg(cbg.vol, setup, id.name = "id", 
                       time.name = 'elapsed.time', descrip.name = 'descrip', 
                       inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                       when = "end", extrap = TRUE)


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

cbg.gd.corr <- summBg(cbg.gd, setup, id.name = "id", 
                       time.name = 'elapsed.time', descrip.name = 'descrip', 
                       inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs", 
                       when = "end", extrap = TRUE)




