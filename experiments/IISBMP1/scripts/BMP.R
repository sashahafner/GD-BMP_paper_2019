# Calculates BMP and more

# Experiment 1
w <- '1p'

# Drop bottles that exploded
d <- subset(bgp1, !id %in% c('B1', 'B2'))
bmp1p1p <- summBg(d, setup1, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', inoc.name = 'Inoculum', 
             inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             when = w)

d <- subset(bgm1, !id %in% c('B1', 'B2'))
bmp1m1p <- summBg(d, setup1, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)

d <- subset(bgm1nc, !id %in% c('B1', 'B2'))
bmp1m1pnc <- summBg(d, setup1, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)


# Get BMP at all times
w <- 'meas'
bmp1ma <- summBg(d, setup1, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w,
             show.obs = TRUE)


# BMP at 30 d
w <- 30.85 

d <- subset(bgp1, !id %in% c('B1', 'B2'))
bmp1p30 <- summBg(d, setup1, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', inoc.name = 'Inoculum', 
             inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             when = w)

d <- subset(bgm1, !id %in% c('B1', 'B2'))
bmp1m30 <- summBg(d, setup1, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)


# BMP at end
w <- 'end'

d <- subset(bgp1, !id %in% c('B1', 'B2'))
bmp1pe <- summBg(d, setup1, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', inoc.name = 'Inoculum', 
             inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             when = w)

d <- subset(bgm1, !id %in% c('B1', 'B2'))
bmp1me <- summBg(d, setup1, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)

# Create data frame with rates for plotting
w <- '1p'

bmp1mr <- summBg(d, setup1, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w,
             show.obs = TRUE)

# Experiment 2
# 1p BMP
w <- '1p'

bmp2p1p <- summBg(bgp2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)

bmp2m1p <- summBg(bgm2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)

bmp2v1p <- summBg(bgv2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)

# BMP at all times
w <- 'meas'

bmp2pa <- summBg(bgp2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)

bmp2ma <- summBg(bgm2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)

bmp2va <- summBg(bgv2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4.cor',
             when = w)

bmp2vao <- summBg(bgv2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w,
             show.obs = TRUE)


# BMP at 30 d
w <- 30 ##### NTS CHECK exact time

bmp2p30 <- summBg(bgp2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)

bmp2m30 <- summBg(bgm2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)

bmp2v30 <- summBg(bgv2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4.cor',
             when = w)

# BMP at end
w <- 'end'

bmp2pe <- summBg(bgp2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)

bmp2me <- summBg(bgm2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)

bmp2ve <- summBg(bgv2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w)



# Create data frame with rates for plotting
w <- '1p'

bmp2mr <- summBg(bgm2, setup2, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = w ,
             show.obs = TRUE)


# Export
write.csv(bmp1m30, '../output/BMP1_grav_30d.csv', row.names = FALSE)
write.csv(bmp1p30, '../output/BMP1_mano_30d.csv', row.names = FALSE)

write.csv(bmp1me, '../output/BMP1_grav_end.csv', row.names = FALSE)
write.csv(bmp1pe, '../output/BMP1_mano_end.csv', row.names = FALSE)

write.csv(bmp1m1p, '../output/BMP1_grav_1p.csv', row.names = FALSE)
write.csv(bmp1p1p, '../output/BMP1_mano_1p.csv', row.names = FALSE)

write.csv(bmp2m30, '../output/BMP2_grav_30d.csv', row.names = FALSE)
write.csv(bmp2p30, '../output/BMP2_mano_30d.csv', row.names = FALSE)
write.csv(bmp2v30, '../output/BMP2_vol_30d.csv', row.names = FALSE)

write.csv(bmp2m1p, '../output/BMP2_grav_1p.csv', row.names = FALSE)
write.csv(bmp2p1p, '../output/BMP2_mano_1p.csv', row.names = FALSE)
write.csv(bmp2v1p, '../output/BMP2_vol_1p', row.names = FALSE)

write.csv(bmp2me, '../output/BMP2_grav_end.csv', row.names = FALSE)
write.csv(bmp2pe, '../output/BMP2_mano_end.csv', row.names = FALSE)

write.csv(bmp2m1p, '../output/BMP2_grav_1p.csv', row.names = FALSE)
write.csv(bmp2p1p, '../output/BMP2_mano_1p.csv', row.names = FALSE)

