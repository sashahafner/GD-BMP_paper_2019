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

