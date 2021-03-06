library(ggplot2)
###############################################################################
# Mean, Median, and Mode
###############################################################################
set.seed(0)
data <- rnorm(200,0,1)

mean(data)
median(data)

###############################################################################
# Skewness and Mean vs. Median
###############################################################################

# overlay histogram and normal density
p0 = qplot(data, geom = 'blank') +
  stat_function(fun = dnorm) +
  geom_histogram(aes(y = ..density..), alpha = 0.4, binwidth=0.5)

print(p0)

# Include some positive outliers
data2 <- c(data,2.3,2.4,2.5,rep(2.6,3),
           2.8,rep(3,4),3.7,4.1,4.3,4.6,5,4.8)

# overlay histogram and normal density
p0 = qplot(data2, geom = 'blank') +
  stat_function(fun = dnorm) +
  geom_histogram(aes(y = ..density..), alpha = 0.4, binwidth=0.5)

print(p0)

# Compare the means and medians of our two datasets
mean(data)
mean(data2)

median(data)
median(data2)

###############################################################################
# Standard Deviation
###############################################################################

layout(matrix(c(1,2,3),1,3))
# Small standard deviation (sd = 1)
x=seq(-20,20,length=200)
y=dnorm(x,mean=0,sd=1)
plot(x,y,type="l",lwd=2,col="red", main="SD = 1")
polygon(c(-20,x,20),c(0,y,0),col="gray")

# Moderate standard deviation (sd = 3)
y=dnorm(x,mean=0,sd=3)
plot(x,y,type="l",lwd=2,col="red", main="SD = 3")
polygon(c(-20,x,20),c(0,y,0),col="gray")

# Large standard deviation (sd = 6)
y=dnorm(x,mean=0,sd=6)
plot(x,y,type="l",lwd=2,col="red", main="SD = 6")
polygon(c(-20,x,20),c(0,y,0),col="gray")

layout(matrix(c(1),1,1))
par(mar = c(2, 2, 2, 2))

stdev <- function() {
  # # External package to generate four shades of blue
  # library(RColorBrewer)
  # cols <- rev(brewer.pal(4, "Blues"))
  cols <- c("#2171B5", "#6BAED6", "#BDD7E7", "#EFF3FF")
  
  # Sequence between -4 and 4 with 0.1 steps
  x <- seq(-4, 4, 0.1)
  
  # Plot an empty chart with tight axis boundaries, and axis lines on bottom and left
  plot(x, type="n", xaxs="i", yaxs="i", xlim=c(-4, 4), ylim=c(0, 0.4),
       bty="l", xaxt="n", xlab="", ylab="")
  
  # Function to plot each coloured portion of the curve, between "a" and "b" as a
  # polygon; the function "dnorm" is the normal probability density function
  polysection <- function(a, b, col, n=11){
    dx <- seq(a, b, length.out=n)
    polygon(c(a, dx, b), c(0, dnorm(dx), 0), col=col, border=NA)
    # draw a white vertical line on "inside" side to separate each section
    segments(a, 0, a, dnorm(a), col="white")
  }
  
  # Build the four left and right portions of this bell curve
  for(i in 0:3){
    polysection(     i, i + 1, col=cols[i + 1])  # Right side of 0
    polysection(-i - 1,    -i, col=cols[i + 1])  # Left right of 0
  }
  
  # Black outline of bell curve
  lines(x, dnorm(x))
  
  # Bottom axis values, where sigma represents standard deviation and mu is the mean
  axis(1, at=-3:3, labels=expression(-3 * sigma, -2 * sigma, -1 * sigma, mu,
                                     1 * sigma,  2 * sigma,  3 * sigma))
  
  # Add percent densities to each division (rounded to 1 decimal place), between x and x+1
  text(c((0:3) + 0.5, (0:-3) - 0.5), c(0.16, 0.05, 0.04, 0.02),
       sprintf("%.1f%%", 100 * (pnorm(1:4) - pnorm(0:3))),
       col=c("white", "white", "black", "black"))
  segments(c(-2.5, -3.5, 2.5, 3.5), dnorm(c(2.5, 3.5)),
           c(-2.5, -3.5, 2.5, 3.5), c(0.03, 0.01))
}

stdev()

###############################################################################
# Sampling Distributions
###############################################################################

set.seed(0)
par(mar = c(5, 5, 5, 5))
layout(matrix(c(1,2,3),1,3))

height1 <- rnorm(25, 5.6667, 1/3)
height2 <- rnorm(25, 5.6667, 1/3)
height3 <- rnorm(25, 5.6667, 1/3)

hist(height1, main="Heights of group 1", xlab="Height (feet)")
hist(height2, main="Heights of group 2", xlab="Height (feet)")
hist(height3, main="Heights of group 3", xlab="Height (feet)")

layout(matrix(c(1),1,1))

avgHeight <- NULL

for(i in 1:500) {
  height <- rnorm(25, 5.6667, 1/3)
  avgHeight <- rbind(avgHeight, mean(height))
}

hist(avgHeight, main="Average heights of 500 groups of men", xlab="Height (feet)")
mean(avgHeight)
sd(avgHeight)


###############################################################################
# Visualizing Data
###############################################################################

# Histogram
hist(avgHeight)

# Kernel density plot
plot(density(avgHeight), main="Kernel Density of Average Heights", xlab="Height (feet)")

layout(matrix(c(1,2),1,2))
hist(height1, main="Heights of Group 1", xlab="Height (feet)")
hist(height1, breaks=10, main="Heights of Group 1", xlab="Height (feet)")

layout(matrix(c(1),1,1))
plot(density(height1),main="Kernel Density of Heights of Group 1", xlab="Height (feet)")

# Boxplots
boxplot(avgHeight, main="Boxplot of Average Male Heights", horizontal=TRUE, xlab="Height (feet)")

# Scatterplot
plot(height1, height2)