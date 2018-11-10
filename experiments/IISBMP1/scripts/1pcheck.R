
# Check rates
bsm <- summBg(bgm, setup, id.name = 'id', time.name = 'ctime',
             descrip.name = 'descrip', 
             inoc.name = 'Inoculum', inoc.m.name = 'm.inoc',
             norm.name = 'm.sub.vs', 
             vol.name = 'cvCH4',
             when = '1p',
             show.obs = TRUE,
             sort = TRUE)

print(bsm[bsm$id == 'B3', c('id', 'ctime', 'rrvCH4')])
print(bsm[bsm$id == 'A1', c('id', 'ctime', 'rrvCH4')])
print(bsm[bsm$id == 'A2', c('id', 'ctime', 'rrvCH4')])
print(bsm[bsm$id == 'A3', c('id', 'ctime', 'rrvCH4')])

bsm <- bsm[order(bsm$id, bsm$ctime), ]
print(bsm[bsm$ctime > 19, c('id', 'ctime', 'rrvCH4')])
# Everything < 1% for at least last two times


