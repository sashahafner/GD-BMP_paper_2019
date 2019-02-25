# Export manipulated result tables

# Export tables
cbg.gd.result <- cbg.gd[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.gd.result, '../results/cbg.gd.csv', row.names = FALSE)

BMP.comparison <- BMP[, c('descrip', 'mean', 'sd')]
write.csv(BMP.comparison, '../results/BMP.csv', row.names = FALSE)

yld.comparison <- yld[, c('descrip', 'elapsed.time', 'mean', 'sd')]
write.csv(yld.comparison, '../results/yld.csv', row.names = FALSE)

BMPo.comparison <- BMPo[, c('id', 'cvCH4')]
write.csv(BMPo.comparison, '../results/BMPo.csv', row.names = FALSE)
