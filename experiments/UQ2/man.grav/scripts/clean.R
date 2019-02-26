# Cleaning of data and organizing for analysis 

# Water samples 
water$id.orig <- water$id
water$id <- replace(water$id, water$id == 28, 'W1')
water$id <- replace(water$id, water$id == 29, 'W2')
water$id <- replace(water$id, water$id == 30, 'W3')

# check for missing values
# The NAs in mass.init is just first measurement for each bottle
which(is.na(biogas$mass.init))
which(is.na(biogas$mass.final))
which(is.na(biogas$pres.init))
which(!is.na(biogas$pres.resid))   # Pres.resid should not be used - use pres.resid = 0 instead
# No missing values of final mas and pres.init

# Make id a factor instead of a character
biogas$id <- factor(biogas$id)
setup$id <- factor(setup$id)

# Add leading zeros
biogas$date <- sprintf('%08i', biogas$date)
biogas$time <- sprintf('%04i', biogas$time)   

#-----------
# Make a date/time column
biogas$date.time <- dmy_hm(paste0(biogas$date, biogas$time))
sum(is.na(biogas$date.time))  

# Make a cummulative date.time column
biogas <- as.data.frame(mutate(group_by(biogas, id), start.time = min(date.time)))
biogas$elapsed.time <- as.numeric(difftime(biogas$date.time, biogas$start.time, units = 'days'))

# Check times
print(sort(unique(biogas$elapsed.time)))

# Check if day and elapsed.time is equal - as it is elapsed.time is not needed in water data set to be comparable
all.equal(biogas$day, biogas$elapsed.time)
