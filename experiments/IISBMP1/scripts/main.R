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
source('plots.R')
source('xCH4.plots.R')

# Export results
source('export_results.R')

# Export manipulated results
source('export_manipulated.R')

# ## EXTRA
# # Look at L1-E2 x 2 + L2-E2 day 1 xCH4 = 0
# write.csv(cbg.gd1, '../output/cbg.gd1.WRONG.csv', row.names = FALSE)
# write.csv(cbg.gd1[ , c('id.exper', 'elapsed.time', 'xCH4')], '../output/cbg.gd1.WRONG_only_usefull_columns.csv', row.names = FALSE)

a <- filter(cbg.gd1, is.na(cvCH4))
a <- a[, c('id', 'elapsed.time', 'vBg', 'cvBg', 'xCH4', 'cvCH4' )]
b <- filter(cbg.gd2, is.na(cvCH4))
b <- b[, c('id', 'elapsed.time', 'vBg', 'cvBg', 'xCH4', 'cvCH4' )]
c <- filter(cbg.gd3, is.na(cvCH4))
c <- c[, c('id', 'elapsed.time', 'vBg', 'cvBg', 'xCH4', 'cvCH4' )]
d <- filter(cbg.gd5, is.na(cvCH4))
d <- d[, c('id', 'elapsed.time', 'vBg', 'cvBg', 'xCH4', 'cvCH4' )]
e <- filter(cbg.gd8, is.na(cvCH4))
e <- e[, c('id', 'elapsed.time', 'vBg', 'cvBg', 'xCH4', 'cvCH4' )]

# method 1 and 5