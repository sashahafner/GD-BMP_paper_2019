
# Load cumBgGD function
source('../../../functions/cumBgGD.R')

cbg.gd <- cumBgGD(biogas, 
               temp = 20, pres = 101.325, 
               id.name = 'id',vol.name = 'vol',
               m.pre.name = 'mass.init', m.post.name = 'mass.final',
               comp.name = 'xCH4', time.name = 'elapsed.time', 
               vented.mass = TRUE, averaging = 'int', 
               temp.init = 20, 
               headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
               extrap = TRUE, 
               addt0 = TRUE, showt0 = TRUE)


# function (dat, temp, pres, id.name = "id", time.name = "time", 
#           vol.name = "vol", m.pre.name, m.post.name, comp.name = "xCH4", 
#           vented.mass = TRUE, averaging = "int", temp.init = NULL, 
#           pres.init = NULL, rh.resid.init = 1, headspace = NULL, vol.hs.name = "vol.hs", 
#           headcomp = "N2", vmethod = "vol", imethod = "linear", extrap = FALSE, 
#           addt0 = TRUE, showt0 = TRUE, dry = FALSE, empty.name = NULL, 
#           std.message = TRUE, check = TRUE, temp.std = getOption("temp.std", 
#                                                                  as.numeric(NA)), pres.std = getOption("pres.std", as.numeric(NA)), 
#           unit.temp = getOption("unit.temp", "C"), unit.pres = getOption("unit.pres", 
#                                                                          "atm")) 
# 
cp2 <- cumBgGD(biogas, temp = 20, pres = 101.325, m.pre.name = 'mass.init', m.post.name = 'mass.final', vented.mass = FALSE)



cumBgGD(biogas, temp = 20, pres = 101.325,
        m.pre.name = 'mass.initial', m.post.name = 'mass.final', 
        comp.name = "xCH4", 
        vented.mass = TRUE, averaging = "int", temp.init = 20, 
        vol.hs.name = "vol.hs", 
        addt0 = FALSE, showt0 = FALSE, dry = FALSE, empty.name = NULL, 
        std.message = TRUE, check = TRUE) 

# OLD
cbg.gd <- cumBg(cbg.gd, dat.type = 'vol', temp = 20, pres = 101.325,
                data.struct = 'longcombo',
                id.name = 'id', time.name = 'elapsed.time',
                dat.name = 'vol', comp.name = 'xCH4',
                headspace = setup, vol.hs.name = 'vol.hs', headcomp = 'N2',
                showt0 = FALSE, temp.init = 20,
                addt0 = FALSE, extrap = TRUE) 

cp1 <- cumBgGD(biogas, temp = 20, pres = 1, m.pre.name = 'm.init', m.post.name = 'm.final')
