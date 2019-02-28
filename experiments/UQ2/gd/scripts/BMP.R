
# Set BMP duration for all calls
max(biogas$elapsed.time)
when.BMP <- 27
# Needs to be 27 as there is no measurements above 30

cbg.list <- list(gd = cbg.gd) 
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
