# Look at some things

table(cbg.comb$cvBg.grav > 500, abs(cbg.comb$aerr1) < 0.05)
table(cbg.comb$cvBg.grav > 500, abs(cbg.comb$aerr1) < 0.10)

table(cbg.comb$cvBg.grav > 1000, abs(cbg.comb$aerr1) < 0.05)
table(cbg.comb$cvBg.grav > 1000, abs(cbg.comb$aerr1) < 0.10)

21/24

BMPo$fv.inoc
mean(BMPo$fv.inoc)
median(BMPo$fv.inoc)

table(cbg.comb$id)
x <- subset(cbg.comb, id %in% c('I1', 'I2', 'I3'))
x$cvBg.grav
x$aerr1

x <- subset(cbg.vol, id %in% c('I1', 'I2', 'I3') & time.d > 20)
x$cvBg
x$cvBg/x$vol.hs
x$vol.hs

# significant digits
table(round(cbg.grav$massloss, 2))
median(round(cbg.grav$massloss, 2))
sum(cbg.grav$massloss >= 0.1)
mean(cbg.grav$massloss >= 0.1)

setup$m.tot1
range(setup$m.tot1)


# Total mass loss
as.data.frame(summarise(group_by(cbg.gdt, id), vsum = sum(vol), cvBg = max(cvBg), cmass.tot = max(cmass.tot)))
