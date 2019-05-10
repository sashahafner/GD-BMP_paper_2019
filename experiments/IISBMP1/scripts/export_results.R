# Export results

write.csv(cbg.vol, '../output/cbg_vol.csv', row.names = FALSE)
write.csv(cbg.man, '../output/cbg_man.csv', row.names = FALSE)
write.csv(cbg.grav, '../output/cbg_grav.csv', row.names = FALSE)
write.csv(cbg.gdt, '../output/cbg_gdt', row.names = FALSE)
write.csv(cbg.gdv, '../output/cbg_gdv', row.names = FALSE)
write.csv(cbg.gdi, '../output/cbg_gdi', row.names = FALSE)

write.csv(BMP, '../output/BMP.csv', row.names = FALSE)
write.csv(BMPo, '../output/BMPo.csv', row.names = FALSE)
write.csv(yld, '../output/yld.csv', row.names = FALSE)
write.csv(yldo, '../output/yldo.csv', row.names = FALSE)

write.csv(leaks, '../output/leaks.csv', row.names = FALSE)
write.csv(leaks.tot, '../output/leaks_tot.csv', row.names = FALSE)
