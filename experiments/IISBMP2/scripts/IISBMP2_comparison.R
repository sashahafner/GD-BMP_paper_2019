# Compare IISBMP2 study among lab

BMP.0.5p3d.gd03 <- subset(BMP.0.5p3d, method == 'gd03')
write.csv(BMP.0.5p3d.gd03, '../results/BMP.0.5p3d.gd03.csv', row.names = FALSE)
BMP.0.5p3d.gd03 <- BMP.0.5p3d.gd03[, c('descrip', 'mean', 'sd')]
BMP.0.5p3d.gd03 <- setNames(BMP.0.5p3d.gd03, c('descrip', 'mean.gd03', 'sd.gd03'))

interlab.dat <- IISBMP2labs[ , c('descrip', 'mean.lab', 'sd.lab')]

lab.comparison <- merge(BMP.0.5p3d.gd03, interlab.dat, by = 'descrip')

cellulose <- (max(lab.comparison$mean.gd03[1], lab.comparison$mean.lab[1]) - min(lab.comparison$mean.gd03[1], lab.comparison$mean.lab[1]))/max(lab.comparison$mean.gd03[1], lab.comparison$mean.lab[1])*100
subsC <- (max(lab.comparison$mean.gd03[2], lab.comparison$mean.lab[2]) - min(lab.comparison$mean.gd03[2], lab.comparison$mean.lab[2]))/max(lab.comparison$mean.gd03[2], lab.comparison$mean.lab[2])*100
subsD <- (max(lab.comparison$mean.gd03[3], lab.comparison$mean.lab[3]) - min(lab.comparison$mean.gd03[3], lab.comparison$mean.lab[3]))/max(lab.comparison$mean.gd03[3], lab.comparison$mean.lab[3])*100
diff.perc <- c(cellulose, subsC, subsD)
lab.comparison <- data.frame(lab.comparison, diff.perc)

write.csv(lab.comparison, '../results/lab.comparison.csv', row.names = FALSE)