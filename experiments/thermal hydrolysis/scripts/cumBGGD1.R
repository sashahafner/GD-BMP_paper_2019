
# Load cumBgGD function
source('../../../functions/cumBgGD.R')



cumBgGD(biogas, temp = 20, pres = 101.325,
        vol.name = "vol", m.pre.name = 'mass.initial', m.post.name = 'mass.final', comp.name = "xCH4", 
        comp = comp,
        vented.mass = TRUE, averaging = "int", temp.init = 20, 
        headspace = setup, vol.hs.name = "vol.hs", 
        headcomp = "N2", vmethod = "vol", imethod = "linear", extrap = TRUE, 
        addt0 = FALSE, showt0 = FALSE, dry = FALSE, empty.name = NULL, 
        std.message = TRUE, check = TRUE) 


cbg.gd <- cumBg(cbg.gd, dat.type = 'vol', temp = 20, pres = 101.325,
                data.struct = 'longcombo',
                id.name = 'id', time.name = 'elapsed.time',
                dat.name = 'vol', comp.name = 'xCH4',
                headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                showt0 = FALSE, temp.init = 20,
                addt0 = FALSE, extrap = TRUE) 

cp1 <- cumBgGD(biogas, temp = 20, pres = 1, m.pre.name = 'm.init', m.post.name = 'm.final')
