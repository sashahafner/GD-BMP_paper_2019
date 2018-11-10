
# Models
leak.int$detect <- leak.int$leak.m > dli
mod1 <- glm(detect ~ pres.est + interval + dtime + id, data = leak.int)
summary(mod1)
coef(mod)
anova(mod1)

mod <- lm(leak.m ~ interval + dtime + id, data = leak.int)
summary(mod)
coef(mod)
anova(mod)



