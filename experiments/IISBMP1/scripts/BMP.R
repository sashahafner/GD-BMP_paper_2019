
# Set BMP duration for all calls
when.BMP <- 30

# Only use experiment 1 (remeber to change to biogas1 when removing the NAs too)
# biogas1 <- biogas[biogas$exper == 1, ]

# Make a list of each experiment for all methods 
cbg.vol.list <- split(cbg.vol, cbg.vol$exper)
cbg.man.list <- split(cbg.man, cbg.man$exper)
cbg.grav.list <- split(cbg.grav, cbg.grav$exper)
cbg.gd.list <- split(cbg.gd, cbg.gd$exper)

# Calculate BMP, yld and BMPo

# Experiment 1
cbg.list.1 <- list(vol = cbg.vol.list[[1]], man = cbg.man.list[[1]], grav = cbg.grav.list[[1]], gd = cbg.gd.list[[1]]) 
BMP1 <- summBg(cbg.list.1, setup1, id.name = "id",
              time.name = 'elapsed.time', descrip.name = 'descrip',
              inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = when.BMP, extrap = TRUE, set.name = 'method')
# BMPo
BMPo <- summBg(cbg.list.1, setup1, id.name = "id",
               time.name = 'elapsed.time', descrip.name = 'descrip',
               inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
               when = when.BMP, extrap = TRUE, set.name = 'method', show.obs = TRUE)


# Experiment 2
cbg.list.2 <- list(vol = cbg.vol.list[[2]], man = cbg.man.list[[2]], grav = cbg.grav.list[[2]], gd = cbg.gd.list[[2]]) 
BMP2 <- summBg(cbg.list.1, setup2, id.name = "id",
               time.name = 'elapsed.time', descrip.name = 'descrip',
               inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
               when = when.BMP, extrap = TRUE, set.name = 'method')

# As there is only one value in 5 of the id.exper interpolation is not possile. 

# o for "obs" = one value for each bottle
#BMPo <- ... show.obs = TRUE)
BMPo <- summBg(cbg.list, setup, id.name = "id.exper",
               time.name = 'elapsed.time', descrip.name = 'descrip',
               inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
               when = when.BMP, extrap = TRUE, set.name = 'method', show.obs = TRUE)

# yld for yield
#yld <- ... when = 'meas')
yld <- summBg(cbg.list, setup, id.name = "id.exper",
              time.name = 'elapsed.time', descrip.name = 'descrip',
              inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = 'meas', extrap = TRUE, set.name = 'method')
