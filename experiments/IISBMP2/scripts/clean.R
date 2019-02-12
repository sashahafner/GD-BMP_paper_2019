# Cleaning data

# Add row numbers
biogas$row.in.file <- 1:nrow(biogas) + 2

# Make id a factor for plots
biogas$id <- factor(biogas$id)
setup$id <- factor(setup$id)

# Elapsed time
biogas$date.time <- dmy_hm(paste(biogas$date, biogas$time))
t.start <- dmy_hm('27.09.2018 15.35')
biogas$time.d <- signif(as.numeric(difftime(biogas$date.time, t.start, units = 'days')), 3)
biogas$date <- dmy(biogas$date)

# Fill in missing pressure
biogas$pres.amb[is.na(biogas$pres.amb)] <- 1013.25

# Separate water control data
wat <- subset(biogas, id == 'W1')
biogas <- subset(biogas, id != 'W1')

biogas.vol <- subset(biogas, time.d > 0)
