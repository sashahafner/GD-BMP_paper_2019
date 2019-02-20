
# Set BMP duration for all calls
max(biogas$elapsed.time)
when.BMP <- 27
# Needs to be 27 as there is no measurements above 30

cbg.list <- list(man = cbg.man, grav = cbg.grav) 
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
