# BMP comparison

# Set BMP duration for all calls
when.BMP <- 31.75764

# Add it to existing at some time 
cbg.list <- list(
  gd01 = cbg.gd1, gd02 = cbg.gd2, gd03 = cbg.gd3, gd04 = cbg.gd4, gd05 = cbg.gd5, gd06 = cbg.gd6, 
  gd07 = cbg.gd7, gd08 = cbg.gd8, gd09 = cbg.gd9, gd10 = cbg.gd10, gd11 = cbg.gd11, gd12 = cbg.gd12) 

# BMP
BMP <- summBg(cbg.list, setup, id.name = "id",
              time.name = 'elapsed.time', descrip.name = 'descrip',
              inoc.name = "Inoculum", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = when.BMP, extrap = TRUE, set.name = 'method')

BMP.0.5p3d <- summBg(cbg.list, setup, id.name = "id",
                   time.name = 'elapsed.time', descrip.name = 'descrip',
                   inoc.name = "Inoculum", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
                   when = '0.5p3d', extrap = TRUE, set.name = 'method')

#BMPo <- ... show.obs = TRUE) (also called rates)
BMPo <- summBg(cbg.list, setup, id.name = "id",
               time.name = 'elapsed.time', descrip.name = 'descrip',
               inoc.name = "Inoculum", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
               when = when.BMP, extrap = TRUE, set.name = 'method', show.obs = TRUE)

# yld for yield
#yld <- ... when = 'meas')
yld <- summBg(cbg.list, setup, id.name = "id",
              time.name = 'elapsed.time', descrip.name = 'descrip',
              inoc.name = "Inoculum", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = 'meas', extrap = TRUE, set.name = 'method')

# Add rsd to data frames
BMP$rsd <- 100 * BMP$sd/BMP$mean
BMP.0.5p3d$rsd <- 100 * BMP.0.5p3d$sd/BMP.0.5p3d$mean
yld$rsd <- 100 * yld$sd/yld$mean

# Add leaklimit column. TRUE == leak is above detection limit
BMP$leak.l <- BMP$descrip %in% large.leaks$descrip
BMPo$leak.l <- BMPo$id %in% large.leaks$id
BMP.0.5p3d$leak.l <- BMP.0.5p3d$descrip %in% large.leaks$descrip

# yld$leak.l <- yld$descrip %in% large.leaks$descrip