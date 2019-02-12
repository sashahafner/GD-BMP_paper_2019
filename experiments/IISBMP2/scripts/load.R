# Reads in data

ff <- '../data/biogas_and_setup.xlsx'
setup <- as.data.frame(read_xlsx(ff, sheet = 1, skip = 1))
biogas  <- as.data.frame(read_xlsx(ff, sheet = 2, skip = 1))
