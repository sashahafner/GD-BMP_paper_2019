

x <- subset(vpmx, exper == 1)
cat('Experiment 1\n')
dfsumm(x[, c('id', 'ctime', 'xCH4')])
dfsumm(x)

x <- subset(vpmx, exper == 2)
cat('Experiment 2\n')
dfsumm(x[, c('id', 'ctime', 'xCH4')])
dfsumm(x)
