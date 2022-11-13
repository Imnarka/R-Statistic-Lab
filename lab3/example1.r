glassdata <- read.csv("D:/R-4.2.1/labs/lab3/Glass.csv", sep=",", header = FALSE)
glassdata <- glassdata[-1]
# Часть выборки, например, 150 записей, будем использовать как обучающую
# Сохраним объём всей выборки и объём обучающей выборки в переменных
n_data = 213
n_train = 150
# Обучающая выборка должна быть репрезентативной -
# т.е. каждый класс должен быть представлен в ней в той же пропорции, что и во всей выборке.
# Подсчитаем частоты встречаемости классов в исходной # выборке
# (выразим эти частоты в %, округлив результат до десятых)
# NB! Теперь номер класса содержится в 10-ом столбце!
round(prop.table(table(glassdata[10]))*100, digits = 1)
# Чтобы обеспечить репрезентативность выборки, перемешаем её
set.seed(12345)
glassdata_mixed=glassdata[order(runif(n_data)),]
# Выберем обучающую выборку
train_data = glassdata_mixed[1:n_train,]
# Сохраним номера классов для строк обучающей выборки
train_data_labels = train_data[,10]
# Перед вызовом метода knn удалим номера классов из train_data
# Подсчитаем частоту присутствия каждого класса в обучающей выборке и сравним с соответствующими частотами в исходной выбоке
round(prop.table(table(train_data[10]))*100, digits = 1)
# Оставшуюся часть "перемешанной выборки" будем использовать
# как тестовую выборку
test_data = glassdata_mixed[(n_train+1):n_data, ]
test_data_labels = test_data[,10]
# Удалим из обучающей и тестовой выборок столбец с номерами классов
train_data = train_data[-10]
test_data = test_data[-10]
# Подключим пакет class
library("class")
data_test_pred <- knn(train = train_data,
                      test = test_data,
                      cl = train_data_labels,
                      k = round(sqrt(n_train)))
# Вызовем метод knn для тестовых данных
# Результат (номера классов) запишем в вектор data_test_pred
# Для оценки качества прогноза подключим библиотеку gmodels
library("gmodels")
# и построим кросс-валидационную таблицу:
CrossTable(x = test_data_labels, y = data_test_pred, prop.chisq=FALSE)