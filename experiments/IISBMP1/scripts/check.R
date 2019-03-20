
# REmember to restart before calcaulating the gdComp() call as IIsBMP1 uses bar in biogas call which overwrite the kPa!!!!

# Load functions
source('functions.R')
# Load packages
source('packages.R')

# Check function
args(gdComp)
debug(gdComp)

# UQ2, 27d, L1
vol<- 19.1547544616042    # use of already standardized vBg
temp <- 30                # temp.grav
pres <- 150               # pres.grav
m <- 0.026299999999992    # total mass loss

# xCH4:
gdComp(m, vol, temp, pres, unit.temp = 'C', unit.pres = 'kPa' )


# UQ2, 27d, L1 - including standardization
vol.no.correction<- 21.1  # Measured biogas volume
temp <- 30                # temp.grav
temp.stand <- 20          # temp.vol
pres.stand <- 101.325     # pres.vol
pres <- 150               # pres.grav
m <- 0.026299999999992    # total mass loss

# Standardize volume
vol <- stdVol(vol.no.correction, temp.stand, pres.stand, rh = 1, 
              temp.std = getOption("temp.std", as.numeric(NA)), 
              pres.std = getOption("pres.std", as.numeric(NA)), 
              unit.temp = 'C',  
              unit.pres = 'kPa')
# xCH4:
gdComp(m, vol, temp, pres, unit.temp = 'C', unit.pres = 'kPa' )

#molMass('CH4')

# Check cumBg call: 
options(unit.pres = 'mbar', pres.std = 1013.25)

# Biogas by gd
biogas <- biogas[order(biogas$id, biogas$elapsed.time), ]
debug(cumBgGD)
cbg.gd3 <- cumBgGD(biogas,
                   temp.vol = 20, pres.vol = 1013.25,
                   temp.grav = 30, pres.grav = 1500,
                   id.name = 'id', vol.name = 'vol',
                   m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   comp.name = 'xCH4', time.name = 'elapsed.time',
                   vented.mass = FALSE, averaging = 'final', vmethod = 'grav',
                   # temp.init = 20,
                   # headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                   # extrap = FALSE
                   addt0 = TRUE, showt0 = TRUE)


bigas[, id] <- gdComp(mass = dat[, 'mass.tot'], vol = dat[, 'vBg'], temp = dat[, 'temp.grav'], 
                           pres = dat[, 'pres.grav'], unit.temp = 'C', unit.pres = 'mbar', fill.value = 0)