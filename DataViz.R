#Using Base Graphics
#Bivariate Scatter plots

personid<-c(1,2,3,4,5)
personwt<-c(30,40,45,52,61)
person<-data.frame(personid,personwt)
plot(person)

#Scatter plot B/w petal length and width
data("iris")
str(iris)
?plot
plot(x=iris$Petal.Length,y=iris$Petal.Width,
     main=c("Petal Length vs Petal Width"),
     xlab=c("Length of Petal"),
     ylab=c("Width of Petal"),
     col="red",pch=3,lwd=5)

#Using factor variable
plot(x=iris$Species,y=iris$Petal.Width,
     main=c("Species vs PEtal Width"),
     xlab="Species",
     ylab=c("Width of Petal"),
     col="red",pch=2,lwd=2)
     

plot(x=iris$Petal.Length,y=iris$Petal.Width,
     main=c("Petal Length vs Petal Width"),
     xlab=c("Length of Petal"),
     ylab=c("width of Petal"),
     col=iris$Species,pch=as.numeric(iris$Species),cex=as.numeric(iris$Species),lwd=2)

#Adding legends-PLaces a legend in the graph that has been previously run
?legend
legend("topleft",c("Setosa","Versicolor","Virginica"),pch=1:3,col=1:3)
legend(x=2,y=2,c("Setosa","Versicolor","Virginica"),pch=1:3,col=1:3)

#Dataframein plot
plot(iris)

#Multiple plots in a single window
par(mfrow=c(1,2))
plot(x=iris$Species,y=iris$Sepal.Width,
     xlab="Species",
     main="Sepal Width across Species",
     col="red")
plot(x=iris$Species,y=iris$Sepal.Length,
     xlab="Species",
     main="Sepal Length across Species",
     col="blue")
dev.off()

#Boxplots
b1<-boxplot(iris$Petal.Width,main="Width of Petal",
            col="blue",horizontal=T)
b1
b1$out

#To show how boxplots show us outliers
setosa<-iris[iris$Species=="setosa",]
b1<-boxplot(setosa$Petal.Width,main="Width of Petal",
            col="blue",horizontal=T)
b1
b1$out
#Here we see outliers easily but not in the previous case because there was a huge collectionin that set so outliers are less

# Row positions for outliers 0.5 and 0.6
ind<-which(setosa$Petal.Width %in% b1$out)#which rowscontain 0.5 or 0.6
ind
setosa$Petal.Width[24]
setosa$Petal.Width[44]

#removing outliers-previously we detected outliers
setosa1<-setosa[-ind,] #removes values from 24 and 44th row
setosa1

#toimpute outliers
a<-setosa[ind,"Petal.Width"]<-0.2
View(a)#replacing with mean here
hist(iris$Sepal.Width,col="orange",labels=T)


getwd()
setwd("E:\\Jigsaw\\BC1\\DataSets\\Class-Datasets\\Class Datasets")

#Creating histogram
hist(iris$Sepal.Width,col="orange",labels=T)
#helps find skewness in data 

#Another way tofind skewness is summary
summary(iris$Sepal.Width)

#to have exactly 5 bins:breaks
hist(iris$Sepal.Width,breaks=5,col="orange",labels=T)

#Range for X axis:xlim
hist(iris$Sepal.Width,xlim=c(1,5),breaks=5,col="orange",labels=T)

#Using ggplot2
nk<-read.csv("DirectMarketing.csv")
head(nk)
library(ggplot2)
#Scatter Plots
p<-ggplot(nk,aes(x=Salary,y=AmountSpent))
p+geom_point()

p+geom_point(aes(colour=Gender))

p+geom_point(aes(color=Gender))+xlab("Salary in $")+ylab("Expenditure in $")

#Histograms
p<-ggplot(nk,aes(x=AmountSpent))
p+geom_histogram()

p+geom_histogram(aes(fill=Gender),position="dodge") #Stacked Bar Chart if dodge not given
p+geom_histogram(aes(fill=Gender,color=Gender),alpha=0.1)+facet_grid(Gender~.)#alpha is for transperancy level

#Bxplots
p<-ggplot(nk,aes(x=Gender,y=AmountSpent,fill=Gender))
p+geom_boxplot()


#Density graphs
p<-ggplot(nk,aes(x=AmountSpent))
p+geom_density(aes(fill=Gender,color=Gender),alpha=0.4)
p+geom_density(aes(fill=Gender,color=Gender),alpha=0.4)+
  scale_y_continuous(labels=function(n){format(n,scientific=FALSE)})

#hEAT mAPS
str(nk)
p<-ggplot(nk,aes(x=Salary,y=AmountSpent))
p+geom_bin2d()
p<-ggplot(nk,aes(x=Age,y=Gender))
p+geom_bin2d()
?geom_bin2d
