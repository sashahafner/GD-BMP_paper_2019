# Cleaning of data and organizing for analysis 

# Make id a factor instead of a character
#comp$id <- factor(comp$id)
biogas$id <- factor(biogas$id)
setup$id <- factor(setup$id)
biogas$exper <- factor(biogas$exper)
setup$exper <- factor(setup$exper)

# Clean comp data
## Delete extra columns
comp <- comp[, c('exper', 'id', 'date', 'inject.date.time', 'xCH4', 'xCH4.oa')]

#----------
# Clean biogas data
# Discard all rows with water controls (have NAs)
water <- subset(biogas, grepl('W', biogas$id))
biogas <- droplevels(subset(biogas, !grepl('^W', id)))
# write.csv(water, '../output/water.csv', row.names = FALSE)

# Change from characters to numeric
#biogas$mass.init <- as.numeric(biogas$mass.init)
#biogas$date <- as.numeric(biogas$date)

# Add leading zeros
biogas$date <- sprintf('%08i', biogas$date)

#Cannot add leading zeros to time column - maybe due to some irregular numbers like 6,5
#biogas$time <- as.numeric(biogas$time)
biogas$time <- sprintf('%04i', biogas$time)   


#-----------
# Merge composition data with biogas data by id and date
# Problem with two B3 measurements one day - note from Sasha
biogas <- merge(biogas, comp, by = c('exper', 'id', 'date'))

# Make a date/time column  NB ALL ROWS LACKING LEADING ZEROS IS MADE INTO NAS
biogas$date.time <- dmy_hm(paste0(biogas$date, biogas$time))
sum(is.na(biogas$date.time))  

# Make a cummulative date.time column
biogas <- as.data.frame(mutate(group_by(biogas, exper, id), start.time = min(date.time)))
biogas$elapsed.time <- as.numeric(difftime(biogas$date.time, biogas$start.time, units = 'days'))

# Check times
print(sort(unique(biogas$elapsed.time)))

# Making a column with id + exper for comparison
biogas$id.exper <- paste0(biogas$id, "-E", biogas$exper)
setup$id.exper <- paste0(setup$id, "-E", setup$exper)

head(biogas$id.exper)
head(setup$id.exper)





# This is properbly not needed. 
# Use start time from biogas for all calculations (min date.time in comp is not trial start)
starts <- summarise(group_by(biogas, id), start.time = min(date.time))
comp <- merge(comp, starts, by = "id")
comp$elapsed.time <- as.numeric(difftime(comp$date.time, comp$start.time, units = 'days'))


# Make a subset for each expriment eventually
# sort out time problem

