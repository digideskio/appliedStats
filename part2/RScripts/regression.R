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
# Hubble Example
###############################################################################

install.packages("ggplot2")
library(ggplot2)

object <- c("S.Mag.","L.Mag.","N.G.C. 6822","N.G.C. 598",
            "N.G.C. 221","N.G.C. 224","N.G.C. 5457","N.G.C. 4763",
            "N.G.C. 5194","N.G.C. 4449","N.G.C. 4214","N.G.C. 3031",
            "N.G.C. 3627","N.G.C. 4826","N.G.C. 5236","N.G.C. 1068",
            "N.G.C. 5055","N.G.C. 7331","N.G.C. 4258","N.G.C. 4151",
            "N.G.C. 4382","N.G.C. 4472","N.G.C. 4486","N.G.C. 4649")

distance <- c(0.032,0.034,0.214,0.263,0.275,0.275,0.45,0.5,
              0.5,0.63,0.8,0.9,0.9,0.9,0.9,1.0,1.1,1.1,
              1.4,1.7,2.0,2.0,2.0,2.0)

velocity <- c(170,290,-130,-70,-185,-220,200,290,270,
              200,300,-30,650,150,500,920,450,500,
              500,960,500,850,800,1090)

hubble <- data.frame(object,distance,velocity)

fit <- lm(hubble$distance~hubble$velocity)

hubble <- data.frame(hubble, predict(fit, interval = 'prediction'))

ggplot(hubble, aes(x = velocity, y = distance)) +
  geom_smooth(method = 'lm', aes(fill = 'confidence'),alpha = 1.0) +
  geom_point(colour = 'black', size = 3) +
  labs(x ="Recession Velocity (km/sec)",
        y ="Distance (megaparsecs)",
       title ="Measured distance versus velocity 
for 24 extra-galactic nebulae") +
  theme(legend.position = "none")

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