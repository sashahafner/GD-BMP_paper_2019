# Corrects measured masses for drift 

water$drift <- water$mass.init[water$date == '27.09.2018'] - water$mass.init


head(biogas)
