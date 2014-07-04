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

###############################################################################
# Sum of Squares
###############################################################################

set.seed(0)
layout(matrix(c(1),1))
par(mar=c(4.1,4.1,4.1,2.1))

# Between-groups variance example
group1 <- rnorm(1000, mean = 58, sd = 4)
group2 <- rnorm(1000, mean = 82, sd = 3)

hist(group1, col = "dodgerblue1",
     border = "black", las = 1,
     xlim = c(40, 90), ylim = c(0, 275),
     xlab = "Patient Survival Rate (Percentage)",
     ylab = "Count",
     main = "Patient Survival Rates on Competing Treatments",
     cex.main = 0.9, cex.lab = 0.9, cex.axis = 0.8)

hist(group2, col = "dodgerblue3",
     border = "black", add = TRUE)

segments(57.5, 265, 81.5, 265,
         col = "black", lwd = 3)
segments(57.5, 250, 57.5, 280,
         col = "black", lwd = 3)
segments(81.5, 250, 81.5, 280,
         col = "black", lwd = 3)
text("Between-Groups Variance", x = 69.5, y = 230,
     cex = 0.75)

# Within-groups variance example
group3 <- rnorm(1000, mean = 54, sd = 6)
group4 <- rnorm(1000, mean = 82, sd = 2)

hist(group3, col = "dodgerblue1",
     border = "black", las = 1,
     xlim = c(30, 90), ylim = c(0, 275),
     xlab = "Patient Survival Rate (Percentage)",
     ylab = "Count",
     main = "Patient Survival Rates on Competing Treatments",
     cex.main = 0.9, cex.lab = 0.9, cex.axis = 0.8,
     breaks = 20)

hist(group4, col = "dodgerblue3",
     border = "black", add = TRUE)

segments(min(group3), 210, max(group3), 210,
         col = "black", lwd = 3)
segments(min(group3), 195, min(group3), 225,
         col = "black", lwd = 3)
segments(max(group3), 195, max(group3), 225,
         col = "black", lwd = 3)
text("Within-Groups Variance",
     x = min(group3)+0.5*(max(group3)-min(group3)),
     y = 245, cex = 0.8)

segments(min(group4), 210, max(group4), 210,
         col = "black", lwd = 3)
segments(min(group4), 195, min(group4), 225,
         col = "black", lwd = 3)
segments(max(group4), 195, max(group4), 225,
         col = "black", lwd = 3)
text("Within-Groups",
     x = min(group4)+0.5*(max(group4)-min(group4)),
     y = 260, cex = 0.75)
text("Variance",
     x = min(group4)+0.5*(max(group4)-min(group4)),
     y = 235, cex = 0.75)
