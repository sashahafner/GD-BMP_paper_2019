
# Set BMP duration for all calls
when.BMP <- 20.9194444
cbg.list <- list(vol = cbg.vol, man = cbg.man, grav = cbg.grav, gd03 = cbg.gd03, gd06 = cbg.gd06) 
cbg.list <- list(vol = cbg.vol, man = cbg.man, grav = cbg.grav, gd01 = cbg.gd1, gd02 = cbg.gd2, gd03 = cbg.gd3, gd04 = cbg.gd4, gd05 = cbg.gd5, gd06 = cbg.gd6, 
                 gd07 = cbg.gd7, gd08 = cbg.gd8, gd09 = cbg.gd9, gd10 = cbg.gd10, gd11 = cbg.gd11, gd12 = cbg.gd12) 

BMP <- summBg(cbg.list, setup, id.name = "id",
              time.name = 'elapsed.time', descrip.name = 'descrip',
              inoc.name = "I", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = when.BMP, extrap = TRUE, set.name = 'method')

# Note the set.name argument. The code above would give you a new column (1st one) in the output with the name "method". 
# You will then be able to cut some code from merge.R as well.

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