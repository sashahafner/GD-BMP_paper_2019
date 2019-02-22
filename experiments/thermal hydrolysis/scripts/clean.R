# Cleaning of data and organizing for analysis 

# Extra - Can be deleted later on
summary(biogas)
head(biogas)

# Make id a factor instead of a character
comp$id <- factor(comp$id)
biogas$id <- factor(biogas$id)
setup$id <- factor(setup$id)

# Addition of leading zeros to time and date coloumn
comp$time <- sprintf("%04i", comp$time)
comp$date <- sprintf("%08i", comp$date)
biogas$time <- sprintf("%04i", biogas$time)
biogas$date <- sprintf("%08i", biogas$date)

# Make a date/time column for measured table and composition table
biogas$date.time <- dmy_hm(paste0(biogas$date, biogas$time))
sum(is.na(biogas$date.time))   # Fail in of 48 rows due to NAs

comp$date.time <- dmy_hm(paste0(comp$date, comp$time))

######
# Discard all rows with water controls (have NAs)
# Delete all water samples and samples from the first sampling
water <- subset(biogas, grepl('^W', id))
biogas <- droplevels(subset(biogas, !grepl('^W', id)))

# Make a cummulative date.time column
biogas <- as.data.frame(mutate(group_by(biogas, id), start.time = min(date.time)))
biogas$elapsed.time <- as.numeric(difftime(biogas$date.time, biogas$start.time, units = 'days'))

# Use start time from biogas for all calculations (min date.time in comp is not trial start)
starts <- summarise(group_by(biogas, id), start.time = min(date.time))
comp <- merge(comp, starts, by = "id")
comp$elapsed.time <- as.numeric(difftime(comp$date.time, comp$start.time, units = 'days'))

# # Merge composition data with biogas data by id and date
# comp1 <- comp[, c('id', 'date', 'xCH4', 'elapsed.time')]
# biogas <- merge(biogas, comp1, by = c('id', 'elapsed.time'), all.x = TRUE)
#                 
