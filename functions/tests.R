# Tests for new functions

options(width = 70)

library(biogas)
source('gdComp.R')
source('massLoss.R')
source('cumBgGD.R')

# Get some non-exported functions from biogas package
checkArgClassValue <- biogas:::checkArgClassValue
unitConvert <- biogas:::unitConvert
watVap <- biogas:::watVap

# Check total biogas volume for 1 g mass loss with xCH4 = 0.65
args(mass2vol)
vv <- mass2vol(0.1, xCH4 = 0.65, temp = 20, pres = 1, value = 'all')[1, 1]
vv

# Test gdComp() (expect 0.65)
args(gdComp)
gdComp(0.1, vv, temp = 20, pres = 1) 

# Vectorized call
mm <- 0.5 + 0:10/5
vv <- 1000
xx <- gdComp(mm, vv, temp = 20, pres = 1) 
xx
plot(mm, xx)

# cumBgGD()

85.035/stdVol(1, temp = 20, pres = 1)
set.seed(123)
dat <- data.frame(id = 'a', time = 1:10, 
                  m.init = c(100, 100 - 0:8/10 + round(rnorm(9, 0.01, sd = 0.01), 2)), 
                  m.final = c(100, 100 - 1:9/10 + round(rnorm(9, 0.01, sd = 0.01), 2)),  
                  vol = 93.424)
dat$vol[1] <- 0
# Create a leak
dat$m.init[5] <- dat$m.init[5] - 0.08
dat$vol[5] <- dat$vol[5] * (1 - 0.08/0.1)
dat
massLoss(dat, time.name = 'time', m.pre.name = 'm.init', m.post.name = 'm.final', id.name = 'id')

# Add a second (identical) bottle
dat2 <- dat
dat2$id <- 'b'
dat <- rbind(dat, dat2)

# cumBgGD()
# Default options, using vented volume (that is all that is measured), venting mass loss, interval values
cp1 <- cumBgGD(dat, temp = 20, pres = 1, m.pre.name = 'm.init', m.post.name = 'm.final')
# Use total mass loss instead of vented (less accurate here because of leak)
cp2 <- cumBgGD(dat, temp = 20, pres = 1, m.pre.name = 'm.init', m.post.name = 'm.final', vented.mass = FALSE)
# Back to venting mass loss, but cumulative values here
# Notice how xCH4 stabilizes
cp3 <- cumBgGD(dat, temp = 20, pres = 1, m.pre.name = 'm.init', m.post.name = 'm.final', averaging = 'cumulative')
# Can also use total/final values (constant xCH4 per bottle)
cp4 <- cumBgGD(dat, temp = 20, pres = 1, m.pre.name = 'm.init', m.post.name = 'm.final', averaging = 'final')
# NTS: Would be good to use some generated data to show these options. . .
# Can also get grav results instead of vol
cp5 <- cumBgGD(dat, temp = 20, pres = 1, m.pre.name = 'm.init', m.post.name = 'm.final', averaging = 'final', vmethod = 'grav')

plot(xCH4 ~ time, data = cp1, type = 'b', subset = id == 'a')
plot(xCH4 ~ time, data = cp2, type = 'b', subset = id == 'a')
plot(xCH4 ~ time, data = cp3, type = 'b', subset = id == 'a')
plot(xCH4 ~ time, data = cp4, type = 'b', subset = id == 'a')
plot(xCH4 ~ time, data = cp5, type = 'b', subset = id == 'a')
plot(vCH4 ~ time, data = cp4, type = 'b', subset = id == 'a')
plot(vCH4 ~ time, data = cp5, type = 'b', subset = id == 'a')
