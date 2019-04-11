# Calculate leakage from biogas bottles
which(is.na(biogas$mass.init))
which(is.na(biogas$mass.final))


biogas.leak <- biogas[!is.na(biogas$mass.init) & !is.na(biogas$mass.final), ]
leaks <- massLoss(biogas.leak, 
                time.name = 'elapsed.time', 
                m.pre.name = 'mass.init', m.post.name = 'mass.final',
                id.name = 'id')

id.descrip <- setup[, c('id', 'descrip')]
leaks <- merge(leaks, id.descrip, by = 'id', all.x = TRUE)

leaks <- leaks[ , c('id', 'descrip', 'date', 'elapsed.time', 'mass.tot', 'mass.vent', 'mass.leak', "cmass.tot", "cmass.vent", "cmass.leak") ]
biogas <- merge(biogas, leaks, by = c('id', 'date', 'elapsed.time'), all.x = TRUE)


# Checking leaks
jpeg('../plots/leaks.png')
plot(leaks$elapsed.time, 
     leaks$mass.leak)
abline(0, 0)
abline(detect.lim.int, 0)
dev.off()

# Plot leaks
jpeg('../plots/cumleaks.png')
par(mfrow = c(1,1))
plot(leaks$elapsed.time, 
     leaks$cmass.leak, 
     xlab = "Time [D]", ylab = "Cumulative mass loss [g]")
abline(0, 0)
abline(detect.lim.tot, 0, col = "red")
dev.off()
# 
# # Make a subset where samples with high leak is removed
large.leaks <- subset(filter(leaks, cmass.leak > detect.lim.tot))
small.leaks <- subset(filter(leaks, cmass.leak < detect.lim.tot))

large.leaks.int <- subset(filter(leaks, mass.leak > detect.lim.int))
small.leaks.int <- subset(filter(leaks, mass.leak < detect.lim.int))
# 
# plot(small.leaks$elapsed.time, small.leaks$mass.leak)
# abline(0, 0)
# 
# ##plot(large.leaks$elapsed.time, large.leaks$mass.leak)
# 
# 
