# Sort out dates and times

vpmx$time <- sprintf('%04d', vpmx$time)
#vpmx$date <- sprintf('%08d', vpmx$date)
vpmx$date.time <- dmy_hm(paste(vpmx$date, vpmx$time))

# Cumulative time, rounded for BMP means
vpmx$ctime <- NA
vpmx$ctime[vpmx$exper == 1] <- round(as.numeric(difftime(vpmx$date.time[vpmx$exper == 1], dmy_hm('15112016 1440'), units = 'days')), 1)
vpmx$ctime[vpmx$exper == 2] <- round(as.numeric(difftime(vpmx$date.time[vpmx$exper == 2], dmy_hm('17012017 1350'), units = 'days')), 1)

# Check times
print(sort(unique(vpmx$ctime)))

# Still problem, set to middle here
vpmx[vpmx$ctime %in% c(30.8, 30.9), 'ctime'] <- 30.85
vpmx[vpmx$ctime %in% c(8.8, 8.9), 'ctime'] <- 8.85
vpmx[vpmx$ctime %in% c(6.8, 6.9), 'ctime'] <- 6.85
vpmx[vpmx$ctime %in% c(14.8, 14.9), 'ctime'] <- 14.85
vpmx[vpmx$ctime %in% c(31.1, 31.2), 'ctime'] <- 31.15

# Check times
print(sort(unique(vpmx$ctime)))

