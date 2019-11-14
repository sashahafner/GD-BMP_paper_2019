# Exploring data

# Check ratio of cvBg to headspace

x <- subset(cbg.comb, id %in% c('I1', 'I2', 'I3'))
x

x$cvBg.grav/x$vol.hs

# Total volumes
summarise(group_by(cbg.grav, id), vsum = sum(vol), cvBg = max(cvBg))

# Look at mass loss
table(round(cbg.gdt$mass.tot, 1))
median(round(cbg.gdt$mass.tot, 1))

# Total mass loss
summarise(group_by(cbg.gdt, id), vsum = sum(vol), cvBg = max(cvBg), cmass.tot = max(cmass.tot))

# Error in GDt
cbg.comb$aerr1
cbg.comb$aerr2

range(cbg.comb$aerr1)
range(cbg.comb$aerr2)

sort(cbg.comb$aerr1)
sort(cbg.comb$aerr2)

mean(abs(cbg.comb$aerr1) < 0.05)

setup$m.tot
range(setup$m.tot)

