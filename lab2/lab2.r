N = 50
M = 2
library(Hmisc)
data<-read.csv("D:/R-4.2.1/labs/lab1/data/CASP.csv", header = TRUE)
rcorr(as.matrix(data)) 
data_X<-data[0:N,c('F1', 'F6')]
data_y<-data[0:N,'F2']
X_test<-data_X[40:50,]

data_X

# Cоздадим вектор из единиц (как набор из N единиц)
odin=vector(length=N,mode='numeric')
odin = rep(1,N)

X_train = matrix(1 : (N*(M+1)),ncol=(M+1))

X_train[,1] = odin

for(i in 1:M) X_train[,i+1] = data_X[,i]
T1 = t(X_train)
T=T1%*%X_train

# Подключим библиотеку для работы с матрицами
library(MASS)

# Найдём обратную матрицу для Т
obr = ginv(T)

# Вычислим вектор Teta - вектор коэффициентов линейной модели
Teta=obr%*%T1%*%data_y
Teta=Teta[,1]
print(Teta)

odin=vector(length=11,mode='numeric')
odin = rep(1,11)

FINAL_MATRIX = matrix(1 : (11*(M+1)),ncol=(M+1))

FINAL_MATRIX[,1] = odin

for(i in 1:M) FINAL_MATRIX[,i+1] = X_test[,i]
T_q = t(FINAL_MATRIX)
y_pred=Teta%*%T_q
y_pred