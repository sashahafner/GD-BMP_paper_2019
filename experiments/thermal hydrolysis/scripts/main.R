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
#source('cumBgGDcomparison.R')

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


# Leak perc. 
leak.perc <- biogas[, c('id', 'elapsed.time', 'descrip', 'mass.leak')]
leak.bg <- cbg.gd06[, c('id', 'elapsed.time', 'descrip', 'vBg')]
leak.perc.bg <- merge(leak.perc, leak.bg, by = c('id', 'elapsed.time', 'descrip'))
leak.perc.bg$perc <- leak.perc.bg$mass.leak/leak.perc.bg$vBg*100
leak.perc.bg <- subset(leak.perc.bg, descrip == 'Raw sludge' | descrip == 'Sludge C1' | descrip == 'Sludge C2' | id == 'Cellulose' | id == 'Ethanol' )
write.csv(leak.perc.bg, '../results/leak.perc.csv', row.names = FALSE)
