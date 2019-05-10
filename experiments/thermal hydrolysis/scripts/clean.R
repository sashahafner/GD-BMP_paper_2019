# Cleaning of data and organizing for analysis 

# Make id a factor instead of a character
comp$id <- factor(comp$id)
biogas$id <- factor(biogas$id)
setup$id <- factor(setup$id)

# Addition of leading zeros to time and date coloumn
comp$time <- sprintf("%04i", comp$time)
comp$date <- sprintf("%08i", comp$date)
biogas$time <- sprintf("%04i", biogas$time)
biogas$date <- sprintf("%08i", biogas$date)

# Discard all rows with water controls (have NAs)
# Delete all water samples and samples from the first sampling
water <- subset(biogas, grepl('^W', id))
biogas <- droplevels(subset(biogas, !grepl('^W', id)))
water.s <- subset(setup, grepl('W', setup$id))
setup <- droplevels(subset(setup, !grepl('^W', id)))

# Make a date/time column for measured table and composition table
biogas$date.time <- dmy_hm(paste0(biogas$date, biogas$time))
if (sum(is.na(biogas$date.time)) > 0) stop('Date/time error date652')

comp$date.time <- dmy_hm(paste0(comp$date, comp$time))
if (sum(is.na(comp$date.time)) > 0) stop('Date/time error date652')

# Make an elapsed time column
biogas <- as.data.frame(mutate(group_by(biogas, id), start.time = min(date.time)))
biogas$time.d <- as.numeric(difftime(biogas$date.time, biogas$start.time, units = 'days'))

# Use start time from biogas for all calculations (min date.time in comp is not trial start)
starts <- summarise(group_by(biogas, id), start.time = min(date.time))
comp <- merge(comp, starts, by = "id")
comp$time.d <- as.numeric(difftime(comp$date.time, comp$start.time, units = 'days'))

# Drop data after 21 d (cellulose and ethanol did not have 31 d meas)
biogas <- biogas[biogas$time.d <= 21, ]

