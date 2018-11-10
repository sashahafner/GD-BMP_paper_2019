
png('../plots/grav_v_man_2.png', height = 700, width = 700, pointsize = 26)
  d <- bg2
  plot(I(cvCH4.m/1000) ~ I(cvCH4.p/1000), data = d, cex = 2, xlab = expression('Manometric'~CH[4]~(L)),
       ylab = expression('Gravimetric'~CH[4]~(L)), asp = 1)
  text(d$cvCH4.p/1000, d$cvCH4.m/1000, d$id, cex = 0.5, col = 'gray45')
  abline(0, 1, lwd = 3, col = 'blue')
  abline(0, 1.1, col = 'blue')
  abline(0, 0.9, col = 'blue')
dev.off()

pdf('../plots/methods.pdf', height = 5, width = 5)

  i <- 0
  for(d in list(bg1, bg2)) {
    i <- i + 1

    # m to p
    plot(cvCH4.m ~ cvCH4.p, data = d, cex = 2, main = i)
    abline(0, 1)
    abline(0, 1.1)
    abline(0, 0.9)
    text(d$cvCH4.p, d$cvCH4.m, d$id, cex = 0.7, col = 'darkred')

    plot(vCH4.m ~ vCH4.p, data = d, cex = 2, main = i)
    abline(0, 1)
    abline(0, 1.1)
    abline(0, 0.9)
    text(d$vCH4.p, d$vCH4.m, d$id, cex = 0.7, col = 'darkred')
    
    plot(vCH4.m ~ vCH4.p, data = d, cex = 2, col = 'gray55', main = i)
    abline(0, 1)
    abline(0, 1.1)
    abline(0, 0.9)
    text(d$vCH4.p, d$vCH4.m, d$ctime, cex = 0.7, col = 'darkred')
    
    #ddd <- d[d$ctime > 30, ]
    #plot(cvCH4.m ~ cvCH4.p, data = ddd, main = 'Final', cex = 2)
    #abline(0, 1)
    #abline(0, 1.1)
    #abline(0, 0.9)
    #text(ddd$cvCH4.p, ddd$cvCH4.m, substring(ddd$id, 1, 1), cex = 0.7, col = 'darkred')

    # v to p
    plot(cvCH4.v ~ cvCH4.p, data = d, cex = 2, main = i)
    abline(0, 1)
    abline(0, 1.1)
    abline(0, 0.9)
    text(d$cvCH4.p, d$cvCH4.v, d$id, cex = 0.7, col = 'darkred')

    plot(vCH4.v ~ vCH4.p, data = d, cex = 2, main = i)
    abline(0, 1)
    abline(0, 1.1)
    abline(0, 0.9)
    text(d$vCH4.p, d$vCH4.v, d$id, cex = 0.7, col = 'darkred')
    
    plot(vCH4.v ~ vCH4.p, data = d, cex = 2, col = 'gray55', main = i)
    abline(0, 1)
    abline(0, 1.1)
    abline(0, 0.9)
    text(d$vCH4.p, d$vCH4.v, d$ctime, cex = 0.7, col = 'darkred')
    
    #ddd <- d[d$ctime > 30, ]
    #plot(cvCH4.v ~ cvCH4.p, data = ddd, main = 'Final', cex = 2)
    #abline(0, 1)
    #abline(0, 1.1)
    #abline(0, 0.9)
    #text(ddd$cvCH4.p, ddd$cvCH4.v, substring(ddd$id, 1, 1), cex = 0.7, col = 'darkred')

    # m to v
    plot(cvCH4.m ~ cvCH4.v, data = d, cex = 2, main = i)
    abline(0, 1)
    abline(0, 1.1)
    abline(0, 0.9)
    text(d$cvCH4.v, d$cvCH4.m, d$id, cex = 0.7, col = 'darkred')

    plot(vCH4.m ~ vCH4.v, data = d, cex = 2, main = i)
    abline(0, 1)
    abline(0, 1.1)
    abline(0, 0.9)
    text(d$vCH4.v, d$vCH4.m, d$id, cex = 0.7, col = 'darkred')
    
    plot(vCH4.m ~ vCH4.v, data = d, cex = 2, col = 'gray55', main = i)
    abline(0, 1)
    abline(0, 1.1)
    abline(0, 0.9)
    text(d$vCH4.v, d$vCH4.m, d$ctime, cex = 0.7, col = 'darkred')
    
    #ddd <- d[d$ctime > 30, ]
    #plot(cvCH4.m ~ cvCH4.v, data = ddd, main = 'Final', cex = 2)
    #abline(0, 1)
    #abline(0, 1.1)
    #abline(0, 0.9)
    #text(ddd$cvCH4.v, ddd$cvCH4.m, substring(ddd$id, 1, 1), cex = 0.7, col = 'darkred')
  }

dev.off()

pdf('../plots/biogas.pdf', height = 4, width = 6)

  for(d in list(bgm1, bgm2)) {

    print(ggplot(data = d, aes(ctime, vBg, group = id, colour = descrip)) + geom_line() + geom_point())
    print(ggplot(data = d, aes(ctime, xCH4.oa, group = id, colour = descrip)) + geom_line() + geom_point())
    print(ggplot(data = d, aes(ctime, xCH4, group = id, colour = descrip)) + geom_line() + geom_point())
    print(ggplot(data = d, aes(ctime, cvBg, group = id, colour = descrip)) + geom_line() + geom_point())
    print(ggplot(data = d, aes(ctime, cvCH4, group = id, colour = descrip)) + geom_line() + geom_point())
    print(ggplot(data = d, aes(ctime, rvBg, group = id, colour = descrip)) + geom_line() + geom_point())

  }

    print(ggplot(data = bmp1ma, aes(ctime, cvCH4, group = id, colour = descrip)) + geom_line() + geom_point())
    print(ggplot(data = bmp2ma, aes(ctime, cvCH4, group = id, colour = descrip)) + geom_line() + geom_point())
dev.off()

pdf('../plots/rel_rates.pdf', height = 4, width = 6)

  for(d in list(bmp1mr, bmp2mr)) {
    print(ggplot(data = d, aes(ctime, I(log10(rrvCH4)), group = id, colour = descrip)) + geom_step(direction = 'vh') + labs(x = 'Time (d)', y = 'Log(10) rel. rate methane prod. (% of cum. per d)', colour = 'Description'))
    print(ggplot(data = subset(d, descrip == 'Cellulose'), aes(ctime, I(log10(rrvCH4)), group = id, colour = id)) + geom_step(direction = 'vh') + labs(x = 'Time (d)', y = 'Log(10) rel. rate methane prod. (% of cum. per d)', colour = 'Description'))
  }
dev.off()
