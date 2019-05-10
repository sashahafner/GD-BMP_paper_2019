# Detection limits for leakage

# Calculate the standard deviation for water samples
detect.limits <- summarise(group_by(water, id, exper), 
                           mean = mean(mass.init),
                           stddev = sd(mass.init), 
                           day.start = first(mass.init), 
                           day.end = last(mass.init), 
                           interval.nb = n_distinct(date),
                           detect.lim.int = stddev*5, 
                           detect.lim.tot = detect.lim.int*sqrt(interval.nb)
                          )

# Use mean
# Detection limits for all experiments together
detect.lim.int <- round(mean(detect.limits$detect.lim.int), digits = 2)
detect.lim.tot <- round(mean(detect.limits$detect.lim.tot), digits = 2)
