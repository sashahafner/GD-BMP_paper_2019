# Table that compares GD, man, grav, vol

# Get inoculum only
igd <- subset(cbg.gd, descrip == 'I' & time.d > 27)
igdc <- subset(cbg.gdc, descrip == 'I' & time.d > 27)
igrav <- subset(cbg.grav, descrip == 'I' & time.d > 27)
iman <- subset(cbg.man, descrip == 'I' & time.d > 27)

# Add inoculum yield/producivity
igd$yld <- igd$cvCH4/igd$m.inoc
igrav$yld <- igrav$cvCH4/igrav$m.inoc
iman$yld <- iman$cvCH4/iman$m.inoc
igdc$yld <- igdc$cvCH4/igdc$m.inoc


igd
igdc
igrav
iman

igd$yld
iman$yld
igrav$yld

sd(igd$yld)/mean(igd$yld)
sd(igrav$yld)/mean(igrav$yld)

t.test(igd$yld, igrav$yld)
1 - 1.085/1.249

t.test(igd$yld, iman$yld)
1 - 1.085/1.298
