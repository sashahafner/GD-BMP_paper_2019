# Calculate leakage from biogas bottles
which(is.na(biogas$mass.init))
which(is.na(biogas$mass.final))

# Add leakage info
leaks <- biogas:::massLoss(biogas, time.name = 'time.d', m.pre.name = 'mass.init', m.post.name = 'mass.final',
                   id.name = 'id')

# Extract total trial leakage info (last observation)
leaks.tot <- leaks[leaks$time.d > 30, ] 

# Logical leakage variables
leaks$leaked <- leaks$mass.leak > detect.lim.int
leaks.tot$leaked <- leaks.tot$cmass.leak > detect.lim.tot

# Find bottles that leaked
id.leak <- unique(leaks[leaks$leaked, 'id']) 
id.leak.tot <- unique(leaks.tot[leaks.tot$leaked, 'id']) 
