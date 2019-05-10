# Cleaning of data and organizing for analysis 

# Make id and experiment factors
biogas$id <- factor(biogas$id)
setup$id <- factor(setup$id)
setup$exper <- factor(setup$exper)
biogas$exper <- factor(biogas$exper)

# Clean comp data
# Drop extra columns
comp <- comp[, c('exper', 'id', 'date', 'inject.date.time', 'xCH4', 'xCH4.oa')]
# Rename xCH4 (because cumBgGD() will return xCH4)
comp$xCH4.GC <- comp$xCH4
comp$xCH4 <- NULL

# Clean biogas data
# Discard all rows with water controls (have NAs)
water <- subset(biogas, grepl('W', biogas$id))
biogas <- droplevels(subset(biogas, !grepl('^W', id)))

# Add leading zeros
biogas$date <- sprintf('%08i', biogas$date)
biogas$time <- sprintf('%04i', biogas$time)   

# Merge composition data with biogas data by id and date
biogas <- merge(biogas, comp, by = c('exper', 'id', 'date'), all.x = TRUE)

# Make a date/time column
biogas$date.time <- dmy_hm(paste0(biogas$date, biogas$time))
if (sum(is.na(biogas$date.time)) > 0) stop('Date/time error date652')

# Make a cummulative date.time column
biogas <- as.data.frame(mutate(group_by(biogas, exper, id), start.time = min(date.time)))
biogas$time.d <- round(as.numeric(difftime(biogas$date.time, biogas$start.time, units = 'days')), 1)
