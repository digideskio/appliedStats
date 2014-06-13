###############################################################################
# Scatterplot Example
###############################################################################
download.file(
  "https://raw.githubusercontent.com/faulconbridge/appliedStats/master/part2/data/correlationData01.csv",
  "population.csv", "wget", extra="--no-check-certificate")

population <- read.csv("population.csv",header=TRUE)
View(population)

plot(population$Year, population$Est..US.Population/1000000,
     xlab="Year",ylab="Population (Millions)", main="U.S. Population by Year")

###############################################################################
# Scatterplot with Categorical Indicators
###############################################################################
download.file(
  "https://raw.githubusercontent.com/faulconbridge/appliedStats/master/part2/data/correlationData02.csv",
  "population2.csv", "wget", extra="--no-check-certificate")
population2 <- read.csv("population2.csv",header=TRUE)

install.packages("car")
library(car)
scatterplot((Population/1000000)~Year | Sex, data=population2, labels=row.names(population2),
            reg.line=FALSE,smoother=FALSE,ylab="Population (Millions)",
            main="U.S. Population by Year and Sex")

###############################################################################
# Correlation Matrix Example
###############################################################################
download.file(
  "https://raw.githubusercontent.com/faulconbridge/appliedStats/master/part2/data/correlationData03.csv",
  "adiposity.csv", "wget", extra="--no-check-certificate")

bodyFat <- read.csv("adiposity.csv", header=TRUE)

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
  plot(ff, data=anscombe, col="red", pch=21, cex=1, bg = "grey", 
       xlim=c(3,19), ylim=c(3,13), 
       xlab="x", ylab="y"
  )  
  abline(lmi, col="blue")
}

###############################################################################
# Distribution Example
###############################################################################

layout(matrix(1),1,1)

