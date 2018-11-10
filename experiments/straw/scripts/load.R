# Reads in data

ff <- '../data/straw_TSR1.xlsx'
setup <- as.data.frame(read_xlsx(ff, sheet = 1, skip = 1))
pres  <- as.data.frame(read_xlsx(ff, sheet = 2, skip = 1))
mass  <- as.data.frame(read_xlsx(ff, sheet = 3, skip = 1))
comp  <- as.data.frame(read_xlsx(ff, sheet = 4, skip = 1))
