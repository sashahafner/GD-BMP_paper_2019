# Runs complete comparision of GD and man/grav results
# Camilla G. Justesen and Sasha Hafner

options(width = 70)
rm(list = ls())

source('packages.R')
source('functions.R')
source('load.R')
source('BMP_comp.R')
sink('../output/stats.txt')
  source('stats.R')
sink()
source('export_results.R')
source('plots.R')
source('plots_paper.R')
