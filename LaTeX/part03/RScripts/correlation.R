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
     pch = 16, col = "dodgerblue4", cex.main = 0.9)

###############################################################################
# Scatterplot with Categorical Indicators
###############################################################################

par(mar = c(4.1,4.1,4.1,2.1))
set.seed(0)
diagnosis <- data.frame(diagnosis = c(rep("mild", 25),
                                      rep("moderate", 25),
                                      rep("severe", 25)),
                        depression = c(rnorm(25, 3, 0.4),
                                        rnorm(25, 5, 0.3),
                                        rnorm(25, 7, 0.5)),
                        anxiety = c(rnorm(25, 4, 1.2),
                                     rnorm(25, 6, 0.8),
                                     rnorm(25, 9, 0.6))
                        )

with(diagnosis, plot(depression, anxiety, type = "n",
                     xlab = "", ylab = "Anxiety",
                     main = "Clinical Anxiety and Depression Scores",
                     cex.main = 0.9))
mtext("Depression", side = 1, line = 2)

with(diagnosis[diagnosis$diagnosis=="mild",], 
               points(depression, anxiety, pch = 15,
                      col = "dodgerblue", )
               )

with(diagnosis[diagnosis$diagnosis=="moderate",], 
     points(depression, anxiety, pch = 16,
            col = "dodgerblue2", )
)

with(diagnosis[diagnosis$diagnosis=="severe",], 
     points(depression, anxiety, pch = 17,
            col = "dodgerblue4", )
)

text(x = 7, y = 5.5, "Mild bipolar", col = "dodgerblue")
text(x = 7, y = 4.25, "Moderate bipolar", col = "dodgerblue2")
text(x = 7, y = 3, "Severe bipolar", col = "dodgerblue4")
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
