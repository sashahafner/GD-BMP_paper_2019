# Make a combined data set for gd comparison to gravimetric method 

# Remember to rerun code for both man.grav and gd first to have the correct data set loaded. 
BMP.gd <- read.csv("../../gd/output/BMP.csv")
BMP.mg <- read.csv("../../man_grav/output/BMP.csv")
BMP <- rbind(BMP.mg, BMP.gd)

BMPo.gd <- read.csv("../../gd/output/BMPo.csv")
BMPo.mg <- read.csv("../../man_grav/output/BMPo.csv")
BMPo <- rbindf(BMPo.mg, BMPo.gd)

# yield
yld.gd <- read.csv("../../gd/output/yld.csv")
yld.mg <- read.csv("../../man_grav/output/yld.csv")
yld <- rbind(yld.gd, yld.mg)

# yield w/ obs
yldo.gd <- read.csv("../../gd/output/yldo.csv")
yldo.mg <- read.csv("../../man_grav/output/yldo.csv")
yldo <- rbindf(yldo.gd, yldo.mg)

# cbg
cbg.gd <- read.csv('../../gd/output/cbg_gdt.csv')
cbg.grav <- read.csv('../../man_grav/output/cbg_grav.csv')
cbg <- merge(cbg.gd, cbg.grav, by = c('id', 'time.d'), suffixes = c('.gdt', '.grav'))
setup <- read.csv('../../man_grav/output/setup.csv')
cbg <- merge(setup, cbg, by = 'id')
