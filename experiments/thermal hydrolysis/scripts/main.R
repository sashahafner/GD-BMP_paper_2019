# Runs complete analysis of thermal hydrolysis data

# Camilla G. Justesen
# Load Functions
source('../../../functions/gdComp.R')

# Load packages
source('packages.R')

# Load data 
source('load.R')

# Clean data
source('clean.R')

# Calculate biogas production - DOES NOT WORK YET!
source('biogas.R')

# Apply grav2 (GD) method to get xCH4 - both include mass2vol and closed form
# source('gd_calcs.R')

# Create data plots
source('plots.R')
