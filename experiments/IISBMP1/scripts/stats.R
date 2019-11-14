# Comparison of methods

# First approach
BMPo$method <- factor(BMPo$method)
BMPo$method <- relevel(BMPo$method, ref = 'grav')
BMPo$descrip <- factor(BMPo$descrip)
BMPo$id <- factor(BMPo$id)
mod <- aov(cvCH4 ~ descrip + method + id, data = BMPo)
print(summary(mod))
print(summary(glht(mod, linfct = mcp(method = 'Dunnett'))))
print(TukeyHSD(mod, 'method'))
print(model.tables(mod), type = 'means')

# Second, simpler, more powerful approach
x <- BMPo[BMPo$method %in% c('gdt', 'grav'), c('method', 'id', 'cvCH4')]
BMPow <- spread(x, method, cvCH4)
BMPow$res <- log10(BMPow$gdt/BMPow$grav)
t.test(BMPow$res)
