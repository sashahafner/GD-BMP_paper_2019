# BMP comparison

# Set BMP duration for all calls
max(biogas$elapsed.time)
when.BMP <- 27
# Needs to be 27 as there is no measurements above 30

cbg.list <- list(
  gd1 = cbg.gd1, gd2 = cbg.gd2, gd3 = cbg.gd3, 
  #gd4 = cbg.gd4, 
  gd5 = cbg.gd5, 
  #gd6 = cbg.gd6, 
  #gd7 = cbg.gd7, 
  gd8 = cbg.gd8
  #gd9 = cbg.gd9, gd10 = cbg.gd10, gd11 = cbg.gd11, gd12 = cbg.gd12
  ) 

# BMP
BMP <- summBg(cbg.list, setup, id.name = "id",
              time.name = 'elapsed.time', descrip.name = 'descrip',
              inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = when.BMP, extrap = TRUE, set.name = 'method')

# Add % deviation - these deviations are really small! < l.5 %
BMP$perc <- BMP$sd/BMP$mean*100

# o for "obs" = one value for each bottle
#BMPo <- ... show.obs = TRUE)
BMPo <- summBg(cbg.list, setup, id.name = "id",
               time.name = 'elapsed.time', descrip.name = 'descrip',
               inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
               when = when.BMP, extrap = TRUE, set.name = 'method', show.obs = TRUE)

# yld for yield
#yld <- ... when = 'meas')
yld <- summBg(cbg.list, setup, id.name = "id",
              time.name = 'elapsed.time', descrip.name = 'descrip',
              inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = 'meas', extrap = TRUE, set.name = 'method')

# Add leaklimit column. TRUE == leak is above detection limit
BMP$leak.l <- BMP$descrip %in% large.leaks$descrip
BMPo$leak.l <- BMPo$id %in% large.leaks$id
# yld$leak.l <- yld$descrip %in% large.leaks$descrip
