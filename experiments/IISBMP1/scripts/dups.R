# Look for duplicates

wd <- which(duplicated(bg[ , c('id', 'date')]))
bg[sort(c(wd - 1, wd)), ]


