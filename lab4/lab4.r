data<-read.csv("D:/R-4.2.1/labs/lab4/data.csv", header=FALSE)
data<-data[,2:28]

library('factoextra')

fviz_nbclust(data, kmeans, method = "wss") 
set.seed(1)

km <- kmeans(data, centers = 4)
km
fviz_cluster(km, data = data)
km$withinss
