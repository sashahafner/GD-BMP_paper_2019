# Runs complete analysis of thermal hydrolysis data

# Camilla G. Justesen
# Load Functions
source('functions.R')

# Load packages
source('packages.R')

# Load data 
source('load.R')

# Clean data
source('clean.R')

# Calculate biogas production - DOES NOT WORK YET!
source('biogas.R')

# Clean data prior to analysis
source('dataorganization.R')

# Compare methods numerically
source('numeric_comparison.R')

# Apply grav2 (GD) method to get xCH4 - both include mass2vol and closed form (DELETE)
# source('gd_calcs.R')

# Graphical comparison of methods
source('plots.R')
