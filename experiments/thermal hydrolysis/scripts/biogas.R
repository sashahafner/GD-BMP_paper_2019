# cumBg() calls and gdComp
# NTS: is extrapolation for BMP really needed?

# Set biogas options
options(unit.pres = 'kPa')

# Set BMP duration for all calls
when.BMP <- 30

# Manometric biogas calculation
cbg.man <- cumBg(biogas, dat.type = 'pres', comp = comp, temp = 35,
                 id.name = 'id', time.name = 'elapsed.time',
                 dat.name = 'pres.init', comp.name = 'xCH4',
                 temp.init = 20,
                 pres.resid = 'pres.resid', pres.init = 0, pres.amb = 101.325,
                 headspace = setup, vol.hs.name = 'vol.hs',
                 extrap = TRUE,
                 absolute = FALSE)

# Should the pres.init = 'pres.init' instead of the numeric value? 
# No
# NTS: check if the temperature and pressure is recorded or should be adjusted

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

# Volumetric biogas calculation
cbg.vol <- cumBg(biogas, dat.type = 'vol', comp = comp, temp = 20, pres = 101.325,
                 id.name = 'id', time.name = 'elapsed.time',
                 dat.name = 'vol', comp.name = 'xCH4',
                 headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                 extrap = TRUE) 

# GD method
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


cbg.list <- list(vol = cbg.vol, man = cbg.man, grav = cbg.grav, gd = cbg.gd) 
BMP <- summBg(cbg.list, setup, id.name = "id",
              time.name = 'elapsed.time', descrip.name = 'descrip',
              inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = when.BMP, extrap = TRUE, set.name = 'method')
# Note the set.name argument. The code above would give you a new column (1st one) in the output with the name "method". 
# You will then be able to cut some code from merge.R as well.


# The last two methods
# o for "obs" = one value for each bottle
#BMPo <- ... show.obs = TRUE)

# yld for yield
#yld.gd <- ... when = 'meas')






