###############################################################################
# Scatterplot Example
###############################################################################
download.file(
  "https://raw.githubusercontent.com/faulconbridge/appliedStats/master/LaTeX/part03/data/correlationData01.csv",
  "population.csv", "wget", extra="--no-check-certificate")

population <- read.csv("population.csv",header=TRUE)
View(population)

plot(population$Year, population$Est..US.Population/1000000,
     xlab="Year", ylab="Population (Millions)", main="U.S. Population by Year",
     pch = 16, col = "dodgerblue4")

###############################################################################
# Scatterplot with Categorical Indicators
###############################################################################
download.file(
  "https://raw.githubusercontent.com/faulconbridge/appliedStats/master/LaTeX/part03/data/correlationData02.csv",
  "population2.csv", "wget", extra="--no-check-certificate")
population2 <- read.csv("population2.csv",header=TRUE)

male <- subset(population2, Sex == "male", select = c(Year,Population))
female <- subset(population2, Sex == "female", select = c(Population))

population <- data.frame(Year = male$Year, Male = male$Population, Female = female$Population)

plot(population$Year, population$Male/1000000, pch = 16, col = "dodgerblue4",
     xlab = "Year", ylab = "Population (Millions)",
     main = "U.S. Population by Year and Sex")
points(population$Year, population$Female/1000000, pch = 16, col = "dodgerblue")
text(x = 1650, y = 150, "Males", col = "dodgerblue4")
text(x = 1650, y = 130, "Females", col = "dodgerblue")

###############################################################################
# Correlation Example
###############################################################################
download.file(
  "https://raw.githubusercontent.com/faulconbridge/appliedStats/master/LaTeX/part03/data/correlationData03.csv",
  "adiposity.csv", "wget", extra="--no-check-certificate")

bodyFat <- read.csv("adiposity.csv", header=TRUE)
cor.test(bodyFat$Neck, bodyFat$Chest)

###############################################################################
# Correlation Matrix Example
###############################################################################
as.dist(cor(bodyFat))

install.packages("Hmisc")
library(Hmisc)
rcorr(as.matrix(bodyFat))

pairs(~Neck+Chest+Abdomen+Hip+Thigh,data=bodyFat,upper.panel=NULL)

###############################################################################
# Partial Correlation Example
###############################################################################
source("http://www.yilab.gatech.edu/pcor.R")

neck <- bodyFat$Neck
chest <- bodyFat$Chest
others <- subset(bodyFat, select=c(Abdomen:Thigh))

pcor.test(neck,chest,others)

###############################################################################
# Linearity Example
###############################################################################

layout(matrix(c(1,2,3,4),2,2))
par(mar=c(5, 5, 1, 5) + 0.1)

ff <- y ~ x
for(i in 1:4) {
  ff[[2]] <- as.name(paste("y", i, sep=""))
  ff[[3]] <- as.name(paste("x", i, sep=""))
  lmi <- lm(ff, data= anscombe)
  xl <- substitute(expression(x[i]), list(i=i))  
  yl <- substitute(expression(y[i]), list(i=i))
  plot(ff, data=anscombe, col="black", pch=21, cex=1, bg = "firebrick2", 
       xlim=c(3,19), ylim=c(3,13), 
       xlab="x", ylab="y"
  )  
  abline(lmi, col="firebrick")
}

###############################################################################
# Distribution Example
###############################################################################

layout(matrix(1),1,1)
set.seed(0)

r <- 0.9
X <- rnorm(100)
Y = r*X + sqrt(1-r^2)*rnorm(100)
XY <- cbind(X,Y)
subXY <- as.data.frame(subset(XY, X>0 & X<1, select=c(X:Y)))

cor.test(X,Y)
cor.test(subXY$X, subXY$Y)

plot(X,Y, col="orange", pch=16,
     main="Effects of Distribution on Correlation")
rect(0,-2,1,3, col="grey", density=25)
points(subXY$X,subXY$Y, col="blue", pch=16)
text(-2, 2.5, "r = 0.897", col="orange")
text(-2, 2.0, "r = 0.387", col="blue")
