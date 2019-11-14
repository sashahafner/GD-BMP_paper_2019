# BMP 

BMP <- summBg(cbg.list, setup, id.name = "id",
              time.name = 'time.d', descrip.name = 'descrip',
              inoc.name = "Inoculum", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = '1p3d', when.min = 25, extrap = TRUE, set.name = 'method')

BMPo <- summBg(cbg.list, setup, id.name = "id",
              time.name = 'time.d', descrip.name = 'descrip',
              inoc.name = "Inoculum", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
              when = '1p3d', when.min = 25, extrap = TRUE, set.name = 'method', show.obs = TRUE)


# Add rsd to data frames
BMP$rsd <- 100 * BMP$sd/BMP$mean

# Yields
yld <- summBg(cbg.list, setup, id.name = "id",
               time.name = 'time.d', descrip.name = 'descrip',
               inoc.name = "Inoculum", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
               when = 'meas', extrap = TRUE, set.name = 'method')

yldo <- summBg(cbg.list, setup, id.name = "id",
               time.name = 'time.d', descrip.name = 'descrip',
               inoc.name = "Inoculum", inoc.m.name = "m.inoc", norm.name = "m.sub.vs",
               when = 'meas', extrap = TRUE, set.name = 'method', show.obs = TRUE)


