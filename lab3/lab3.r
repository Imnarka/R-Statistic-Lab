data<-read.csv("D:/R-4.2.1/labs/lab3/data.csv", sep=",", header = FALSE)

n_data = 197
n_train = 150

round(prop.table(table(data[2]))*100, digits = 1)
# Чтобы обеспечить репрезентативность выборки, перемешаем её
set.seed(12345)
data<-data[order(runif(n_data)),]
data
# Выберем обучающую выборку
train_data<-data[1:n_train,]

# Сохраним номера классов для строк обучающей выборки
train_data_labels = train_data[,1]



# Перед вызовом метода knn удалим номера классов из train_data
# Подсчитаем частоту присутствия каждого класса в обучающей выборке
# и сравним с соответствующими частотами в исходной выбоке
round(prop.table(table(train_data[1]))*100, digits = 1)
# Оставшуюся часть измененной выборки будем использовать как тестовую выборку
test_data = data[(n_train+1):n_data, ]
test_data_labels = test_data[,1]
# Удалим из обучающей и тестовой выборок столбец с номерами классов
train_data = train_data[-1]
test_data = test_data[-1]
library("class")
data_test_pred <- knn(train = train_data,
                      test = test_data,
                      cl = train_data_labels,
                      k = round(sqrt(n_train)))
library("gmodels")
CrossTable(x = test_data_labels, y = data_test_pred, prop.chisq=FALSE)
