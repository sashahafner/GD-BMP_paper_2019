# Now apply calculated xCH4 to get grav2 estimates of vBg and vCH4
res.g2 <- mass2vol(mangrav$cmassloss, mangrav$xCH4.calc, temp = 35, pres = 1.5, value = "all") 

mangrav$vBg.g2 <- res.g2[, 'vBg']
mangrav$vCH4.g2 <- res.g2[, 'vCH4']

# Show data frame with just biogas, CH4, xCH4 and xCH4.calc

g2 <- mangrav[, c("id", "time.d","massloss", "cmassloss", "xCH4", "xCH4.calc", "vBg.man", "vCH4.man", "cvBg.man", "cvCH4.man", "vBg.grav", "vCH4.grav", "cvBg.grav", "cvCH4.grav", "cvBg.diff", "cvCH4.diff", "vBg.g2", "vCH4.g2")]

View(g2)