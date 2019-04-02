# Export manipulated result tables

# Export tables
cbg.gd.result <- cbg.gd.all[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.gd.result, '../results/cbg.gd.csv', row.names = FALSE)

BMP.comparison <- BMP[, c('descrip', 'mean', 'sd', 'leak.l')]
write.csv(BMP.comparison, '../results/BMP.csv', row.names = FALSE)

yld.comparison <- yld[, c('descrip', 'elapsed.time', 'mean', 'sd')]
write.csv(yld.comparison, '../results/yld.csv', row.names = FALSE)

BMPo.comparison <- BMPo[, c('id', 'cvCH4')]
write.csv(BMPo.comparison, '../results/BMPo.csv', row.names = FALSE)


#Extract xCH4
cbg.gd1$xCH4_gd01 <- cbg.gd1$xCH4
cbg.gd2$xCH4_gd02 <- cbg.gd2$xCH4
cbg.gd3$xCH4_gd03 <- cbg.gd3$xCH4
cbg.gd4$xCH4_gd04 <- cbg.gd4$xCH4
cbg.gd5$xCH4_gd05 <- cbg.gd5$xCH4
cbg.gd6$xCH4_gd06 <- cbg.gd6$xCH4
cbg.gd7$xCH4_gd07 <- cbg.gd7$xCH4
cbg.gd8$xCH4_gd08 <- cbg.gd8$xCH4
cbg.gd9$xCH4_gd09 <- cbg.gd9$xCH4
cbg.gd10$xCH4_gd10 <- cbg.gd10$xCH4
cbg.gd11$xCH4_gd11 <- cbg.gd11$xCH4
cbg.gd12$xCH4_gd12 <- cbg.gd12$xCH4


gd1comp <- cbg.gd1[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd01')]
gd2comp <- cbg.gd2[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd02')]
gd3comp <- cbg.gd3[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd03')]
gd4comp <- cbg.gd4[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd04')]
gd5comp <- cbg.gd5[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd05')]
gd6comp <- cbg.gd6[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd06')]
gd7comp <- cbg.gd7[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd07')]
gd8comp <- cbg.gd8[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd08')]
gd9comp <- cbg.gd9[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd09')]
gd10comp <- cbg.gd10[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd10')]
gd11comp <- cbg.gd11[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd11')]
gd12comp <- cbg.gd12[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd12')]

gdcomp <- merge(gd1comp, gd2comp, by = c('id', 'elapsed.time', 'descrip'))
gdcomp <- merge(gdcomp, gd3comp, by = c('id', 'elapsed.time', 'descrip'))
gdcomp <- merge(gdcomp, gd4comp, by = c('id', 'elapsed.time', 'descrip'))
gdcomp <- merge(gdcomp, gd5comp, by = c('id', 'elapsed.time', 'descrip'))
gdcomp <- merge(gdcomp, gd6comp, by = c('id', 'elapsed.time', 'descrip'))
gdcomp <- merge(gdcomp, gd7comp, by = c('id', 'elapsed.time', 'descrip'))
gdcomp <- merge(gdcomp, gd8comp, by = c('id', 'elapsed.time', 'descrip'))
gdcomp <- merge(gdcomp, gd9comp, by = c('id', 'elapsed.time', 'descrip'))
gdcomp <- merge(gdcomp, gd10comp, by = c('id', 'elapsed.time', 'descrip'))
gdcomp <- merge(gdcomp, gd11comp, by = c('id', 'elapsed.time', 'descrip'))
gdcomp <- merge(gdcomp, gd12comp, by = c('id', 'elapsed.time', 'descrip'))

write.csv(gdcomp, '../results/gdxCH4.csv', row.names = FALSE)

# Make a rowbinded data frame
xCH4.all <- cbg.gd.all[, c('id', 'elapsed.time', 'descrip', 'xCH4', 'method')]
write.csv(xCH4.all, '../results/xCH4.all.csv', row.names = FALSE)


# Export manipulated result tables
# Export tables
cbg.gd.result <- subset(cbg.gd3, elapsed.time > 27 & elapsed.time < 30)
setup.suppl <- setup[, c('descrip', 'id', 'm.inoc', 'm.sub', 'm.tot', 'conc.ino.vs', 'conc.sub.vs')]

cbg.gd.result <- cbg.gd.result[, c('descrip', 'id',
                                   'mass.init', 'mass.final', 
                                   "cmass.tot", 
                                   'cvBg', 'xCH4', 'cvCH4')]

x <- merge(setup.suppl, cbg.gd.result, by = c('descrip', 'id') )

rounddf(x, c(0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 0))

rounddf <- function(x, digits = rep(2, ncol(x))) {
  for(i in 1:ncol(x)) if(class(x[, i])[1] == 'numeric') x[, i] <- round(x[, i], digits[i])
  return(x)
}

suppl$cvBg <- round(suppl$cvBg, 0)
suppl$cvCH4 <- round(suppl$cvCH4, 0)
suppl$cmass.tot <- round(suppl$cmass.tot, 2)
suppl$m.tot <- round(suppl$m.tot, 2)
suppl$xCH4 <- round(suppl$xCH4, 2)
suppl$conc.sub.vs <- round(suppl$conc.sub.vs, 2)

x <-  data.frame(a = 1:10, b = rnorm(10), c = rnorm(10))
round_df(x, c(0, 4, 1)
library(radiant.data)
library(dataCompareR)

names(suppl) <- c("Sub. type", "ID", 
                  'Inoc. mass [g]', 'Sub. mass [g]', 'Total mass [g]',
                  'Inoc. VS conc. [g/kg]', 'Sub. VS conc. [g/kg]', 
                  'Initial mass [g]', 'Final mass [g]',
                  'Cum total mass [g]', 
                  'Cum biogas [mL]', 'xCH4 [mol/mol]', 'Cum CH4 [mL]')

write.csv(suppl, '../results/suppl.csv', row.names = FALSE)

