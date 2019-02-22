# Export tables
write.csv(cbg.gd, '../output/cbg.man.csv', row.names = FALSE)

write.csv(BMP, '../output/BMP.csv', row.names = FALSE)
write.csv(BMPo, '../output/BMPo.csv', row.names = FALSE)
write.csv(yld, '../output/yld.csv', row.names = FALSE)

write.csv(leaks, '../output/leak.csv', row.names = FALSE)