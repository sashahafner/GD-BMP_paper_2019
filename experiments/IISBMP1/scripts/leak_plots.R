# Leak plots

# Drop time zero for plots
leak.int <- leak.int[leak.int$ctime > 0.2, ]

pdf('../plots/il_pres_compt.pdf', height = 3.5, width = 3.5, pointsize = 12)
  plot(pres.est ~ pres, data = leak.int)
  abline(0, 1)
dev.off()

# 90 mm width for 1 column = 3.543 in
pdf('../plots/il_leak_pvt.pdf', height = 3.5, width = 3.5, pointsize = 12)
  par(mfrow = c(1, 1), mar = c(4, 4, 1, 1), mgp = c(2.5, 1, 0))

  plot(pres.est ~ ctime, data = leak.int, type = 'n', xlim = c(0, 33), ylim = c(0, 180),
       xlab = 'Cumulative incubation time (d)', ylab = 'Headspace pressure (kPa)')
  for(i in unique(leak.int$id)) {
    dd <- subset(leak.int, id == i) 
    lines(pres.est ~ ctime, data = dd, col = 'gray45', lwd = 0.5)
    points(pres.est ~ ctime, data = dd, pch = 19, cex = 0.4, col = 'gray45')
  }
  points(pres.est ~ ctime, data = subset(leak.int, leak.m > dli), cex = 15*leak.m)
  points(pres.est ~ ctime, data = subset(leak.int, id == 'C5'), cex = 15*leak.m, lwd = 2)
  points(pres.est ~ ctime, data = subset(leak.int, leak.m <= dli), cex = 15*leak.m, col = 'gray45')
  legend('topright', 'Detection limit', pch = 1, cex = 0.8, pt.cex = dli*15)
  args(legend)
dev.off()

   
# 90 mm width for 1 column = 3.543 in
set.seed(123)
pdf('../plots/il_int_leak.pdf', height = 3.5, width = 3.5, pointsize = 12)
  par(mfrow = c(1, 1), mar = c(4, 4, 1, 1), mgp = c(2.5, 1, 0))

  plot(err.v ~ leak.m, data = leak.int, type = 'n', xlab = 'Leak mass (g)', ylab = 'Volumetric error (mL)')
  abline(v = dli)
  abline(h = 0, lty = 2)
  abline(v = 0, lty = 2)
  text(leak.int$leak.m, leak.int$err.v, leak.int$id, cex = 0.8)
  points(wat.int$mass.change, rnorm(length(wat.int$mass.change), 140, 20), pch = 1, col = 'gray45')
dev.off()

  plot(leak.m.tot ~ jitter(exper), data = leak.tot, pch = 1, col = 'black', type = 'p', xlim = c(0, 3), xlab = 'Leak mass (g)', ylab = 'Volumetric error (mL)')

  
pdf('../plots/il_tot_leak.pdf', height = 3.5, width = 3.5, pointsize = 12)
  plot(err.v ~ leak.m.tot, data = leak.tot, pch = 1, col = 'black', type = 'n', xlab = 'Leak mass (g)', ylab = 'Volumetric error (mL)')
  abline(v = dlt)
  abline(h = 0, lty = 2)
  abline(v = 0, lty = 2)
  text(leak.tot$leak.m.tot, leak.tot$err.v, leak.tot$id, cex = 0.8)
  text(-0.06, 855, '(b)')

  points(wat.tot$mass.loss.tot, rnorm(length(wat.tot$mass.loss.tot), 600, 20), pch = 1, col = 'gray45')

dev.off()

  
pdf('../plots/il_tot_leak_eval.pdf', height = 3.5, width = 3.5, pointsize = 12)
  par(mfrow = c(1, 1), mar = c(4, 4, 1, 1), mgp = c(2.5, 1, 0))
 
  plot(err.v ~ vCH4.leak, data = leak.tot, pch = 1, col = 'black', type = 'n', xlab = 'Calc. leakage (mL)', ylab = 'Volumetric error (mL)', asp = 1)
  abline(0, 1)
  abline(h = 0, lty = 2)
  dd <- subset(leak.tot, leak.m.tot <= dlt)
  text(dd$vCH4.leak, dd$err.v, dd$id, cex = 0.8, col = 'gray45')
  dd <- subset(leak.tot, leak.m.tot > dlt)
  text(dd$vCH4.leak, dd$err.v, dd$id, cex = 0.8, font = 2)
dev.off()

pdf('../plots/il_tot_leak_eval_pct.pdf', height = 3.5, width = 3.5, pointsize = 12)
  plot(rel.err.v ~ pct.leak, data = leak.tot, pch = 1, col = 'black', type = 'n', xlab = 'Calc. leakage (%)', ylab = 'Volumetric error (%)', asp = 1)
  abline(0, 1)
  abline(h = 0, lty = 2)
  dd <- subset(leak.tot, leak.m.tot <= dlt)
  text(dd$pct.leak, dd$rel.err.v, dd$id, cex = 0.6, col = 'gray45')
  dd <- subset(leak.tot, leak.m.tot > dlt)
  text(dd$pct.leak, dd$rel.err.v, dd$id, cex = 0.6)
dev.off()


