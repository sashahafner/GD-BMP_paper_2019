
# Three sets of bottles (W1, W2, W3)

# Change from characters to numeric 
water$mass.init <- as.numeric(water$mass.init)
water$date <- sprintf('%08i', water$date)
water$time <- sprintf('%04i', water$time)   
water$date.time <- dmy_hm(paste0(water$date, water$time))

# Order water samples according to elapsed time
water <- arrange(water, date.time)

# Calculate the standard deviation for water samples
detect.limits <- summarise(group_by(water, id, exper), 
                   mean = mean(mass.init),
                   stddev = sd(mass.init), 
                   day.start = first(mass.init), 
                   day.end = last(mass.init), 
                   interval_nb = n_distinct(date),
                   detect.lim.int = stddev*3, 
                   detect.lim.tot = detect.lim.int*sqrt(interval_nb))
# Use mean

# Detection limits for all experiments together
detect.lim.int <- round(mean(detect.limits$detect.lim.int), digits = 2)
detect.lim.tot <- round(mean(detect.limits$detect.lim.tot), digits = 2)

# Detection limits separate for exper 1 and 2
detect.limits1 <- subset(detect.limits, exper == 1)
detect.limits2 <- subset(detect.limits, exper == 2)
detect.lim.int1 <- round(mean(detect.limits1$detect.lim.int), digits = 2)
detect.lim.tot1 <- round(mean(detect.limits1$detect.lim.tot), digits = 2)
detect.lim.int2 <- round(mean(detect.limits2$detect.lim.int), digits = 2)
detect.lim.tot2 <- round(mean(detect.limits2$detect.lim.tot), digits = 2)


