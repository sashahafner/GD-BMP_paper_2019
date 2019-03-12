# Corrects measured masses for drift 

water$mass.drift <- water$mass.init - water$mass.init[water$date == '27.09.2018']
drift.dat <- water[, c('date', 'drift')]

biogas <- merge(biogas, drift.dat, by = 'date')


head(biogas)
