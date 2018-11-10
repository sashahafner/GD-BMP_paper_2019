# Exports results needed by Christof

# First cvCH4 etc. for "BMP test data" sheet
for (e in 1:2) {

  d <- subset(bgm, exper == e)

  for (s in unique(d$descrip)) {

    dd <- subset(d, descrip == s)

    ddd <- subset(dd, ctime > 8.8)[, c('id', 'm.inoc', 'm.sub', 'cvCH4', 'ctime')]
    ddd <- ddd[order(ddd$ctime, ddd$id), ]
    write.csv(ddd, paste0('../output/cbg/', e, s, '.csv'), row.names = FALSE)

  }

}

# Then data for kinetic analysis
d <- bgm[, c('exper', 'id', 'date.time', 'ctime', 'cvCH4', 'xCH4', 'cvBg')]
d <- d[order(d$exper, d$id, d$date.time), ]
head(d)
tail(d)

write.csv(d, '../output/SDU_CH4_v_t.csv', row.names = FALSE)
