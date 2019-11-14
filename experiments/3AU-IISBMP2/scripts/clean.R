# Cleaning of data and organizing for analysis 

# Make id a factor instead of a character
biogas$id <- factor(biogas$id)
setup$id <- factor(setup$id)

# Make a date/time column for measured table and composition table
biogas$date.time <- dmy_hm(paste0(biogas$date, biogas$time))

# Discard all rows with water controls (have NAs)
water <- subset(biogas, grepl('W', biogas$id))
biogas <- droplevels(subset(biogas, !grepl('^W', id)))
water.s <- subset(setup, grepl('W', setup$id))
setup <- droplevels(subset(setup, !grepl('^W', id)))

# Make a cummulative date.time column
biogas <- as.data.frame(mutate(group_by(biogas, id), start.time = min(date.time)))
biogas$time.d <- as.numeric(difftime(biogas$date.time, biogas$start.time, units = 'days'))
