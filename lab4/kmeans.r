data=scan("D:/R-4.2.1/labs/lab4/seeds_dataset.txt")
length(data)

M=7
# Преобразуем прочитанный одномерный массив в матрицу
matr_data=matrix(data,ncol=M,byrow=TRUE)

# Создадим 3 кластера
k=3
seeds_clusters <- kmeans(matr_data[,1:M], k)
# Посмотрим, что получилось
seeds_clusters
