# Tests for new functions

library(biogas)
source('gdComp.R')

# Get some non-exported functions from biogas package
checkArgClassValue <- biogas:::checkArgClassValue
unitConvert <- biogas:::unitConvert
watVap <- biogas:::watVap

# Check total biogas volume for 1 g mass loss with xCH4 = 0.65
args(mass2vol)
vv <- mass2vol(1, xCH4 = 0.65, temp = 20, pres = 1, value = 'all')[1, 1]
vv

# Convert to non-standardized volume
vv <- vv/stdVol(1, temp = 20, pres = 1)
vv

# Test gdComp() (expect 0.65)
args(gdComp)
gdComp(1, vv, temp = 20, pres = 1) 
