bgp1 <- merge(bgp1, setup1)
bgm1 <- merge(bgm1, setup1)

pdf('../plots/biogas_grav1.pdf', height = 4, width = 6)
  ggplot(data = bgm1, aes(ctime, cvBg, group = id, colour = descrip)) + geom_line() + geom_point() + labs(x = 'Time (d)', y = 'Cum. biogas (mL) (grav.)', colour = 'Description')
  ggplot(data = bgm1, aes(ctime, cvCH4, group = id, colour = descrip)) + geom_line() + geom_point() + labs(x = 'Time (d)', y = 'Cum. methane (mL) (grav.)', colour = 'Description')
  ggplot(data = bmp1mr, aes(ctime, I(log10(rrvCH4)), group = id, colour = descrip)) + geom_step(direction = 'vh') + labs(x = 'Time (d)', y = 'Log(10) rel. rate methane prod. (% of cum. per d)', colour = 'Description')
  ggplot(data = bmp1ma, aes(ctime, cvCH4, group = id, colour = descrip)) + geom_line() + geom_point() + labs(x = 'Time (d)', y = 'BMP (mL/g)', colour = 'Description')
dev.off()
