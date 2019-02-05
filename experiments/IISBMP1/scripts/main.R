# Works up biogas production data
# S. Hafner
# Modified:
# Note: Get GC data from SDU GC, copy to GC data/data files and run /GC data/main.R to get and export GC data before running this script

options(width = 65)
source('packages.R')
source('load.R')
source('comp.R')
source('export_vpmx.R')
source('water.R')
source('clean.R')
source('time.R')
source('subsets.R')
source('check.R')
source('cumBg.R')
source('leak_calcs.R')
sink('../output/leak_output.txt')
  source('leak_output.R', echo = TRUE)
sink()
#source('leak_plots.R')
#source('leak_BMP.R')
source('leak_corr.R')
#source('grav2.R')
source('grav2b.R')
#source('cumBg_grav2.R')
source('BMP.R')
source('BMP_grav2.R')


source('merge.R')
source('export_cbg.R')
source('OBA.R')
source('plots.R')
source('bmp_plots.R')
source('table1.R')

