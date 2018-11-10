# BMP of 30 d results with and without leak correction

leak.tot$cvCH4.v.cor <- leak.tot$cvCH4.v + leak.tot$vCH4.leak

BMP1 <- summBg(leak.tot, setup2, id.name = 'id', time.name = 'ct', descrip.name = 'descrip', 
               inoc.name = 'Inoculum', inoc.m.name = 'm.inoc', norm.name = 'm.sub.vs', 
               vol.name = 'cvCH4.v', when = 'meas')

BMP2 <- summBg(leak.tot, setup2, id.name = 'id', time.name = 'ct', descrip.name = 'descrip', 
               inoc.name = 'Inoculum', inoc.m.name = 'm.inoc', norm.name = 'm.sub.vs', 
               vol.name = 'cvCH4.v.cor', when = 'meas')

BMP1$method <- 'uncor'
BMP2$method <- 'cor'

BMP <- rbind(BMP1, BMP2)

print(xtable(BMP[, c('method', 'descrip', 'mean', 'sd')], 
             digits = c(0, 0, 0, 1, 2)),
      include.rownames = FALSE, file = '../tables/tableBMP.tex')
