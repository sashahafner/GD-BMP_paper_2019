# Calculate leakage from biogas bottles
which(is.na(biogas$mass.init))
which(is.na(biogas$mass.final))

leaks <- massLoss(biogas, 
                time.name = 'elapsed.time', 
                m.pre.name = 'mass.init', m.post.name = 'mass.final',
                id.name = 'id')

leaks <- leaks[ , c('id', 'date', 'elapsed.time', 'mass.tot', 'mass.vent', 'mass.leak', "cmass.tot", "cmass.vent", "cmass.leak") ]
biogas <- merge(biogas, leaks, by = c('id', 'date', 'elapsed.time'), all.x = TRUE)


# Checking leaks
jpeg('../plots/leaks.png')
plot(leaks$elapsed.time, 
     leaks$mass.leak)
abline(0, 0)
abline(detect.lim.tot, 0)
dev.off()

# Plot leaks
jpeg('../plots/cumleaks.png')
par(mfrow = c(1,1))
plot(leaks$elapsed.time, 
     leaks$cmass.leak)
abline(0, 0)
#abline(detect.lim.tot, 0)
dev.off()


# Make a subset where samples with high leak is removed
large.leaks <- subset(filter(leaks, mass.leak > detect.lim.tot))
small.leaks <- subset(filter(leaks, mass.leak < detect.lim.tot))

plot(small.leaks$elapsed.time, small.leaks$mass.leak)
abline(0, 0)

# plot(large.leaks$elapsed.time, large.leaks$mass.leak)


