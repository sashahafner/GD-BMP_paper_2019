# Export manipulated result tables

# Export tables
cbg.gd03.result <- cbg.gd03[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.gd03.result, '../results/cbg.gd03.csv', row.names = FALSE)
cbg.gd06.result <- cbg.gd06[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.gd06.result, '../results/cbg.gd06.csv', row.names = FALSE)
cbg.grav.result <- cbg.grav[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.grav.result, '../results/cbg.grav.csv', row.names = FALSE)
cbg.man.result <- cbg.man[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.man.result, '../results/cbg.man.csv', row.names = FALSE)
cbg.vol.result <- cbg.vol[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.vol.result, '../results/cbg.vol.csv', row.names = FALSE)

cbg.all.result <- cbg.all[, c('method', 'id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4')]
write.csv(cbg.all.result, '../results/cbg.all.csv', row.names = FALSE)

# BMP tables
BMP.comparison <- BMP.all[, -c(grep("leak.l", colnames(BMP.all)), grep("se", colnames(BMP.all)))]
BMP.comparison1 <- BMP.all[ , c('elapsed.time', 'descrip')]
BMP.comparison1$leak.l <- BMP.all$leak.l.vol
BMP.comparison2 <- merge(BMP.comparison1, BMP.comparison, by = 'descrip')
write.csv(BMP.comparison2, '../results/BMP.csv', row.names = FALSE)

yld.comparison <- yld.all[, c('descrip', 'elapsed.time', 'mean.vol', 'sd.vol', 'mean.grav', 'sd.grav', 'mean.man', 'sd.man', 'mean.gd03', 'sd.gd03', 'mean.gd06', 'sd.gd06')]
write.csv(yld.comparison, '../results/yld.csv', row.names = FALSE)

BMPo.comparison <- BMPo.all[, c('id', 'cvCH4.vol', 'cvCH4.grav', 'cvCH4.man', 'cvCH4.gd03', "cvCH4.gd06")]
write.csv(BMPo.comparison, '../results/BMPo.csv', row.names = FALSE)



# Export manipulated result tables

# Export tables
cbg.gd.result <- subset(cbg.gd03, elapsed.time > 27 & elapsed.time < 30)

cbg.gd.result <- cbg.gd.result[, c('descrip', 'id',
                                   'mass.init', 'mass.final', 'vol', 
                                   "mass.tot", "cmass.tot", "cmass.vent", 
                                   'cvBg', 'xCH4', 'cvCH4')]

names(cbg.gd.result) <- c("Substrate type", "ID", 
                          'Initial mass [g]', 'Final mass [g]', 'Volume [mL]',
                          'Total mass [g]', 'Cum total mass [g]', 'Cum vented mass [g]', 
                          'Cumulative biogas [mL]', 'xCH4 [mol/mol]', 'Cum CH4 [mL]')

write.csv(cbg.gd.result, '../results/cbg.gd.csv', row.names = FALSE)

round(cbg.gd.result$`Initial mass [g]`, 2)

# Notes: 
# Time is approx. 28 days, air temperature 20.6 C, ambient pressure 997.15 hPa, 
# Cum is cumulative 


# Export setup data
#setup.ex <- setup[, c('descrip', 'ID', 'm.inoc', 'm.sub', 'm.tot', 'm.sub.vs', "m.inoc.vs"]
