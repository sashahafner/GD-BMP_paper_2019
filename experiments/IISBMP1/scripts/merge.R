# Add setup data to biogas data

bgp1 <- merge(bgp1, setup1, by = c('exper', 'id'))
bgm1 <- merge(bgm1, setup1, by = c('exper', 'id'))
bgp2 <- merge(bgp2, setup2, by = c('exper', 'id'))
bgm2 <- merge(bgm2, setup2, by = c('exper', 'id'))

bgm <- merge(bgm, setup, by = c('exper', 'id'))

