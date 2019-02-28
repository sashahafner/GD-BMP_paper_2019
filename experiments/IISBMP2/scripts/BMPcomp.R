# BMP comparison

# Set BMP duration for all calls
when.BMP <- 30

# Add it to existing at some time 
cbg.list <- list(
  # gd1 = cbg.gd1, gd2 = cbg.gd2, gd3 = cbg.gd3, gd4 = cbg.gd4, gd5 = cbg.gd5, gd6 = cbg.gd6, 
  gd7 = cbg.gd7, gd8 = cbg.gd8, gd9 = cbg.gd9, gd10 = cbg.gd10, gd11 = cbg.gd11, gd12 = cbg.gd12) 

# BMP
# Set BMP duration for all calls
when.BMP <- 30 # (maybe choose another value)
cbg.list <- list(gd = cbg.gd) 

BMP <- summBg(cbg.list, setup, id.name = "id",
              time.name = 'elapsed.time', descrip.name = 'descrip',
              inoc.name = "Inoculum", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = when.BMP, extrap = TRUE, set.name = 'method')

BMP.1p3d <- summBg(cbg.list, setup, id.name = "id",
                   time.name = 'elapsed.time', descrip.name = 'descrip',
                   inoc.name = "Inoculum", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
                   when = '1p3d', extrap = TRUE, set.name = 'method')

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
yld$rsd <- 100 * yld$sd/yld$mean
BMP.1p3d$rsd <- 100 * BMP.1p3d$sd/BMP.1p3d$mean

# Add leaklimit column. TRUE == leak is above detection limit
BMP$leak.l <- BMP$descrip %in% large.leaks$descrip
BMPo$leak.l <- BMPo$id %in% large.leaks$id
BMP.1p3d$leak.l <- BMP.1p3d$descrip %in% large.leaks$descrip

# yld$leak.l <- yld$descrip %in% large.leaks$descrip