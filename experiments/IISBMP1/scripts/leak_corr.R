# Correct vol data for leaks

head(leak.tot)
head(bgv1)
table(leak.tot$exper, leak.tot$id)

bgv2 <- merge(bgv2, leak.tot[, c('exper', 'id', 'pct.leak', 'detect')], by = c('exper', 'id'))

bgv2$cvCH4.cor <- bgv2$cvCH4
bgv2$cvCH4.cor[bgv2$detect == 1] <- (bgv2$cvCH4/(1 - bgv2$pct.leak/100))[bgv2$detect == 1] 
bgv2$cvBg.cor <- bgv2$cvBg
bgv2$cvBg.cor[bgv2$detect == 1] <- (bgv2$cvBg/(1 - bgv2$pct.leak/100))[bgv2$detect == 1] 
