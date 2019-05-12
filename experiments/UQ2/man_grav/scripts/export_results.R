# Export results

write.csv(cbg.man, '../output/cbg_man.csv', row.names = FALSE)
write.csv(cbg.grav, '../output/cbg_grav.csv', row.names = FALSE)

write.csv(BMP, '../output/BMP.csv', row.names = FALSE)
write.csv(BMPo, '../output/BMPo.csv', row.names = FALSE)
write.csv(yld, '../output/yld.csv', row.names = FALSE)
write.csv(yldo, '../output/yldo.csv', row.names = FALSE)

write.csv(leaks, '../output/leak.csv', row.names = FALSE)
