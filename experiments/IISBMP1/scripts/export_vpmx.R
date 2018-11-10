# Exports measurements plus composition data

vpmx <- vpmx[order(vpmx$exper, vpmx$id, vpmx$sheet.order), ]
write.csv(vpmx, '../output/vpmx.csv', row.names = FALSE)

