# Reads in data

ff <- '../data/biogas_and_setup.xlsx'
setup <- as.data.frame(read_xlsx(ff, sheet = 1, skip = 1))
biogas  <- as.data.frame(read_xlsx(ff, sheet = 2, skip = 1))

IISBMP2labs <- '../data/S2_BMP_summary_select.xlsx'
IISBMP2labs <- as.data.frame(read_xlsx(IISBMP2labs, sheet = 1, skip = 1))