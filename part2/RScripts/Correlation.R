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
