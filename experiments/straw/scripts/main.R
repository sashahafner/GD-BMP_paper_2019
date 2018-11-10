# Complete analysis of straw data
# S. Hafner, J. Mortensen, 

# Load packages
source('packages.R')

# Get and clean data
source('load.R')
source('clean.R')

# Calculate biogas production
source('biogas.R')

# Apply grav2 (GD) method to get xCH4
source('grav2.R')

# Compare estimates graphically
source('plots.R')

# Export results
source('export.R')

