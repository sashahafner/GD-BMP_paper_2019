
# Set BMP duration for all calls
when.BMP <- 29
# Needs to be 29 as there is no measurements above 30 for experiment 1

# Only use experiment 1 (remeber to change to biogas1 when removing the NAs too)
# biogas1 <- biogas[biogas$exper == 1, ]

# Make a list of each experiment for all methods 
cbg.vol.list <- split(cbg.vol, cbg.vol$exper)
cbg.man.list <- split(cbg.man, cbg.man$exper)
cbg.grav.list <- split(cbg.grav, cbg.grav$exper)
cbg.gd.list <- split(cbg.gd, cbg.gd$exper)

# Calculate BMP, yld and BMPo

# Experiment 1 - A warning is given, as some bottles do not have replicates due to removal of NAs
cbg.list.1 <- list(vol = cbg.vol.list[[1]], man = cbg.man.list[[1]], grav = cbg.grav.list[[1]], gd = cbg.gd.list[[1]]) 
BMP1 <- summBg(cbg.list.1, setup1, id.name = "id",
              time.name = 'elapsed.time', descrip.name = 'descrip',
              inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = when.BMP, extrap = TRUE, set.name = 'method')
# BMPo
BMPo1 <- summBg(cbg.list.1, setup1, id.name = "id",
               time.name = 'elapsed.time', descrip.name = 'descrip',
               inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
               when = when.BMP, extrap = TRUE, set.name = 'method', show.obs = TRUE)

# yld for yield
#yld <- ... when = 'meas')
yld1 <- summBg(cbg.list.1, setup1, id.name = "id",
              time.name = 'elapsed.time', descrip.name = 'descrip',
              inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = 'meas', extrap = TRUE, set.name = 'method')


# Experiment 2
cbg.list.2 <- list(vol = cbg.vol.list[[2]], man = cbg.man.list[[2]], grav = cbg.grav.list[[2]], gd = cbg.gd.list[[2]]) 
BMP2 <- summBg(cbg.list.2, setup2, id.name = "id",
               time.name = 'elapsed.time', descrip.name = 'descrip',
               inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
               when = when.BMP, extrap = TRUE, set.name = 'method')

# o for "obs" = one value for each bottle
#BMPo <- ... show.obs = TRUE)
BMPo2 <- summBg(cbg.list.2, setup2, id.name = "id",
               time.name = 'elapsed.time', descrip.name = 'descrip',
               inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
               when = when.BMP, extrap = TRUE, set.name = 'method', show.obs = TRUE)

# yld for yield
#yld <- ... when = 'meas')
yld2 <- summBg(cbg.list.2, setup2, id.name = "id",
               time.name = 'elapsed.time', descrip.name = 'descrip',
               inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
               when = 'meas', extrap = TRUE, set.name = 'method')


# Merge data for each three result into one data frame for exper1+exper2

# Add column to each set to have experiment given in data frame
BMP1$exper <- 1
BMP2$exper <- 2
BMPo1$exper <- 1
BMPo$exper <- 2
yld1$exper <- 1
yld2$exper <- 2

# Merge results with rbind()
BMP <- rbind(BMP1, BMP2)
BMPo <- rbind(BMPo1, BMPo2)
yld <- rbind(yld1, yld2)

# Eventually add id to all data frames too (just keep the first letter from descrip or add a column from other data frame)

