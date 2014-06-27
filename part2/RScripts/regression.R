###############################################################################
# LS animation for web
###############################################################################

install.packages("animation")
library(animation)

oopt = ani.options(interval = 0.3, nmax = ifelse(interactive(), 15, 2))

least.squares = function(
  x, y, n = 15, ani.type = c('slope', 'intercept'), a, b, a.range, b.range,
  ab.col = c('gray', 'black'), est.pch = 19, v.col = 'red', v.lty = 2,
  rss.pch = 19, rss.type = 'o', mfrow = c(1,1), ...
) {
  nmax = ani.options('nmax')
  if (missing(x)) x = 1:n
  if (missing(y)) y = x + rnorm(n)
  
  ani.type = match.arg(ani.type)
  fit = coef(lm(y ~ x))
  
  if (missing(a)) a = fit[1]
  if (missing(b)) b = fit[2]
  
  rss = rep(NA, nmax)
  par(mfrow = mfrow)
  
  if (missing(b.range))
    bseq = tan(seq(pi/10, 3.5 * pi/10, length = nmax))
  else bseq = seq(b.range[1], b.range[2], length = nmax)
  
  for (i in 1:nmax) {
    dev.hold()
    plot(x, y, ...)
    abline(fit, col = ab.col[1])
    abline(a, bseq[i], col = ab.col[2])
    points(x, bseq[i] * x + a, pch = est.pch)
    segments(x, bseq[i] * x + a, x, y, col = v.col, lty = v.lty)
    rss[i] = sum((y - bseq[i] * x - a)^2)
    ani.pause()
  }
}

least.squares()

## save the animation in HTML pages
saveHTML({
  ani.options(interval = 0.3, nmax = ifelse(interactive(), 25, 2))
  par(mar = c(4, 4, 0.5, 0.1), mgp = c(2, 0.5, 0), tcl = -0.3)
  least.squares()
}, img.name = "least.squares", htmlfile = "least.squares.html", ani.height = 366, 
ani.width = 700, title = "Demonstration of Least Squares",
description = c("We want to find an estimate for the slope", 
                "in 25 candidate slopes, so we just compute the RSS one by one. "))

ani.options(oopt)

###############################################################################
# LS static for print
###############################################################################

set.seed(0)
x <- 1:15
y <- x + rnorm(15)

fit <- coef(lm(y ~ x))
a <- fit[1]
b <- fit[2]

par(mfrow = c(1,1))
ab.col <- c('gray', 'black')
est.pch <- 19
v.col <- 'red'
v.lty <- 2
v.lwd <- 2
rss.pch <- 19
rss.type <- 'o'

bseq = tan(seq(pi/10, 3.5 * pi/10, length = 15))
plot(x, y)
abline(fit, col = ab.col[1])
abline(a, bseq[6], col = ab.col[2])
points(x, bseq[6] * x + a, pch = est.pch)
segments(x, bseq[6] * x + a, x, y, col = v.col, lty = v.lty, lwd = v.lwd)

text(3, 11, "Residual difference", col="red")
text(3, 12.5, "Line of best fit", col="gray")
text(3, 14, "Possible line of fit", col="black", adj=NULL)

###############################################################################
# Explained variance
###############################################################################

set.seed(18)
x <- seq(from = 1, to = 15, length.out = 50)
y <- x + rlogis(50)^2

fit <- coef(lm(y ~ x))
a <- fit[1]
b <- fit[2]

par(mfrow = c(1,1))
ab.col <- c('gray', 'black')
est.pch <- 19
v.col <- 'red'
v.lty <- 2
v.lwd <- 2

plot(x, y, pch = 16)
abline(fit, col = ab.col[1])
segments(x, b * x + a, x, y, col = v.col, lty = v.lty, lwd = v.lwd)

text(2.5, 25, "R-squared = 0.39")

###############################################################################
# Residual
###############################################################################

x <- c(0.5, 1.4, 2.5, 3)
y <- c(0.8, 2, 2.3, 2.9)

plotResid <- function(i) {
  fit <- coef(lm(y ~ x))
  a <- fit[1]
  b <- fit[2]
  
  # Sets margins for the plot
  par(mar=c(2, 5, 2, 1) + 0.1)
  
  # Plots our data without any axis labels or tics
  plot(x, y, pch = 16, yaxt="n",
       xaxt="n", ylab="")
  
  # Plots line of best fit
  abline(fit)
  
  # Adds vertical line from y = 0 to y = y[i]
  if(y[i] < a+b*x[i]) {
    segments(x[i], 0, x[i], a+b*x[i], col = "grey",
             lwd = 2, lty = 1)
  } else {
    segments(x[i],0,x[i],y[i], col = "grey", lwd = 2, lty = 1)
  }
  
  # Add horizontal lines from x = 0 to x = x[i]
  # at y[i] and y-hat[i], respectively
  segments(0,y[i],x[i],y[i], col = "grey", lwd = 2, lty = 1)
  segments(0, a+b*x[i], x[i], a+b*x[i], col = "grey", lwd = 2, lty = 1)
  
  # Redraws data points so they are layered over the segments
  points(x, y, pch = 16)
  
  # Adds all text to the plot
  mtext("X", side = 1, line = 0.5, at = x[i],
        cex.lab = 1, las = 1, col = "grey")
  mtext("Y", side = 2, line = 0.5, at = y[i],
        cex.lab = 1, las = 2, col = "grey")
  mtext("Fitted Y", side = 2, line = 0.5, at = a+b*x[i],
        cex.lab = 1, las = 2, col = "grey")
  
  # Adds arrow between observed and predicted y[i]
  arrows(x[i]/2, a+b*x[i], x[i]/2, y[i], length = 0.125,
         angle = 30, code = 3, col = "black",
         lwd = 2, lty = 1)
  
  text(x = x[i]/1.5, y = y[i] + 0.5*((a+b*x[i])-y[i]),
       "Residual")
}

plotResid(2)

###############################################################################
# Sum of Squares
###############################################################################

x <- c(0.5, 1, 2.9, 3)
y <- c(0.8, 1.6, 2.3, 2.9)

fit <- coef(lm(y ~ x))
a <- fit[1]
b <- fit[2]

layout(matrix(c(1,2),1,2))

plot(x, y, pch = 16, main = "Simple Average of Y",
     xlim = c(0, 3.5), ylim = c(0, 3.5))
abline(h = mean(y), col = "black")
rect(x, y, x + (mean(y)-y), mean(y),
     col = "red", density = 55)
points(x,y, pch = 16)
text(1, 3.25, "Total Sum of Squares", col = "red", cex = 0.75)

plot(x,y, pch = 16, main = "Fitted Values of Y",
     xlim = c(0, 3.5), ylim = c(0, 3.5))
abline(fit, col = "black")
rect(x, y, x + ((a+b*x)-y), a+b*x,
     col = "blue", density = 55)
text(1.25, 3.25, "Residual Sum of Squares", col = "blue", cex = 0.75)
points(x,y, pch = 16)