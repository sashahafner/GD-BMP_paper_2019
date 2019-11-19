# Reads in data

# Note: Using measurements made with each lab's own inoculum, and standard ISR of 2 for SC
setupd <- as.data.frame(read_xlsx('../data/AMPTS_IIS_DBFZ_Inoc_DBFZ - DBFZ Biogas.xlsx', 
                                  sheet = 5, skip = 2, col_names = FALSE))
biogasd <- as.data.frame(read_xlsx('../data/AMPTS_IIS_DBFZ_Inoc_DBFZ - DBFZ Biogas.xlsx', 
                                  sheet = 6, skip = 0, col_names = TRUE))

setupt <- as.data.frame(read_xlsx('../data/Data submission TUM second trial revised - Konrad Koch.xlsx', 
                                  sheet = 5, skip = 2, col_names = FALSE))
biogast <- as.data.frame(read_xlsx('../data/Data submission TUM second trial revised - Konrad Koch.xlsx', 
                                  sheet = 6, skip = 0, col_names = TRUE))

names(setupd) <- names(setupt) <- c('id', 'substrate', 'isr', 'sub.isr', 'm.inoc', 'm.sub', 'm.sub.vs.rep')
names(biogasd)[1] <- names(biogast)[1] <- 'time.d'

biogast$time.d <- biogast$time.d/24

# Add TS/VS to setup and recalculate n.sub.vs based on mean VS conc.
tsvs <- data.frame(substrate = c('CEL', 'SC', 'SD'), c.vs = c(0.9931, 0.8135, 0.8680))

setupd <- merge(setupd, tsvs, by = 'substrate', all.x = TRUE)
setupt <- merge(setupt, tsvs, by = 'substrate', all.x = TRUE)

setupd$m.sub.vs <- setupd$m.sub * setupd$c.vs
setupt$m.sub.vs <- setupt$m.sub * setupt$c.vs
