# Calculate leakage from biogas bottles

# Add leakage info
leaks <- massLoss(biogas, time.name = 'time.d', m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   id.name = 'id')

# Extract total trial leakage info (last observation)
leaks.tot <- leaks[leaks$time.d > 20, ] 

# Logical leakage variables
leaks$leaked <- leaks$mass.leak > detect.lim.int
leaks.tot$leaked <- leaks.tot$cmass.leak > detect.lim.tot

# Total leakage
leaks.tot$leak.pct <- 100 * leaks.tot$cmass.leak/leaks.tot$cmass.tot
range(leaks.tot$leak.pct)
subset(leaks.tot, grepl('C', id))[, c('id', 'leaked', 'leak.pct')]

# Find bottles that leaked
id.leak <- unique(leaks[leaks$leaked, 'id']) 
id.leak.tot <- unique(leaks.tot[leaks.tot$leaked, 'id']) 
