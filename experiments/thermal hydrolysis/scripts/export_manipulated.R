# Export manipulated result tables

# Export tables
cbg.gd03.result <- cbg.gd03[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4')]
write.csv(cbg.gd03.result, '../results/cbg.gd03.csv', row.names = FALSE)
cbg.gd06.result <- cbg.gd06[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4')]
write.csv(cbg.gd06.result, '../results/cbg.gd06.csv', row.names = FALSE)
cbg.grav.result <- cbg.grav[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4')]
write.csv(cbg.grav.result, '../results/cbg.grav.csv', row.names = FALSE)
cbg.man.result <- cbg.man[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4')]
write.csv(cbg.man.result, '../results/cbg.man.csv', row.names = FALSE)
cbg.vol.result <- cbg.vol[, c('id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4')]
write.csv(cbg.vol.result, '../results/cbg.vol.csv', row.names = FALSE)

cbg.all1 <- biogas:::rbindf(
  cbg.vol, cbg.man, 
  cbg.grav, cbg.gd03, cbg.gd06 
  #cbg.gd1, cbg.gd2, gbg.gd3, cbg.gd4, cbg.gd5, cbg.gd6, 
  #cbg.gd7, cbg.gd8, cbg.gd9, cbg.gd10, cbg.gd11, cbg.gd12
)

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
cbg.gd.result <- subset(cbg.gd06, elapsed.time > 20 & elapsed.time < 22)
setup.suppl <- setup[, c('descrip', 'id', 'm.inoc', 'm.sub', 'm.tot', 'conc.sub.vs', 'conc.inoc.vs')]

cbg.gd.result <- cbg.gd.result[, c('descrip', 'id',
                                   'mass.init', 'mass.final', 
                                   "cmass.tot", 
                                   'cvBg', 'xCH4', 'cvCH4')]

suppl <- merge(setup.suppl, cbg.gd.result, by = c('descrip', 'id') )
suppl <- subset(suppl, descrip == 'Cellulose' | descrip == 'Ethanol' | descrip == 'Raw sludge' | descrip == 'Sludge C1' |descrip == 'Sludge C2' | descrip =='I')
suppl <- rounddf(suppl, c(0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 0))

names(suppl) <- c("Sub. type", "ID", 
                  'Inoc. mass [g]', 'Sub. mass [g]', 'Total mass [g]',
                  'Sub. VS conc. [g/kg]', 'Inoc. VS conc. [g/kg]',
                  'Initial mass [g]', 'Final mass [g]',
                  'Cum total mass [g]', 
                  'Cum biogas [mL]', 'xCH4 [mol/mol]', 'Cum CH4 [mL]')

write.csv(suppl, '../results/suppl.csv', row.names = FALSE)


# Notes: 
# Time is approx. 28 days, air temperature 20.6 C, ambient pressure 997.15 hPa, 
# Cum is cumulative 


## Make method comparison tables
cbg.all1 <- biogas:::rbindf(
  cbg.vol, cbg.man, 
  cbg.grav, cbg.gd03, cbg.gd06 
  #cbg.gd1, cbg.gd2, gbg.gd3, cbg.gd4, cbg.gd5, cbg.gd6, 
  #cbg.gd7, cbg.gd8, cbg.gd9, cbg.gd10, cbg.gd11, cbg.gd12
)

cbg.all.result1 <- cbg.all1[, c('method', 'descrip', 'id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4')]
cbg.gd.result1 <- subset(cbg.all.result1, elapsed.time > 30 & elapsed.time < 32)
cbg.gd.result1 <- reshape(data = cbg.gd.result1, 
                          idvar = c('descrip', 'id', 'elapsed.time'), 
                          timevar = 'method',
                          direction = 'wide') 
cbg.all.result12 <- cbg.gd.result1[, c('descrip', 'id', 'cvCH4.gd03', 'cvCH4.gd06', 'cvCH4.grav', 'cvCH4.vol', 'cvCH4.man' , 'xCH4.gd03', 'xCH4.gd06', 'xCH4.vol')]

cbg.all.result12 <- subset(cbg.all.result12, descrip == 'Cellulose' | descrip == 'Ethanol' | descrip == 'Raw sludge' | descrip == 'Sludge C1' |descrip == 'Sludge C2' | descrip =='I')


cbg.all.result12$cvCH4.gd03 <- round(cbg.all.result12$cvCH4.gd03, 0)
cbg.all.result12$cvCH4.gd06 <- round(cbg.all.result12$cvCH4.gd06, 0)
cbg.all.result12$cvCH4.grav <- round(cbg.all.result12$cvCH4.grav, 0)
cbg.all.result12$cvCH4.vol <- round(cbg.all.result12$cvCH4.vol, 0)
cbg.all.result12$cvCH4.man <- round(cbg.all.result12$cvCH4.man, 0)
cbg.all.result12$xCH4.vol <- round(cbg.all.result12$xCH4.vol, 2)
cbg.all.result12$xCH4.gd06 <- round(cbg.all.result12$xCH4.gd06, 2)
cbg.all.result12$xCH4.gd03 <- round(cbg.all.result12$xCH4.gd03, 2)

# Maybe make a subset with only included substrates

names(cbg.all.result12) <- c("Sub. type", "ID", 
                  'Cum CH4 GD03 [mL]', 'Cum CH4 GD06 [mL]', 'Cum CH4 grav. [mL]', 'Cum CH4 vol. [mL]', 'Cum CH4 man. [mL]', 
                  'xCH4 GD03 [mol/mol]','xCH4 GD06 [mol/mol]','xCH4 GC [mol/mol]') 

write.csv(cbg.all.result12, '../results/method.comparison.csv', row.names = FALSE)
