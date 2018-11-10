# Sort out biogas composition data

# Trim
comp <- comp[, c('exper', 'id', 'date', 'inject.date.time', 'xCH4', 'xCH4.oa')]

# Pad date in vpm for fixing '1022017' and maybe others as data are added
vpm$date <- sprintf('%08d', vpm$date)

# Merge composition data with biogas data by id and date
# Problem with two B3 measurements one day
# NTS: check this. all.x is needed to stop a bunch of comp-only rows from coming through. What are they? Look for NAME in date. Is this related?
vpmx <- merge(vpm, comp, by = c('exper', 'id', 'date'), all.x = TRUE)

# Look for missing data
# After fixing E3 above, no problems
x <- vpmx[, c('exper', 'id', 'date', 'time', 'inject.date.time', 'xCH4')]
x <- x[is.na(x$xCH4), ]
x <- x[!x$id %in% c('W1', 'W2', 'W3'), ]
# Exclude starting days
x <- x[x$date != '15112016', ]
x <- x[x$date != '17012017', ]
cat('Missing GC samples\n')
print(x[order(x$date), ])
cat('Missing GC samples\n')
# One missing: E3 7122016, I'm not worried about it


