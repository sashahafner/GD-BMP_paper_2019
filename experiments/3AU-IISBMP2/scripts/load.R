# Reads in data

ff <- '../data/biogas_and_setup.xlsx'
setup <- as.data.frame(read_xlsx(ff, sheet = 1, skip = 1))
biogas  <- as.data.frame(read_xlsx(ff, sheet = 2, skip = 1))

# Add TS/VS to setup and recalculate n.sub.vs based on mean VS conc.
tsvs <- data.frame(substrate = c('CEL', 'SC', 'SD'), c.vs = c(0.9931, 0.8135, 0.8680))

setup <- merge(setup, tsvs, by = 'substrate', all.x = TRUE)
setup$m.sub.vs <- setup$m.sub * setup$c.vs
