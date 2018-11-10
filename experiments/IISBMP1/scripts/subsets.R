
# Experiment 1
vpmx1 <- subset(vpmx, exper == 1)
setup1 <- subset(setup, exper == 1)

# Experiment 2
vpmx2 <- subset(vpmx, exper == 2)
setup2 <- subset(setup, exper == 2)

ddply(vpmx2, 'id', summarise, n = sum(!is.na(xCH4)))


