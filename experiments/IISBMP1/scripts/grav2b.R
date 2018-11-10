# grav2

# Only those with no leaks
dim(leak.int)
g2dat <- subset(leak.tot, leak.m <= 0.2)
dim(g2dat)

# Re-calculate cumulative vol and mass loss
g2dat <- g2dat[order(g2dat$id, g2dat$ctime), ]
g2dat <- ddply(g2dat, 'id', mutate, cmassloss = cumsum(massloss), cvBg.v = cumsum(vBg.v))

# Get final values only
table(g2dat$id, g2dat$ctime)
g2dat <- subset(g2dat, ctime > 30)
table(g2dat$id, g2dat$ctime)

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
bgv2 <- merge(bgv2, g2dat[, c('exper', 'id', 'xCH4.ggd')])
bgv2$cvCH4.ggd <- bgv2$xCH4.ggd * bgv2$cvBg.cor

plot(cvCH4.ggd ~ cvCH4, data = bgv2)
hist(bgv2$xCH4.ggd)


