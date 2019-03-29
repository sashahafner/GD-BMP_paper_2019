# Export manipulated result tables

# Export tables
cbg.gd.result <- subset(cbg.gd3, elapsed.time > 30 & elapsed.time < 32)
setup.suppl <- setup[, c('descrip', 'id', 'm.inoc', 'm.sub', 'm.tot', 'c.inoc.vs', 'c.sub.vs')]

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


# Notes: 
# Time is approx. 28 days, air temperature 20.6 C, ambient pressure 997.15 hPa, 
# Cum is cumulative 