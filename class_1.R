library(ggplot2)
library(data.table)

# Effectiveness
eff <- c(3.67, 3.14, 3.22, 4.38, 4.5, 4.69, 2.93, 3.28, 4.03,
         2.82, 3.04, 3.18, 3.82, 3.97, 4.13, 3.28, 3.47, 3.36, 
         2.79, 4.1, 4.13, 2.85, 2.39, 2.35, 2.79, 
         2.76, 3.24, 3.79, 3.88, 3.79, 3.89, 3.43, 2.83)

# Ease of implementation
ease <- c(3.4, 2.18, 3.4, 3.56, 4.21, 3.35, 3.11, 4.06, 4.01, 3.61, 3.14,
          2.63, 2.82, 2.76, 2.67, 2.4, 3.13, 2.42, 2.54, 2.94, 4, 2.36,
          2.04, 2.36, 3.01, 2.83, 2.68, 3.36, 2.81, 3.88, 2.82,
          3.69, 3.14)

# Type
type <- c(rep('S', 12), rep('P', 11), rep('R', 10))

# Importance
imp <- c(1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1,
         0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0)

dt <- data.table(type = type, eff = eff, ease = ease, imp = imp)

# Very strong correlation between effectiveness and ease
cor(df$eff, df$ease)
cor.test(dt$imp, dt$eff)
cor.test(dt$imp, dt$ease)
ggplot(dt, aes(ease, eff)) + geom_point(aes(col = type)) + geom_smooth(method = 'lm')

ggplot(dt, aes(as.logical(imp), eff)) + geom_boxplot()
ggplot(dt, aes(as.logical(imp), ease)) + geom_boxplot()
