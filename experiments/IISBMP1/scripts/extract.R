# Extracts some example data for use with OBA demos

d <- subset(vpmx, grepl('^[LCEI]', vpmx$id) & ctime > 0)
s <- subset(setup, grepl('^[LCEI]', setup$id))

head(d)
head(s)
tail(d)

d <- d[, c('id', 'date', 'time', 'ctime', 'vol', 'xCH4')]
head(d)

s <- s[, c('id', 'descrip', 'm.inoc', 'm.sub.vs', 'vol.hs')]
s

s$id <- gsub('^C', 'X', s$id)
s$descrip <- as.character(s$descrip)
s$descrip[s$descrip == 'C'] <- 'X'
s

d$id <- gsub('^C', 'X', d$id)
d

d <- d[order(d$id, d$ctime), ]
s <- s[order(s$id), ]
s

write.csv(d, '../output/x_biogas.csv', row.names = FALSE)
write.csv(s, '../output/x_setup.csv', row.names = FALSE)
