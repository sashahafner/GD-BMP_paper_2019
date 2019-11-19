# Calculate BMP

BMPd <- summBg(biogasd, setupd, id.name = 'id', time.name = 'time.d', 
               descrip.name = 'substrate', inoc.name = 'BK', 
               inoc.m.name = 'm.inoc', norm.name = 'm.sub.vs',
               when = '1p3d', when.min = 25)

BMPt <- summBg(biogast, setupt, id.name = 'id', time.name = 'time.d', 
               descrip.name = 'sub.isr', inoc.name = 'BK', 
               inoc.m.name = 'm.inoc', norm.name = 'm.sub.vs',
               when = '1p3d', when.min = 25)
