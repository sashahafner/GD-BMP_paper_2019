# Export tables
write.csv(cbg.vol, '../output/cbg.vol.csv', row.names = FALSE)
write.csv(cbg.man, '../output/cbg.man.csv', row.names = FALSE)
write.csv(cbg.grav, '../output/cbg.grav.csv', row.names = FALSE)
#write.csv(cbg.gd, '../output/cbg.gD.csv', row.names = FALSE)
write.csv(cbg.all, '../output/cbg.all.csv', row.names = FALSE)

write.csv(BMP2, '../output/BMP.csv', row.names = FALSE)
write.csv(BMPo2, '../output/BMPo.csv', row.names = FALSE)
write.csv(yld2, '../output/yld.csv', row.names = FALSE)


# write.csv(BMP.all, '../output/BMP.all.csv', row.names = FALSE)
# write.csv(BMPo.all, '../output/BMPo.all.csv', row.names = FALSE)
# write.csv(yld.all, '../output/yld.all.csv', row.names = FALSE)

write.csv(leaks, '../output/leak.csv', row.names = FALSE)
