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