# Runs complete comparision of GD and man/grav results
# Camilla G. Justesen and Sasha D. Hafner

options(width = 70)
rm(list = ls())

source('packages.R')
source('functions.R')
source('load.R')
source('BMP_comp.R')
source('inoc_comp.R')
sink('../output/stats.txt')
  source('stats.R', echo = TRUE)
sink()
sink('../output/explore.txt')
  source('explore.R', echo = TRUE)
sink()
source('export_results.R')
source('plots.R')
source('plots_paper.R')
source('plots_pres.R')
