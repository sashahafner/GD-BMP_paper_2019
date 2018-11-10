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

head(g2dat)

ggplot(bg2, aes(ctime, xCH4.ggd, colour = id, group = id)) + geom_line()
ggplot(bg2, aes(ctime, xCH4.v, colour = id, group = id)) + geom_line()
ggplot(bg2, aes(ctime, cvCH4.g2, colour = substrate, group = id)) + geom_line()
ggplot(bg2, aes(ctime, cvCH4.v, colour = substrate, group = id)) + geom_line()

head(bgg22)

source('merge.R')
source('export_cbg.R')
source('OBA.R')
source('plots.R')
source('bmp_plots.R')
source('table1.R')

head(bmp2vao, 2)
d <- subset(bmp2vao, descrip == 'Cellulose')
d <- subset(bmp2vao, descrip == 'CB')
ggplot(data = d, aes(ctime, cvCH4, colour = id)) + geom_line() + geom_point()

head(sleak.tot)
leak.totd <- subset(leak.tot, detect == 1)
leak.totn <- subset(leak.tot, detect == 0)
sort(leak.totd$pct.leak)
sort(leak.totn$pct.leak)

leak.tot$cvCH4

    print(ggplot(data = bmp1ma, aes(ctime, cvCH4, group = id, colour = descrip)) + geom_line() + geom_point())

head(bmp1ma)

head(leak.int)
