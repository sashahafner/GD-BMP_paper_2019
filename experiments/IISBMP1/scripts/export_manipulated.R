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

suppl$cvBg <- round(suppl$cvBg, 0)
suppl$cvCH4 <- round(suppl$cvCH4, 0)
suppl$cmass.tot <- round(suppl$cmass.tot, 2)
suppl$m.tot <- round(suppl$m.tot, 2)
suppl$xCH4 <- round(suppl$xCH4, 2)

names(suppl) <- c("Sub. type", "ID", 
                  'Inoc. mass [g]', 'Sub. mass [g]', 'Total mass [g]',
                  'Sub. VS conc. [g/kg]', 'Inoc. VS conc. [g/kg]',
                  'Initial mass [g]', 'Final mass [g]',
                  'Cum total mass [g]', 
                  'Cum biogas [mL]', 'xCH4 [mol/mol]', 'Cum CH4 [mL]')

write.csv(suppl, '../results/suppl.csv', row.names = FALSE)
