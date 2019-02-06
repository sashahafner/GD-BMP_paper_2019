# Cleaning of data

# Extra - Can be deleted later on
summary(meas)
head(meas)

# Dfsumm function is used to get an overview
source("../functions/dfsumm.R")
#dfsumm(meas)
#dfsumm(setup)
#dfsumm(comp)

# ----
# Make id a factor instead of a character
comp$id <- factor(comp$id)
meas$id <- factor(meas$id)
setup$id <- factor(setup$id)
# setup$descrip <- factor(setup$id)

# Make methane content in comp a numeric value
comp$xCH4 <- as.numeric(comp$xCH4)

# Changing time formats in comp to numeric
comp$time <- as.numeric(comp$time)
comp$date <- as.numeric(comp$date)

# Addition of leading zeros to time and date coloumn
comp$time <- sprintf("%04i", comp$time)
comp$date <- sprintf("%08i", comp$date)
meas$time <- sprintf("%04i", meas$time)
meas$date <- sprintf("%08i", meas$date)

# Delete numbering of substrate bottles
comp$id <- substr(comp$id, 1, 2)
meas$id <- substr(meas$id, 1, 2)
setup$id <- substr(setup$id, 1, 2)




#Extra stuff
# Round time
# comp$time.d <- round(comp$time.d, digits = 1)
# mass$time.d <- round(meas$time.d, digits = 1)
# pres$time.d <- round(pres$time.d, digits = 1)

# Mass data has one more obs (17 d) than other sheets
# Drop it here
# mass <- subset(mass, time.d < 14)

