# Check water control mass

watmass <- vpm[grepl('^[W]', vpm$id), ]
watmass <- ddply(watmass, c('exper', 'id'), transform, change = c(NA, 1000*(diff(mass.init))))
watmass <- watmass[order(watmass$exper, watmass$id), ]

write.csv(watmass, '../output/water_mass.csv', row.names = FALSE)


