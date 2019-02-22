# Set BMP duration for all calls
when.BMP <- 30 # (maybe choose another value)
cbg.list <- list(vol = cbg.vol, grav = cbg.grav, gd = cbg.gd) 

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


