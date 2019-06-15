# Export tables

# Leaks
write.csv(leaks, '../output/leaks.csv', row.names = FALSE)

# Cum biogas
write.csv(cbg.gdt, '../output/cbg_gdt.csv', row.names = FALSE)
write.csv(cbg.gdt, '../output/cbg_gdt_hc.csv', row.names = FALSE)

# BMP
write.csv(BMP, '../output/BMP.csv', row.names = FALSE)
write.csv(BMPo, '../output/BMPo.csv', row.names = FALSE)
write.csv(yld, '../output/yld.csv', row.names = FALSE)


