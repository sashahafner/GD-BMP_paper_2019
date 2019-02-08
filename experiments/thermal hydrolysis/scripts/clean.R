
# Cleaning of data and organizing for analysis 

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

# Make methane content in comp a numeric value
comp$xCH4 <- as.numeric(comp$xCH4)

# Changing time formats in comp to numeric
comp$time <- as.numeric(comp$time)
comp$date <- as.numeric(comp$date)
meas$time <- as.numeric(meas$time)
meas$date <- as.numeric(meas$date)

# Addition of leading zeros to time and date coloumn
comp$time <- sprintf("%04i", comp$time)
comp$date <- sprintf("%08i", comp$date)
meas$time <- sprintf("%04i", meas$time)
meas$date <- sprintf("%08i", meas$date)

# Make a date/time column for measured table and composition table
meas$date.time <- paste0(meas$date, meas$time)
meas$date.time <- dmy_hm(meas$date.time)
sum(is.na(meas$date.time))   # Fail in of 48 rows due to NAs

comp$date.time <- paste0(comp$date, comp$time)
comp$date.time <- dmy_hm(comp$date.time)

######
# Discard all rows with water controls (have NAs)
# Delete all water samples and samples from the first sampling
water <- subset(meas, id %in% c("W1", "W2", "W3"))
meas <- droplevels(subset(meas, !id %in% c("W1", "W2", "W3")))

# Make a cummulative date.time column
meas.start.time <- summarise(group_by(meas, id), start.time = min(date.time))
meas <- merge(meas, meas.start.time, by = c("id"))
meas$elapsed.time <- as.numeric((meas$date.time - meas$start.time)/(24*60*60))

comp.start.time <- summarise(group_by(comp, id), start.time = min(date.time))
comp <- merge(comp, comp.start.time, by = c("id"))
comp$elapsed.time <- as.numeric((comp$date.time - comp$start.time)/(24*60*60))


biogas <- meas

