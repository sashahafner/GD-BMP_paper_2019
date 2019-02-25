# Export manipulated result tables

# Export tables
cbg.gd.result <- cbg.gd[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.gd.result, '../results/cbg.gd.csv', row.names = FALSE)
cbg.grav.result <- cbg.grav[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.grav.result, '../results/cbg.grav.csv', row.names = FALSE)
cbg.man.result <- cbg.man[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.man.result, '../results/cbg.man.csv', row.names = FALSE)
cbg.vol.result <- cbg.vol[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.vol.result, '../results/cbg.vol.csv', row.names = FALSE)

cbg.all.result <- cbg.all[, c('method', 'id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4')]
write.csv(cbg.all.result, '../results/cbg.all.csv', row.names = FALSE)

BMP.comparison <- BMP.all[, c('descrip', 'mean.vol', 'sd.vol', 'mean.grav', 'sd.grav', 'mean.man', 'sd.man', 'mean.gd', 'sd.gd')]
write.csv(BMP.comparison, '../results/BMP.csv', row.names = FALSE)

yld.comparison <- yld.all[, c('descrip', 'elapsed.time', 'mean.vol', 'sd.vol', 'mean.grav', 'sd.grav', 'mean.man', 'sd.man', 'mean.gd', 'sd.gd')]
write.csv(yld.comparison, '../results/yld.csv', row.names = FALSE)

BMPo.comparison <- BMPo.all[, c('id', 'cvCH4.vol', 'cvCH4.grav', 'cvCH4.man', 'cvCH4.gd')]
write.csv(BMPo.comparison, '../results/BMPo.csv', row.names = FALSE)
