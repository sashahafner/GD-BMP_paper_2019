# Calculate leakage from biogas bottles

#source('functions.R')

which(is.na(biogas$mass.init))
which(is.na(biogas$mass.final))

leaks <- massLoss(biogas, 
                time.name = 'elapsed.time', 
                m.pre.name = 'mass.init', m.post.name = 'mass.final',
                id.name = 'id')

leaks1 <- leaks[ , c('id', 'elapsed.time', 'mass.tot', 'mass.vent', 'mass.leak', "cmass.tot", "cmass.vent", "cmass.leak") ]
biogas <- merge(biogas, leaks1, by = c('id', 'elapsed.time'), all.x = TRUE)

write.csv(leaks, '../output/leaks.csv', row.names = FALSE)


# Checking leaks
jpeg('../plots/leaks.png')
plot(leaks$elapsed.time, 
     leaks$mass.leak)
abline(0, 0)
dev.off()

# Make a subset where samples with high leak is removed
small.leaks <- subset(filter(leaks1, mass.leak < 0.1 ))
plot(small.leaks$elapsed.time, small.leaks$mass.leak)
abline(0, 0)

biogas.leak <- merge(biogas, leaks1, by = c('id', 'elapsed.time'))

plot(leaks$elapsed.time, 
     leaks$cmass.leak)
abline(0, 0)
