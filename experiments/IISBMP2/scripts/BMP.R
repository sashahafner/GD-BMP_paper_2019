
# Rates for duration
rates <- summBg(cbg.gd, setup, id.name = 'id', time.name = 'time.d', descrip.name = 'substrate',
                inoc.name = 'BK', inoc.m.name = 'm.inoc', norm.name = 'm.sub.vs', show.rates = TRUE, 
                show.obs = TRUE)

yld <- summBg(cbg.gd, setup, id.name = 'id', time.name = 'time.d', descrip.name = 'substrate',
              inoc.name = 'BK', inoc.m.name = 'm.inoc', norm.name = 'm.sub.vs', when = 'meas',
              show.obs = TRUE)

BMP <- summBg(cbg.gd, setup, id.name = 'id', time.name = 'time.d', descrip.name = 'substrate',
              inoc.name = 'BK', inoc.m.name = 'm.inoc', norm.name = 'm.sub.vs', when = '1p3d')





