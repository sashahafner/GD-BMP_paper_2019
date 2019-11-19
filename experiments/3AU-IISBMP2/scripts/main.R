# Runs complete analysis of IISBMP2 AU data
# Camilla G. Justesen and Sasha D. Hafner

rm(list = ls())
options(width = 70)

source('functions.R')
source('packages.R')
source('load.R')
source('clean.R')
source('export_meas.R')
source('water_detect_lim.R')
source('drift_correction.R')
source('export_IIS-BMP_input.R')
source('leaks.R')
source('biogas.R')
source('BMP.R')
source('plots.R')
source('export_results.R')
