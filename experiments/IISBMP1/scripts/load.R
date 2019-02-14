# Reads in data

fp <- '../data/biogas_and_setup.xlsx'
setup <- as.data.frame(read_xlsx(fp, sheet = 1, skip = 1))
biogas  <- as.data.frame(read_xlsx(fp, sheet = 2, skip = 1))
comp <- as.data.frame(read.csv('../data/comp.csv'))
