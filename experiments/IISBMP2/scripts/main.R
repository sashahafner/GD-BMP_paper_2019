# Runs complete analysis of IISBMP2 AU data
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

# Calculate BMP, yld and BMPo
source('BMP.R')

# Clean data prior to analysis
source('merge.R')

# Compare methods numerically
source('numeric_comparison.R')

# Graphical comparison of methods
source('plots.R')

# Export results
source('export_results.R')