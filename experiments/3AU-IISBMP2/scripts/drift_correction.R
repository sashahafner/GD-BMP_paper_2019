# Corrects measured masses for drift 

water$mass.drift <- water$mass.init[water$date == '27.09.2018'] - water$mass.init
drift.dat <- water[, c('date', 'mass.drift')]

biogas <- merge(biogas, drift.dat, by = 'date')

# Save original measurements as well
biogas$mass.init.orig <- biogas$mass.init
biogas$mass.final.orig <- biogas$mass.final
biogas$mass.init <- biogas$mass.init + biogas$mass.drift
biogas$mass.final <- biogas$mass.final + biogas$mass.drift
