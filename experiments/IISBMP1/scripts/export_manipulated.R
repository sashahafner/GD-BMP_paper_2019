# Export manipulated result tables

# Export tables
cbg.grav.result <- cbg.grav[, c('id.exper', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.grav.result, '../results/cbg.grav.csv', row.names = FALSE)
cbg.man.result <- cbg.man[, c('id.exper', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.man.result, '../results/cbg.man.csv', row.names = FALSE)
cbg.vol.result <- cbg.vol[, c('id.exper', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4', 'rvBg', 'rvCH4')]
write.csv(cbg.vol.result, '../results/cbg.vol.csv', row.names = FALSE)

cbg.all.result <- cbg.all[, c('method', 'exper', 'id.exper', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4')]
write.csv(cbg.all.result, '../results/cbg.all.csv', row.names = FALSE)

# BMP tables
# BMP.comparison <- BMP2[, -c(grep("leak.l", colnames(BMP2)), grep("se", colnames(BMP2)))]
# BMP.comparison1 <- BMP2[ , c('elapsed.time', 'descrip', 'exper')]
# BMP.comparison1$leak.l <- BMP.all$leak.l.vol
# BMP.comparison2 <- merge(BMP.comparison1, BMP.comparison, by = c('descrip', 'exper'))
# write.csv(BMP.comparison2, '../results/BMP.csv', row.names = FALSE)

# BMP.comparison <- BMP.all[, c('descrip', 'exper', 'mean.vol', 'sd.vol', 'rsd.vol', 'mean.grav', 'sd.grav', 'rsd.grav', 'mean.man', 'sd.man', 'rsd.man', 'mean.gd', 'sd.gd', 'rsd.gd')]
# write.csv(BMP.comparison, '../results/BMP.csv', row.names = FALSE)

# yld2<- yld2[, c('descrip', 'exper', 'elapsed.time', 'mean.vol', 'sd.vol', 'mean.grav', 'sd.grav', 'mean.man', 'sd.man', 'mean.gd', 'sd.gd')]
# write.csv(yld.comparison, '../results/yld.csv', row.names = FALSE)
# 
# BMPo.comparison <- BMPo.all[, c('id', 'exper', 'cvCH4.vol', 'cvCH4.grav', 'cvCH4.man', 'cvCH4.gd')]
# write.csv(BMPo.comparison, '../results/BMPo.csv', row.names = FALSE)


# Supplementary table
# Export tables
cbg.gd.result <- subset(cbg.gd03, elapsed.time > 30 & elapsed.time < 32)
setup.suppl <- setup2[, c('descrip', 'id', 'm.inoc', 'm.sub', 'm.tot', 'c.inoc.vs' , 'c.sub.vs')]

cbg.gd.result <- cbg.gd.result[, c('descrip', 'id',
                                   'mass.init', 'mass.final', 
                                   "cmass.tot", 
                                   'cvBg', 'xCH4', 'cvCH4')]

suppl <- merge(setup.suppl, cbg.gd.result, by = c('descrip', 'id') )
suppl <- rounddf(suppl, c(0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 2, 0))

names(suppl) <- c("Sub. type", "ID", 
                  'Inoc. mass [g]', 'Sub. mass [g]', 'Total mass [g]',
                  'Sub. VS conc. [g/kg]', 'Inoc. VS conc. [g/kg]',
                  'Initial mass [g]', 'Final mass [g]',
                  'Cum total mass [g]', 
                  'Cum biogas [mL]', 'xCH4 [mol/mol]', 'Cum CH4 [mL]')

write.csv(suppl, '../results/suppl.csv', row.names = FALSE)


## Make method comparison tables
cbg.all1 <- biogas:::rbindf(
  cbg.vol, cbg.man, 
  cbg.grav, cbg.gd03
  #cbg.gd1, cbg.gd2, gbg.gd3, cbg.gd4, cbg.gd5, cbg.gd6, 
  #cbg.gd7, cbg.gd8, cbg.gd9, cbg.gd10, cbg.gd11, cbg.gd12
)

cbg.all.result1 <- cbg.all1[, c('method', 'descrip', 'id', 'elapsed.time', 'xCH4', 'vBg', 'vCH4', 'cvBg', 'cvCH4')]
cbg.gd.result1 <- subset(cbg.all.result1, elapsed.time > 30 & elapsed.time < 32)
cbg.gd.result1 <- reshape(data = cbg.gd.result1, 
                          idvar = c('descrip', 'id', 'elapsed.time'), 
                          timevar = 'method',
                          direction = 'wide') 
cbg.all.result12 <- cbg.gd.result1[, c('descrip', 'id', 'cvCH4.gd03', 'cvCH4.grav', 'cvCH4.vol', 'cvCH4.man' , 'xCH4.gd03', 'xCH4.vol')]

cbg.all.result12$cvCH4.gd03 <- round(cbg.all.result12$cvCH4.gd03, 0)
cbg.all.result12$cvCH4.grav <- round(cbg.all.result12$cvCH4.grav, 0)
cbg.all.result12$cvCH4.vol <- round(cbg.all.result12$cvCH4.vol, 0)
cbg.all.result12$cvCH4.man <- round(cbg.all.result12$cvCH4.man, 0)
cbg.all.result12$xCH4.vol <- round(cbg.all.result12$xCH4.vol, 2)
cbg.all.result12$xCH4.gd03 <- round(cbg.all.result12$xCH4.gd03, 2)

# Maybe make a subset with only included substrates

names(cbg.all.result12) <- c("Sub. type", "ID", 
                             'Cum CH4 GD03 [mL]', 'Cum CH4 grav. [mL]', 'Cum CH4 vol. [mL]', 'Cum CH4 man. [mL]', 
                             'xCH4 GD03 [mol/mol]','xCH4 GC [mol/mol]') 

write.csv(cbg.all.result12, '../results/method.comparison.csv', row.names = FALSE)

