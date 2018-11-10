# Cleaning data

# Make id a factor
comp$id <- factor(comp$id)
mass$id <- factor(mass$id)
pres$id <- factor(pres$id)
setup$id <- factor(setup$id)

# Round time
comp$time.d <- round(comp$time.d, digits = 1)
mass$time.d <- round(mass$time.d, digits = 1)
pres$time.d <- round(pres$time.d, digits = 1)

# Mass data has one more obs (17 d) than other sheets
# Drop it here
mass <- subset(mass, time.d < 14)


