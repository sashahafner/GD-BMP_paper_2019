# cumBg() calls and gdComp
# NTS: is extrapolation for BMP really needed?

# Set biogas options
options(unit.pres = 'mbar', pres.std = 1013.25)

# Biogas by gd
biogas <- biogas[order(biogas$id, biogas$elapsed.time), ]
biogas.gd <- biogas[!is.na(biogas$vol) & !is.na(biogas$mass.init) & !is.na(biogas$mass.final), ]

cbg.gd <- as.data.frame(mutate(group_by(biogas.gd, id), cvol = cumsum(vol), cmassloss = mass.final[1]-mass.final))

# Make a GD data frame
cbg.gd$xCH4 <- gdComp(cbg.gd$cmassloss, cbg.gd$cvol, temp = 20, pres = 1.01325)


# volumetric less sensitive to comp.therefore, use this one with GD. Can also try others afterwards. 
## But when using dat.type = 'vol' - wont it affect the results which method is used? 

cbg.gd <- cumBg(cbg.gd, dat.type = 'vol', 
                temp = 20, pres = 1013.25,
                data.struct = 'longcombo',
                id.name = 'id', time.name = 'elapsed.time',
                dat.name = 'vol', 
                headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                showt0 = FALSE, temp.init = 20,
                addt0 = FALSE, extrap = TRUE) 

# New gd function
cbg.gd1 <- cumBgGD(biogas, 
                   temp = 20, pres = 1013.25, 
                   id.name = 'id',vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time', 
                   vented.mass = TRUE, averaging = 'int', 
                   temp.init = 20, 
                   headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   extrap = TRUE, 
                   addt0 = TRUE, showt0 = TRUE)
