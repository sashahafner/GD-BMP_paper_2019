# Reads in data

dat <- '../data/BMP2.xlsx'
setup <- as.data.frame(read_xlsx(dat, sheet = 1, skip = 1))
meas  <- as.data.frame(read_xlsx(dat, sheet = 2, skip = 1))
comp  <- as.data.frame(read_xlsx(dat, sheet = 3, skip = 1))


# Why not use read_xlsx? Should it be a data frame?