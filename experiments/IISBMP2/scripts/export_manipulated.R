# Export manipulated result tables

# Export tables
cbg.gd.result <- subset(cbg.gd3, elapsed.time > 27 & elapsed.time < 30)

cbg.gd.result <- cbg.gd.result[, c('descrip', 'id',
                            'mass.init', 'mass.final', 'vol', 
                            "mass.tot", "cmass.tot", "cmass.vent", 
                            'cvBg', 'xCH4', 'cvCH4')]

names(cbg.gd.result) <- c("Substrate type", "ID", 
                          'Initial mass [g]', 'Final mass [g]', 'Volume [mL]',
                          'Total mass [g]', 'Cum total mass [g]', 'Cum vented mass [g]', 
                          'Cumulative biogas [mL]', 'xCH4 [mol/mol]', 'Cum CH4 [mL]')

write.csv(cbg.gd.result, '../results/cbg.gd.csv', row.names = FALSE)


# Notes: 
# Time is approx. 28 days, air temperature 20.6 C, ambient pressure 997.15 hPa, 
# Cum is cumulative 


# Export setup data
#setup.ex <- setup[, c('descrip', 'ID', 'm.inoc', 'm.sub', 'm.tot', 'm.sub.vs', "m.inoc.vs"]
