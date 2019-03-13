# Runs complete analysis of IISBMP2 AU data
# Camilla G. Justesen

# RESTART R WHEN HAVING PROBLEMS

# Load functions
source('functions.R')

# Load packages
source('packages.R')

# Load data 
source('load.R')

# Clean data
source('clean.R')

# Calculation of water detection limits and drift
source('water_detect_lim.R')
source('drift_correction.R')

# Calculate leakage from biogas bottles
source('leak.R')

# Export raw data 
source('export.R')

# Calculate biogas production
#source('biogas.R')
source('cumBgGDcomparison.R')

# Calculate BMP, yld and BMPo
#source('BMP.R')
source('BMPcomp.R')

# Compare methods numerically
#source('numeric_comparison.R')

# Graphical comparison of methods
source('plots.R')
source('xCH4.plots.R')

# Export results
source('export_results.R')

# Export manipulated results
source('export_manipulated.R')

# Make result table for R5
source('IISBMP2_comparison.R')
