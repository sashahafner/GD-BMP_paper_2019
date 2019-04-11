# Runs complete analysis of thermal hydrolysis data
# Camilla G. Justesen

# Load functions
source('functions.R')

# Load packages
source('packages.R')

# Load data 
source('load.R')

# Clean data
source('clean.R')

# Calculation of water detection limits 
source('water_detect_lim.R')

# Calculate leakage from biogas bottles
source('leak.R')

# Export raw data 
source('export.R')

# Calculate biogas production
source('biogas.R')
source('cumBgGDcomparison.R')

# Calculate BMP, yld and BMPo
source('BMP.R')
#source('BMPcomp.R')

# Clean data prior to analysis
source('merge.R')

# Compare methods numerically
# source('numeric_comparison.R')

# Graphical comparison of methods
source('plots.R')
source('xCH4.plots.R')

# Export results
source('export_results.R')

# Export manipulated results
source('export_manipulated.R')

# Compare gd methods
source('compare.R')


# Leak perc. cum for the last day!
leak.perc <- cbg.all[, c('id', 'method', 'elapsed.time', 'descrip', 'cmass.leak', 'cmass.tot')]
leak.perc <- subset(leak.perc, method == 'GD06' | method == 'Gravimetric')
leak.perc <- subset(leak.perc, elapsed.time > 20 & elapsed.time < 22) 
leak.perc <- subset(leak.perc, descrip == 'Raw sludge' | descrip == 'Sludge C1' | descrip == 'Sludge C2' | descrip == 'Cellulose' | descrip == 'Ethanol' | descrip == 'I')
leak.perc$leak.percentage <- (leak.perc$cmass.leak/leak.perc$cmass.tot)*100
max(leak.perc$leak.percentage)
min(leak.perc$leak.percentage)
write.csv(leak.perc, '../results/leak.perc.csv', row.names = FALSE)
