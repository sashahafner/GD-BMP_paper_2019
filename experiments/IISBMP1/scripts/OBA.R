# Makes input files

obg1 <- vpmx[vpmx$exper == 1 & !vpmx$id %in% c('B1', 'B2'), c('id', 'ctime', 'mass.final', 'xCH4')]
obg2 <- vpmx[vpmx$exper == 2, c('id', 'ctime', 'mass.final', 'xCH4')]

setup1 <- setup[setup$exper == 1 & !setup$id %in% c('B1', 'B2'), c('exper', 'id', 'descrip', 'substrate', 'm.inoc', 'm.sub.vs', 'vol.hs')]
setup2 <- setup[setup$exper == 2, c('exper', 'id', 'descrip', 'substrate', 'm.inoc', 'm.sub.vs', 'vol.hs')]

write.csv(obg1, '../output/OBA/biogas1.csv', row.names = FALSE)
write.csv(obg2, '../output/OBA/biogas2.csv', row.names = FALSE)

write.csv(setup1, '../output/OBA/setup1.csv', row.names = FALSE)
write.csv(setup2, '../output/OBA/setup2.csv', row.names = FALSE)


