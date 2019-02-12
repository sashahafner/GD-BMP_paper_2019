# Calculate BMP etc. of 2nd IIS-BMP AU data

# Load packages
source('packages.R')

# Get and clean data
source('load.R')
source('clean.R')

# Calculate biogas production
source('biogas.R')
source('gd_comp.R')
source('biogas_gd.R')
source('BMP.R')

# Export results, make plots
source('export.R')
source('plots.R')
