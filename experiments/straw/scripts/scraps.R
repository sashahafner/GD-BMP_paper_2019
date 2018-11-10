# Round time
comp$time.d <- round(comp$time.d, digits = 0)
mass$time.d <- round(mass$time.d, digits = 0)
pres$time.d <- round(pres$time.d, digits = 0)

# This dataset has an observation more than the mass dataset
# Lets find out where with the table()

table(mass$id)
table(mass$id)

# Line 87 is wrong from this data set and should be removed, since the time from the comp is not present in the mass sheet

mass2 <- mass2[-87,]

# Renaming rows

rownames(mass2) <- NULL

## Manometric

#Insert composition data into pres data sheet
pres2 <- merge(pres, comp, by = c('id', 'time.d'), all = TRUE)
table(pres$id)
table(pres2$id)
# Same issues as before - No data for time 11:25 in comp sheet

pres2 <- pres2[-71,]

# Resetting rows for pres2
rownames(pres2) <- NULLmerge(mass, comp, by = c('id', 'time.d'), all = TRUE)

mass2 <- merge(mass, comp, by = c('id', 'time.d'), all = TRUE)

# Organizing mass data by id and time.d
mass <- arrange(mass, id, time.d)

# Organizing pres data by id and time.d

pres <- arrange(pres, id, time.d)

# Insert xCH4 data into mass and pres

CH4 <- comp[, c('id', 'time.d', 'time','xCH4')]

CH4 <- arrange(CH4, id, time.d)

# Add 0 to date and time
mass$date <- sprintf("%08d", mass$date)
pres$date <- sprintf("%08d", pres$date)

# Remove X columns from mass data frame (don't know where they come from)

mass <- mass[, c("exper", "id", "date", "time", "time.d", "mass.final")]


