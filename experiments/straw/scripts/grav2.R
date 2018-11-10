# Iterative approach for grav2 method
# Can include both H2O vapor (automatic) and headspace N2
# We need to explore N2 issue
# NTS: Why does this loop get slower each time it is run?! Some memory mystery we need to figure out.

# Note: massloss is automatically returned by cumBg()

# Option 1: cmassloss and cvCH4.man for all times. 
# Later values should have decent precision but inter-interval variability may be high
for(i in 1:nrow(cbg)) {

  cat('row', i, '\n')

  sol <- optimize(
           function(x) {
             abs(
                 mass2vol(cbg$cmassloss[i], x, temp = 35, pres = 1.5, value = 'all', 
                          headspace = cbg$vol.hs[i], headcomp = 'N2',
                          pres.std = 1.01325, std.message = FALSE)[1, 'vBg'] - 
                 cbg$cvBg.man[i]
                 )
           },
           lower = 0, upper = 1
         )

  # Extract results
  cbg$xCH4.grav2[i] <- sol$minimum
  cbg$objective[i] <- sol$objective
}

# Show rows with problems
cbg[cbg$xCH4.grav2 < 0.1 | cbg$xCH4.grav2 > 0.9, ]

# Calculate grav2 CH4 and Bg
res.grav2 <- mass2vol(cbg$cmassloss, cbg$xCH4.grav2, temp = 35, pres = 1.5, pres.std = 1.01325, value = 'all') 
cbg$cvBg.grav2 <- res.grav2[, 'vBg']
cbg$cvCH4.grav2 <- res.grav2[, 'vCH4']

head(cbg)

# Because they are not calculated above, get vCH4 and vBg too
cbg <- cbg[order(cbg$id, cbg$time.d), ]
cbg <- ddply(cbg, 'id', mutate, 
                     vBg.grav2 = diff(c(0, cvBg.grav2)), 
                     vCH4.grav2 = diff(c(0, cvCH4.grav2))
                     )


