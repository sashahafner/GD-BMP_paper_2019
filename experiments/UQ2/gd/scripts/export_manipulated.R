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
cbg.gd1$xCH4_gd1 <- cbg.gd1$xCH4
cbg.gd2$xCH4_gd2 <- cbg.gd2$xCH4
cbg.gd3$xCH4_gd3 <- cbg.gd3$xCH4
cbg.gd4$xCH4_gd4 <- cbg.gd4$xCH4
cbg.gd5$xCH4_gd5 <- cbg.gd5$xCH4
cbg.gd6$xCH4_gd6 <- cbg.gd6$xCH4
cbg.gd7$xCH4_gd7 <- cbg.gd7$xCH4
cbg.gd8$xCH4_gd8 <- cbg.gd8$xCH4
cbg.gd9$xCH4_gd9 <- cbg.gd9$xCH4
cbg.gd10$xCH4_gd10 <- cbg.gd10$xCH4
cbg.gd11$xCH4_gd11 <- cbg.gd11$xCH4
cbg.gd12$xCH4_gd12 <- cbg.gd12$xCH4


gd1comp <- cbg.gd1[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd1')]
gd2comp <- cbg.gd2[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd2')]
gd3comp <- cbg.gd3[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd3')]
gd4comp <- cbg.gd4[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd4')]
gd5comp <- cbg.gd5[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd5')]
gd6comp <- cbg.gd6[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd6')]
gd7comp <- cbg.gd7[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd7')]
gd8comp <- cbg.gd8[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd8')]
gd9comp <- cbg.gd9[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd9')]
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
