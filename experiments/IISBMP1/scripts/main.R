# Runs complete analysis of IISBMP1 data
# Camilla G. Justesen

# Load functions
source('functions.R')

# Load packages
source('packages.R')

# Load data 
source('load.R')

# Subsetting to get rid of missing values
source('subset.R')

# Clean data
source('clean.R')

# Export raw data 
source('export.R')

# Calculation of water detection limits 
source('water_detect_lim.R')

# Calculate leakage from biogas bottles
source('leak.R')

# Remove all substrates having any leaks
no.leaks2.biogas <- subset(no.leaks2.biogas, !descrip %in% c('Cellulose', 'CB'))

# Calculate biogas production
source('biogas.R')
source('cumBgGDcomparison.R')

# Calculate BMP, yld and BMPo
#source('BMP.R')
source('BMPcomp.R')

# Clean data prior to analysis
source('merge.R')

# Compare methods numerically
#source('numeric_comparison.R')

# Graphical comparison of methods
# source('plots.R')
source('plot.cumBgGD.comparison.R')
#source('xCH4.plots.R')

# Export results
source('export_results.R')

# Export manipulated results
source('export_manipulated.R')

# Compare gd methods
source('compare.R')
