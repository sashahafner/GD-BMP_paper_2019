# Script for data analysis BMP grav2 method
# Jacob Mortensen

# Load packages
source('packages.R')

# Read in data

source('load.R')

# Cleaning data

# Add 0 to date and time

mass$date <- sprintf("%08d", mass$date)
pres$date <- sprintf("%08d", pres$date)

# Remove X columns from mass data frame (don't know where they come from)

mass <- mass[, c("exper", "id", "date", "time", "time.d", "mass.final")]

# Organizing mass data by id and time.d

mass <- arrange(mass, id, time.d)

# Organizing pres data by id and time.d

pres <- arrange(pres, id, time.d)

# Insert xCH4 data into mass and pres

CH4 <- comp[, c('id', 'time.d', 'time','xCH4')]

CH4 <- arrange(CH4, id, time.d)

CH4$time.d <- round(CH4$time.d, digits = 0)
mass$time.d <- round(mass$time.d, digits = 0)
pres$time.d <- round(pres$time.d, digits = 0)

merge(mass, CH4, by = c('id', 'time.d'), all = TRUE)

mass2 <- merge(mass, CH4, by = c('id', 'time.d'), all = TRUE)

# This dataset has an observation more than the mass dataset
# Lets find out where with the table()

table(mass2$id)
table(mass$id)

# Line 87 is wrong from this data set and should be removed, since the time from the comp is not present in the mass sheet

mass2 <- mass2[-87,]

# Renaming rows

rownames(mass2) <- NULL


# Calculating biogas production from cumBg()
## Gravimetric

#Comments: temp.init
grav <- cumBg(mass2, dat.type = "mass", temp = 35, pres = 1.5,
                         data.struct = "longcombo",
                         id.name = "id", time.name = "time.d",
                         dat.name = "mass.final", comp.name = "xCH4",
                         headspace = setup, vol.hs.name = "vol.hs", headcomp = "N2",
                         temp.init = 21.55,
                         extrap = TRUE,
                         addt0 = TRUE)

## Manometric

#Insert composition data into pres data sheet
pres2 <- merge(pres, CH4, by = c('id', 'time.d'), all = TRUE)
table(pres$id)
table(pres2$id)
# Same issues as before - No data for time 11:25 in comp sheet

pres2 <- pres2[-71,]

# Resetting rows for pres2
rownames(pres2) <- NULL

#Comments: Pres.resid/pres.init/temp.init

man <- cumBg(pres2, dat.type = "pres", temp = 35,
                data.struct = "longcombo",
                id.name = "id", time.name = "time.d",
                dat.name = "pres", comp.name = "xCH4",
                temp.init = 21.55,
                pres.resid = pres2$pres.resid, pres.init = 1.01,
                headspace = setup, vol.hs.name = "vol.hs",
                pres.amb = 1.01, absolute = TRUE,
                extrap = TRUE,
                addt0 = FALSE)


# Merging man and grav dataset to use for optimize function

names(man)
names(grav)

mangrav <- merge(man, grav, by = c('id', 'time.d', 'exper', 'date', 'time.x','time.y','xCH4','temperature','vol.hs'), all = TRUE)
mangrav <- arrange(mangrav, id, time.d)

# Change names to show which data that belongs to manometric and gravimetric

names(mangrav)

setnames(mangrav, 
         old=c("vBg.x", "vCH4.x", "cvBg.x", "cvCH4.x", "rvBg.x", "rvCH4.x"), 
         new=c("vBg.man", "vCH4.man", "cvBg.man", "cvCH4.man", "rvBg.man", "rvCH4.man"))

setnames(mangrav, 
         old=c("vBg.y", "vCH4.y", "cvBg.y", "cvCH4.y", "rvBg.y", "rvCH4.y"), 
         new=c("vBg.grav", "vCH4.grav", "cvBg.grav", "cvCH4.grav", "rvBg.grav", "rvCH4.grav"))

# Calculate difference

mangrav$cvBg.diff <- mangrav$cvBg.man - mangrav$cvBg.grav
mangrav$cvCH4.diff <- mangrav$cvCH4.man - mangrav$cvCH4.grav

# Compare xCH4 and xCH4 calc

xCH4 <- mangrav[, c("id", "time.d","xCH4","xCH4.calc")]

# Now apply calculated xCH4 to get grav2 estimates of vBg and vCH4
res.g2 <- mass2vol(mangrav$cmassloss, mangrav$xCH4.calc, temp = 35, pres = 1.5, value = "all") 

mangrav$vCH4.g2 <- res.g2[, 'vCH4']
mangrav$vBg.g2 <- res.g2[, 'vBg']

# Show data frame with just biogas, CH4, xCH4 and xCH4.calc

g2 <- mangrav[, c("id", "time.d","massloss", "cmassloss", "xCH4", "xCH4.calc", "vBg.man", "vCH4.man", "cvBg.man", "cvCH4.man", "vBg.grav", "vCH4.grav", "cvBg.grav", "cvCH4.grav", "cvBg.diff", "cvCH4.diff", "vCH4.g2", "vBg.g2")]
