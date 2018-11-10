# grav2

# Only those with no leaks
dim(leak.int)
g2dat <- subset(leak.int, leak.m <= 0.2)
dim(g2dat)

# Re-calculate cumulative vol and mass loss
g2dat <- g2dat[order(g2dat$id, g2dat$ctime), ]
g2dat <- ddply(g2dat, 'id', mutate, cmassloss = cumsum(massloss), cvBg.v = cumsum(vBg.v))

g2dat$xCH4.ggd <- g2dat$objective <- NA

for(i in 1:nrow(g2dat)) {

  cat(i, ' ')
  cat(g2dat$id[i], ' ')
  cat(round(100*i/nrow(g2dat), 1), '%\n')

  sol <- optimize(
           function(x) {
             abs(
                 mass2vol(g2dat$cmassloss[i], x, temp = 32, pres = 1.5, value = 'all', 
                          ##headspace = g2dat$vol.hs, headcomp = 'N2', temp.init = 20,
                          pres.std = 1.013, std.message = FALSE)[1, 'vBg'] - 
                 g2dat$cvBg.v[i]
                 )
           },
           lower = 0, upper = 1
         )

  # Extract results
  g2dat[i, 'xCH4.ggd'] <- sol$minimum
  g2dat[i, 'objective'] <- sol$objective

}

# Now apply calculated xCH4 to get grav2 estimates of vBg and vCH4
res.ggd <- mass2vol(g2dat$cmassloss, g2dat$xCH4.ggd, temp = 30, pres = 1.5, value = 'all', pres.std = 1.013) 

g2dat$cvCH4 <- res.ggd[, 'vCH4']
g2dat$cvBg <- res.ggd[, 'vBg']

# Drop implausible values
dim(g2dat)
g2dat <- subset(g2dat, xCH4.ggd >= 0.2 & xCH4.ggd <= 0.8)
dim(g2dat)

### Merge with vpmx2 for cumBg() calcs
##vpmx2 <- merge(vpmx2, g2dat[, c('id', 'ctime', 'xCH4.ggd')], by = c('id', 'ctime'), all.x = TRUE)

options(width = 70)
head(g2dat)
