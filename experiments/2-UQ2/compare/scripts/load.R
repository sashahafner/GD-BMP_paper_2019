# Load data

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
cbg.gdc <- read.csv('../../gd/output/cbg_gdtc.csv')
cbg.grav <- read.csv('../../man_grav/output/cbg_grav.csv')
cbg.man <- read.csv('../../man_grav/output/cbg_man.csv')

setup.grav <- read.csv('../../man_grav/output/setup.csv')
setup.gd <- read.csv('../../gd/output/setup.csv')

cbg.gd <- merge(setup.gd, cbg.gd, by = 'id')
cbg.gdc <- merge(setup.gd, cbg.gdc, by = 'id')
cbg.grav <- merge(setup.grav, cbg.grav, by = 'id')
cbg.man <- merge(setup.grav, cbg.man, by = 'id')
