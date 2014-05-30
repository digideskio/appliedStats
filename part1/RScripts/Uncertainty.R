set.seed(0)
data <- rnorm(200,0,1)

mean(data)
median(data)

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
