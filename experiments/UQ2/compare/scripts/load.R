# Make a combined data set for gd comparison to gravimetric method 

# Remember to rerun code for both man.grav and gd first to have the correct data set loaded. 
gd <- "../../gd/output/BMP.csv"
BMP.gd <- as.data.frame(read.csv(gd))

# list.files( "../gd/output")

grav <- "../../man.grav/output/BMP.csv"
BMP.grav <- as.data.frame(read.csv(grav))

# composition
gdcomp <- "../../gd/results/gdxCH4.csv"
comp.gd<- as.data.frame(read.csv(gdcomp))

GCcomp <- "../../man.grav/results/GCxCH4.csv"
comp.GC <- as.data.frame(read.csv(GCcomp))

