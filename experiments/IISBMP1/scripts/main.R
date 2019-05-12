# Runs complete analysis of IISBMP1 data
# Camilla G. Justesen & Sasha Hafner

rm(list = ls())
options(width = 70)

source('functions.R')
source('packages.R')
source('load.R')
source('clean.R')
source('export_meas.R')
source('water_detect_lim.R')
source('leaks.R')
source('biogas.R')
source('BMP.R')
source('BMP_comp.R')
source('xCH4_comp.R')
sink('../output/stats.txt')
  source('stats.R')
sink()
source('export_results.R')
source('plots_paper.R')
source('plots.R')
