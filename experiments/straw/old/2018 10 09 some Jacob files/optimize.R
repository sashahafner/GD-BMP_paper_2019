# Iterative approach for grav2 method
# Can include both H2O vapor (automatic) and headspace N2
# We need to explore N2 issue

# Note: massloss is automatically returned by cumBg()

for(i in 1:nrow(mangrav)) {

  sol <- optimize(
           function(x) {
             abs(
                 mass2vol(mangrav$cmassloss[i], x, temp = 35, pres = 1.5, value = 'all')[1, 'vBg'] - 
                 mangrav$cvBg.man[i]
                 )
           },
           lower = 0, upper = 1
         )

  # Extract results
  mangrav$xCH4.calc[i] <- signif(sol$minimum, 5)
  mangrav$objective[i] <- sol$objective
}

