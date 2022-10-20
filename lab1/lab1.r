# Чтение данных
data_X = scan(file="./data/X_3.txt", what=double(), sep="")
data_y = scan(file="./data/Y_3.txt", what=double(), sep="")

#график
plot(data_X, data_y, col="blue", type="p", pch=16, xlab='x', ylab='y')

# находим коэффициенты уравнения регрессии
model_regression = lm(formula = data_y ~ data_X)

model_regression

# строим линию регрессии
abline(model_regression, col="red", lwd="3", add=TRUE)