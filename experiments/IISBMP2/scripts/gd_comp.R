head(cbg)

table(cbg$time.d)

cbg.end <- cbg[cbg$time.d == 27.9, ]

for(i in 1:nrow(cbg.end)) {

  cat(i, ' ')
  cat(cbg.end$id[i], ' ')
  cat(round(100*i/nrow(cbg.end), 1), '%\n')

  sol <- optimize(
           function(x) {
             abs(
                 mass2vol(cbg.end$cmassloss[i], x, temp = 32, pres = 1500, value = 'all', 
                          ##headspace = cbg.end$vol.hs, headcomp = 'N2', temp.init = 20,
                          pres.std = 1013, std.message = FALSE)[1, 'vBg'] - 
                 cbg.end$cvBg.vol[i]
                 )
           },
           lower = 0, upper = 1
         )

  # Extract results
  cbg.end[i, 'xCH4.gd'] <- sol$minimum
  cbg.end[i, 'objective'] <- sol$objective

}

comp.gd <- cbg.end[, c('id', 'xCH4.gd')]


