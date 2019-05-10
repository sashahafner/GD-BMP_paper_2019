# Export results

write.csv(cbg.vol, '../output/cbg.vol.csv', row.names = FALSE)
write.csv(cbg.man, '../output/cbg.man.csv', row.names = FALSE)
write.csv(cbg.grav, '../output/cbg.grav.csv', row.names = FALSE)
write.csv(cbg.gdt, '../output/cbg.gdt.csv', row.names = FALSE)
write.csv(cbg.gdv, '../output/cbg.gdv.csv', row.names = FALSE)

write.csv(BMP, '../output/BMP.csv', row.names = FALSE)
write.csv(BMPo, '../output/BMPo.csv', row.names = FALSE)
write.csv(yld, '../output/yld.csv', row.names = FALSE)
write.csv(yldo, '../output/yldo.csv', row.names = FALSE)

write.csv(leaks, '../output/leaks.csv', row.names = FALSE)
write.csv(leaks.tot, '../output/leaks_tot.csv', row.names = FALSE)
