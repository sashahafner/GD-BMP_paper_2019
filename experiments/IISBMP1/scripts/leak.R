# Calculate leakage from biogas bottles
which(is.na(biogas$mass.init))
which(is.na(biogas$mass.final))

biogas.leak <- biogas[!is.na(biogas$mass.init) & !is.na(biogas$mass.final), ]

leaks <- massLoss(biogas.leak, 
                  time.name = 'elapsed.time', 
                  m.pre.name = 'mass.init', m.post.name = 'mass.final',
                  id.name = 'id.exper')

id.descrip <- setup[, c('id.exper', 'descrip')]
leaks <- merge(leaks, id.descrip, by = 'id.exper')

leaks <- leaks[ , c( 'id.exper', 'exper', 'descrip', 'elapsed.time', 'mass.tot', 'mass.vent', 'mass.leak', "cmass.tot", "cmass.vent", "cmass.leak") ]
biogas <- merge(biogas, leaks, by = c('id.exper', 'exper', 'elapsed.time'))

leaks1 <- leaks[leaks$exper == 1, ]
leaks2 <- leaks[leaks$exper == 2, ]
  
# Checking leaks
jpeg('../plots/leaks.png')
plot(leaks$elapsed.time, 
     leaks$mass.leak)
abline(0, 0)
abline(detect.lim.int, 0)
dev.off()

# Checking leaks
jpeg('../plots/leaks1.2.png')
par(mfrow = c(1,2))
plot(leaks1$elapsed.time, 
     leaks1$mass.leak)
abline(0, 0)
abline(detect.lim.int1, 0)

plot(leaks2$elapsed.time, 
     leaks2$mass.leak)
abline(0, 0)
abline(detect.lim.int2, 0)
dev.off()

# Plot leaks
jpeg('../plots/cumleaks.png')
par(mfrow = c(1,1))
plot(leaks$elapsed.time, 
     leaks$cmass.leak)
abline(0, 0)
abline(detect.lim.tot, 0)
dev.off()

jpeg('../plots/cumleaks1.2.png')
par(mfrow = c(1,2))
plot(leaks1$elapsed.time, 
     leaks1$cmass.leak)
abline(0, 0)
abline(detect.lim.tot2, 0)

plot(leaks2$elapsed.time, 
     leaks2$cmass.leak)
abline(0, 0)
abline(detect.lim.tot2, 0)
dev.off()

# Make a subset where samples with high leak is removed
large.leaks <- subset(filter(leaks, cmass.leak > detect.lim.tot))
small.leaks <- subset(filter(leaks, cmass.leak < detect.lim.tot))

large.leaks.int <- subset(filter(leaks, mass.leak > detect.lim.int))
small.leaks.int <- subset(filter(leaks, mass.leak < detect.lim.int))


# If using the values seperated for exper delete the above
# For each experiment 
# Exper 1
large.leaks1 <- subset(filter(leaks1, cmass.leak > detect.lim.tot1))
no.leaks1 <- subset(filter(leaks1, cmass.leak < detect.lim.tot1))

large.leaks.int1 <- subset(filter(leaks1, mass.leak > detect.lim.int1))
no.leaks.int1 <- subset(filter(leaks1, mass.leak < detect.lim.int1))

# Exper 2
large.leaks2 <- subset(filter(leaks2, cmass.leak > detect.lim.tot2))
no.leaks2 <- subset(filter(leaks2, cmass.leak < detect.lim.tot2))

large.leaks.int2 <- subset(filter(leaks1, mass.leak > detect.lim.int1))
no.leaks.int2 <- subset(filter(leaks1, mass.leak < detect.lim.int1))


# Plots
# plot(small.leaks1$elapsed.time, small.leaks1$mass.leak)
# plot(large.leaks$elapsed.time, large.leaks$mass.leak)
