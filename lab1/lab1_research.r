data<-read.csv("D:/R-4.2.1/labs/lab1/data/CASP.csv")
data

data_X<-data[0:76,'F1']
data_y<-data[0:76,'F2']

plot(data_X, data_y, col='blue', type='p', pch=16, xlab='F1', ylab='F2')

model_regression <- lm(formula = data_y ~ data_X)
model_regression

abline(model_regression, col="red", lwd="3", add=TRUE)


X_test<-data[80:90, 'F1']
y_predict<-predict(model_regression, data.frame(data_X=X_test), level=0.9, interval = 'confidence')


y_predict<-y_predict[,1]
points(X_test, y_predict,col="green",type="p",pch=16,add=TRUE)

summary(model_regression)

r_correl = cor(data_X, data_y)
r_correl

n = length(data_X)
t=r_correl/sqrt(1-r_correl^2)*sqrt(length(data_X)-2)
t
