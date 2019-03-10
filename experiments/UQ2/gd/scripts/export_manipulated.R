# Export manipulated result tables

# Export tables
cbg.gd.result <- cbg.gd[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
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
cbg.gd5$xCH4_gd5 <- cbg.gd5$xCH4
cbg.gd8$xCH4_gd8 <- cbg.gd8$xCH4

gd1comp <- cbg.gd1[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd1')]
gd2comp <- cbg.gd2[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd2')]
gd3comp <- cbg.gd3[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd3')]
gd5comp <- cbg.gd5[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd5')]
gd8comp <- cbg.gd8[, c('id', 'elapsed.time', 'descrip', 'xCH4_gd8')]


gdcomp <- merge(gd1comp, gd2comp, by = c('id', 'elapsed.time', 'descrip'))
gdcomp <- merge(gdcomp, gd3comp, by = c('id', 'elapsed.time', 'descrip'))
gdcomp <- merge(gdcomp, gd5comp, by = c('id', 'elapsed.time', 'descrip'))
gdcomp <- merge(gdcomp, gd8comp, by = c('id', 'elapsed.time', 'descrip'))

write.csv(gdcomp, '../results/gdxCH4.csv')
