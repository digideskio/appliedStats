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

###############################################################################
# Visualizing Data
###############################################################################

# Histogram
hist(data)

# Kernel density plot
plot(density(data))

# Boxplots
boxplot(data)

# Scatterplot
plot(data)