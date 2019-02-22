# Calculate leakage from biogas bottles

#source('functions.R')

# which(is.na(biogas$mass.init))
# which(is.na(biogas$mass.final))
# 
# biogas.leak <- biogas[!is.na(biogas$mass.init) & !is.na(biogas$mass.final), ]

leaks <- massLoss(biogas, 
                  time.name = 'elapsed.time', 
                  m.pre.name = 'mass.init', m.post.name = 'mass.final',
                  id.name = 'id')

leaks1 <- leaks[ , c('id', 'elapsed.time', 'mass.tot', 'mass.vent', 'mass.leak', "cmass.tot", "cmass.vent", "cmass.leak") ]
biogas <- merge(biogas, leaks1, by = c('id', 'elapsed.time'))