# Reshape biogas measurements

biogasd <- cumBg(biogasd, comp = 1, temp = 0, pres = 1, dry = TRUE,
                 id.name = 'id', dat.name = '1', data.struct = 'wide', 
                 interval = FALSE, time.name = 'time.d')

biogast <- cumBg(biogast, comp = 1, temp = 0, pres = 1, dry = TRUE,
                 id.name = 'id', dat.name = '1', data.struct = 'wide', 
                 interval = FALSE, time.name = 'time.d')
