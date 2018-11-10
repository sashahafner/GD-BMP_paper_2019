# Makes table for leak paper

tab1 <- ddply(bg2, 'descrip', summarise, m.sub.vs = mean(m.sub.vs), headspace = mean(vol.hs.m), 
              mass.init = mean(mass.init[ctime == min(ctime)]), cvBg.tot = mean(cvBg.m[ctime == max(ctime)]),
              mass.loss = mean(cmassloss[ctime == max(ctime)]), max.pres = max(na.omit(pres)*100 + 100)
              )
tab1

print.xtable(xtable(tab1, digits = c(1, 1, 2, 0, 1, 0, 1, 1)), file = '../tables/table1.tex', include.rownames = FALSE)

