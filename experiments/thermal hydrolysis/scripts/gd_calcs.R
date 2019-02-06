# Iterative approach for gd method
# Can include both H2O vapor (automatic) and headspace N2
# We need to explore N2 issue
# NTS: Why does this loop get slower each time it is run?! Some memory mystery we need to figure out.

# Note: massloss is automatically returned by cumBg()

# Option 1: cmassloss and cvCH4.man for all times. 
# Later values should have decent precision but inter-interval variability may be high

# Calculating mass loss
biogas$massloss <- biogas$mass.init - biogas$mass.final

for(i in 1:nrow(biogas)) {

  cat('row', i, '\n')

  sol <- optimize(
           function(x) {
             abs(
                 mass2vol(biogas$massloss[i], xCH4 = 'xCH4', temp = 35, pres, value = 'all', 
                          #headspace = setup$vol.hs[i], headcomp = 'N2',
                          pres.std = 1.01325, std.message = TRUE)[1, 'vBg'] - 
                 cbg$cvBg.man[i]
                 )
           },
           lower = 0, upper = 1
         )

  # Extract results
  biogas$xCH4.gd[i] <- sol$minimum
  biogas$objective[i] <- sol$objective
}


# # Show rows with problems
# cbg[cbg$xCH4.gd < 0.1 | cbg$xCH4.gd > 0.9, ]
# 
# # Calculate gd CH4 and Bg
# res.gd <- mass2vol(cbg$cmassloss, cbg$xCH4.gd, temp = 35, pres = 1.5, pres.std = 1.01325, value = 'all') 
# cbg$cvBg.gd <- res.gd[, 'vBg']
# cbg$cvCH4.gd <- res.gd[, 'vCH4']
# 
# # Because they are not calculated above, get vCH4 and vBg too
# cbg <- cbg[order(cbg$id, cbg$time.d), ]
# cbg <- ddply(cbg, 'id', mutate, 
#              vBg.gd = diff(c(0, cvBg.gd)), 
#              vCH4.gd = diff(c(0, cvCH4.gd))
#             )
