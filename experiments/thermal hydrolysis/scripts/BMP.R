
# Set BMP duration for all calls
when.BMP <- 20.9194444
cbg.list <- list(vol = cbg.vol, man = cbg.man, grav = cbg.grav, gd03 = cbg.gd03, gd06 = cbg.gd06) 

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