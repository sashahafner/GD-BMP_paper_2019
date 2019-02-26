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

# Add leaklimit column. TRUE == leak is above detection limit
BMP$leak.l <- BMP$descrip %in% large.leaks$descrip
BMPo$leak.l <- BMPo$id %in% large.leaks$id
BMP.1p3d$leak.l <- BMP.1p3d$descrip %in% large.leaks$descrip

# yld$leak.l <- yld$descrip %in% large.leaks$descrip

