
# Three sets of bottles (W1, W2, W3)

# Order water samples according to elapsed time
water <- arrange(water, day)

# Calculate the standard deviation for water samples
detect.limits <- summarise(group_by(water, id), 
                   mean = mean(m.tot1),
                   stddev = sd(m.tot1), 
                   day.start = first(m.tot1), 
                   day.end = last(m.tot1), 
                   interval_nb = n_distinct(day),
                   detect.lim.int = stddev*3, 
                   detect.lim.tot = detect.lim.int*sqrt(interval_nb))
# Use mean

detect.lim.int <- round(mean(detect.limits$detect.lim.int), digits = 2)
detect.lim.tot <- round(mean(detect.limits$detect.lim.tot), digits = 2)