# Export results

# Get final results 
cbg <- ddply(cbg, 'id', mutate, 
             time.d.end = max(time.d)
             )
cbg.end <- subset(cbg, time.d == time.d.end)

write.csv(cbg, '../output/cum_biogas.csv', row.names = FALSE)
write.csv(cbg.end, '../output/cum_biogas_end.csv', row.names = FALSE)
