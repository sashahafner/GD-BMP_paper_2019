# Iterative approach for gd method
# Can include both H2O vapor (automatic) and headspace N2
# We need to explore N2 issue
# NTS: Why does this loop get slower each time it is run?! Some memory mystery we need to figure out.

# Note: massloss is automatically returned by cumBg()

options(unit.pres = 'kPa')

# Calculating mass loss
#biogas$massloss <- biogas$mass.init - biogas$mass.final
meas$massloss <- meas$mass.init - meas$mass.final

# Option 1: cmassloss and cvCH4.man for all times. 
# Later values should have decent precision but inter-interval variability may be high

# GD <- optimize(
#              function(x) {
#                abs(
#                    mass2vol(biogas$massloss, xCH4 = 'xCH4', temp = 35, pres = 101.325, value = 'all',
#                             headspace = setup$vol.hs, headcomp = 'N2',
#                             temp.std = 0, pres.std = 101.325, unit.pres = kPa))
#                }
#              )


GD <- optimize(
  function(x) {
    abs(
      mass2vol(meas$massloss, xCH4 = comp$xCH4, temp = 35, pres = 101.325, value = 'all',
               headspace = setup$vol.hs, headcomp = 'N2',
               temp.std = 0, pres.std = 101.325, unit.pres = 'kPa'))
  }
)

# This one can calculate something: (without optimize)
cbg.mass2vol <- mass2vol(meas$massloss, xCH4 = comp$xCH4, temp = 35, pres = 101.325, value = 'all',
         #headspace = setup$vol.hs, headcomp = 'N2',
         temp.std = 0, pres.std = 101.325, unit.pres = 'kPa')

 
# for(i in 1:nrow(biogas)) {
# 
#   cat('row', i, '\n')
# 
#   sol <- optimize(
#            function(x) {
#              abs(
#                  mass2vol(biogas$massloss[i], xCH4 = 'xCH4', temp = 35, pres, value = 'all', 
#                           #headspace = setup$vol.hs[i], headcomp = 'N2',
#                           pres.std = 1.01325, std.message = TRUE)[1, 'vBg'] - 
#                  cbg$cvBg.man[i]
#                  )
#            },
#            lower = 0, upper = 1
#          )
# 
#   # Extract results
#   biogas$xCH4.gd[i] <- sol$minimum
#   biogas$objective[i] <- sol$objective
# }


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


# GD-BMP Calculations from closed solution

Vmb <- 22.3

# Use watVap instead - Where is it? 
# Temp <- 35
# e <- exp(1)
# PH2O <- e^((0.00002302585093*(8.20963000*10^8*Temp-2.292674407*10^11))/(1000*Temp+7559))
# GD$mH2O <- 18.02*(PH2O/(biogas$pres.resid-PH2O))-1/22.3
# GD$dmb <- biogas$m.final - biogas$m.init - VN2*dN2
# GD$db <- GD$dmb/(biogas$vol-setup$vol.hs)-GD$mH2O
# GD$Mb <- GD$db*biogas$vol
# GD$xCH4 <- (44.01 - GD$Mb)/(44.01-16.04)

# By using data in meas
Temp <- 35
PH2O <- exp(1)^((0.00002302585093*(8.20963000*10^8*Temp-2.292674407*10^11))/(1000*Temp+7559))

mH2O <- 18.02*(PH2O/(meas$pres.resid-PH2O))-1/22.3
dmb <- meas$massloss  #- VN2*dN2
GD <- data.frame(mH2O, dmb)

GD$db <- GD$dmb/(meas$vol-setup$vol.hs)-GD$mH2O
GD$Mb <- GD$db*biogas$vol
GD$xCH4 <- (44.01 - GD$Mb)/(44.01-16.04)

extra <- subset(setup, id, vol.hs)

n.vol.hs <- select(setup, id, vol.hs)

n<- merge(GD, select(setup, id, vol.hs))

# Find values of VN2 and dN2













