# Export results

write.csv(cbg.vol, '../output/cbg_vol.csv', row.names = FALSE)
write.csv(cbg.man, '../output/cbg_man.csv', row.names = FALSE)
write.csv(cbg.grav, '../output/cbg_grav.csv', row.names = FALSE)
write.csv(cbg.gdt, '../output/cbg_gdt.csv', row.names = FALSE)
write.csv(cbg.gdv, '../output/cbg_gdv.csv', row.names = FALSE)

write.csv(BMP, '../output/BMP.csv', row.names = FALSE)
write.csv(BMPo, '../output/BMPo.csv', row.names = FALSE)
write.csv(BMP1p, '../output/BMP_1p3d.csv', row.names = FALSE)
write.csv(BMP.comp, '../output/BMP_comp.csv', row.names = FALSE)
write.csv(yld, '../output/yld.csv', row.names = FALSE)
write.csv(yldo, '../output/yldo.csv', row.names = FALSE)

write.csv(cbg.comb, '../output/cbg_comb.csv', row.names = FALSE)

write.csv(detect.limits, '../output/detect_lim.csv', row.names = FALSE)

write.csv(leaks, '../output/leaks.csv', row.names = FALSE)
write.csv(leaks.tot, '../output/leaks_tot.csv', row.names = FALSE)


