###############################################################################
# Fixed versus Random Effects
###############################################################################
set.seed(2800)
a <- rnorm(5, 5.7, 5)
b <- 2.8
x <- c(0:10)

layout(matrix(c(1,2),1,2))
par(mar=c(2,2,2,2)+0.5)
plot(x, a[3]+x*b+rnorm(x, 0, 1), xlab = "", ylab = "",
     main = "Fixed Effects Model",
     col = "dodgerblue4", pch = 16,
     xlim = c(0, 10), ylim = c(0, 40),
     cex.main = 0.9)
abline(a = a[3], b, col = "dodgerblue4")

plot(x, a[3]+b*x, type = "n", xlab = "",
     ylab = "", main = "Random Effects Model",
     xlim = c(0, 10), ylim = c(0, 40),
     cex.main = 0.9)

cols <- c("firebrick1", "firebrick2", "firebrick3",
          "firebrick", "firebrick4")

for(i in 1:length(a)) {
  points(x, a[i]+x*b+rnorm(x, 0, 1), pch = 16,
         col = cols[i])
  lines(x, a[i]+x*b, col = cols[i])
}
