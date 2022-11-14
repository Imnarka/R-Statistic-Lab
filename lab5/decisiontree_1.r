data <- read.csv("D:/R-4.2.1/labs/lab5/data.csv", header = FALSE, sep=",")
data <- data[,1:11]

dims = dim(data)
n = dims[1]
m = dims[2]

colnames(data)<-c('class','P1','P2','P3','P4','P5','P6','P7','P8','P9','P10') 
data
n_train = 110
round(prop.table(table(data[1]))*100, digits = 1)


set.seed(1234567) # Псевдослучайное число
data_mixed=data[order(runif(n)),] 
train_data = data_mixed[1:n_train,]
train_data_labels = train_data[,1]
train_data_labels<-factor(train_data_labels,levels=c(1,2,3,4),labels=c("1","2","3","4"))

round(prop.table(table(train_data_labels))*100, digits = 1)

test_data = data_mixed[(n_train+1):n, ]
test_data_labels = test_data[,1]

library(rpart)
# Построим дерево
my_tree <- rpart(class ~ P1+P2+P3+P4+P5+P6+P7+P8+P9+P10,
                 method="class",
                 data=train_data)
plot(my_tree)
text(my_tree, cex = 1.2,
     all = FALSE, use.n = FALSE)
summary(my_tree)
test_data <- test_data[,2:11]
data_pred <- predict(my_tree,
                      test_data,
                      type="class")

library("gmodels")
CrossTable(x = test_data_labels, y = data_pred, prop.chisq=FALSE)
           