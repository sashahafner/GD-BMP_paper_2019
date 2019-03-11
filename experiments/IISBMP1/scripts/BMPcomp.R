# BMP comparison

# Set BMP duration for all calls
when.BMP <- 30
# Needs to be 29 as there is no measurements above 30 for experiment 1


# Only use experiment 1 (remeber to change to biogas1 when removing the NAs too)
# biogas1 <- biogas[biogas$exper == 1, ]

# Make a list of each experiment for all methods 
# cbg.vol.list <- split(cbg.vol, cbg.vol$exper)
# cbg.man.list <- split(cbg.man, cbg.man$exper)
cbg.grav.list <- split(cbg.grav, cbg.grav$exper)
# cbg.gd.list <- split(cbg.gd, cbg.gd$exper)
cbg.gd01.list <- split(cbg.gd01, cbg.gd01$exper)
cbg.gd02.list <- split(cbg.gd02, cbg.gd02$exper)
cbg.gd03.list <- split(cbg.gd03, cbg.gd03$exper)
cbg.gd04.list <- split(cbg.gd04, cbg.gd04$exper)
cbg.gd05.list <- split(cbg.gd05, cbg.gd05$exper)
cbg.gd06.list <- split(cbg.gd06, cbg.gd06$exper)
cbg.gd07.list <- split(cbg.gd07, cbg.gd07$exper)
cbg.gd08.list <- split(cbg.gd08, cbg.gd08$exper)
cbg.gd09.list <- split(cbg.gd09, cbg.gd09$exper)
cbg.gd10.list <- split(cbg.gd10, cbg.gd10$exper)
cbg.gd11.list <- split(cbg.gd11, cbg.gd11$exper)
cbg.gd12.list <- split(cbg.gd12, cbg.gd12$exper)


# Calculate BMP, yld and BMPo
# 
# # Experiment 1 
# cbg.list.1 <- list(
#   #vol = cbg.vol.list[[1]], man = cbg.man.list[[1]], grav = cbg.grav.list[[1]], 
#   #gd = cbg.gd.list[[1]], 
#   gd01 = cbg.gd01.list[[1]], gd02 = cbg.gd02.list[[1]], gd03 = cbg.gd03.list[[1]], 
#   #gd04 = cbg.gd04.list[[1]], 
#   gd05 = cbg.gd05.list[[1]], 
#   #gd06 = cbg.gd06.list[[1]],
#   #gd07 = cbg.gd07.list[[1]], 
#   gd08 = cbg.gd08.list[[1]]
#   #gd09 = cbg.gd09.list[[1]], gd10 = cbg.gd10.list[[1]], gd11 = cbg.gd11.list[[1]], gd12 = cbg.gd12.list[[1]]
#   ) 
# BMP1 <- summBg(cbg.list.1, setup1, id.name = "id",
#                time.name = 'elapsed.time', descrip.name = 'descrip',
#                inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
#                when = when.BMP, extrap = TRUE, set.name = 'method')
# # BMPo
# BMPo1 <- summBg(cbg.list.1, setup1, id.name = "id",
#                 time.name = 'elapsed.time', descrip.name = 'descrip',
#                 inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
#                 when = when.BMP, extrap = TRUE, set.name = 'method', show.obs = TRUE)
# 
# # yld for yield
# #yld <- ... when = 'meas')
# yld1 <- summBg(cbg.list.1, setup1, id.name = "id",
#                time.name = 'elapsed.time', descrip.name = 'descrip',
#                inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
#                when = 'meas', extrap = TRUE, set.name = 'method')


# Experiment 2
cbg.list.2 <- list(
  #vol = cbg.vol.list[[2]], man = cbg.man.list[[2]], 
  grav = cbg.grav.list[[2]], 
  #gd = cbg.gd.list[[2]], 
  gd01 = cbg.gd01.list[[2]], gd02 = cbg.gd02.list[[2]], gd03 = cbg.gd03.list[[2]], 
  gd04 = cbg.gd04.list[[2]],
  gd05 = cbg.gd05.list[[2]], 
  gd06 = cbg.gd06.list[[2]],
  gd07 = cbg.gd07.list[[2]],
  gd08 = cbg.gd08.list[[2]],
  gd09 = cbg.gd09.list[[2]], gd10 = cbg.gd10.list[[2]], gd11 = cbg.gd11.list[[2]], gd12 = cbg.gd12.list[[2]]
) 
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
# BMP1$exper <- 1
BMP2$exper <- 2
#BMPo1$exper <- 1
BMPo2$exper <- 2
#yld1$exper <- 1
yld2$exper <- 2

# for using leaks individually for each experiment, it should be added before rbind. Otherwise delete and use the code below
# BMP1$leak.l <- BMP1$descrip %in% large.leaks1$descrip
# BMPo1$leak.l <- BMPo1$id.exper %in% large.leaks1$id.exper
BMP2$leak.l <- BMP2$descrip %in% large.leaks2$descrip
BMPo2$leak.l <- BMPo2$id.exper %in% large.leaks2$id.exper

# # Merge results with rbind()
# BMP <- rbind(BMP1, BMP2)
# BMPo <- rbind(BMPo1, BMPo2)
# yld <- rbind(yld1, yld2)

# Eventually add id to all data frames too (just keep the first letter from descrip or add a column from other data frame)

# Add leaklimit column. TRUE == leak is above detection limit
# BMP$leak.l <- BMP$descrip %in% large.leaks$descrip
# BMPo$leak.l <- BMPo$id.exper %in% large.leaks$id.exper
# yld$leak.l <- yld$descrip %in% large.leaks$descrip
