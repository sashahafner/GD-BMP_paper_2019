# Reads in data

fp <- '../UQ2_man_grav.xlsx'
setup <- as.data.frame(read_xlsx(fp, sheet = 1, skip = 1))
biogas  <- as.data.frame(read_xlsx(fp, sheet = 2, skip = 1))
water  <- as.data.frame(read_xlsx(fp, sheet = 4, skip = 1))
