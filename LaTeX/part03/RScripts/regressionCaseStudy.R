###############################################################################
# Hubble Example
###############################################################################

# install.packages("ggplot2")
# library(ggplot2)

###############################################################################
# Input data
###############################################################################

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

###############################################################################
# Plot with ggplot2
###############################################################################

# hubble <- data.frame(object,distance,velocity)
# 
# fit <- lm(hubble$distance~hubble$velocity)
# 
# hubble <- data.frame(hubble, predict(fit, interval = 'prediction'))
# 
# ggplot(hubble, aes(x = velocity, y = distance)) +
#   geom_smooth(method = 'lm', aes(fill = 'confidence'),alpha = 1.0) +
#   geom_point(colour = 'black', size = 3) +
#   labs(x ="Recession Velocity (km/sec)",
#        y ="Distance (megaparsecs)",
#        title ="Measured distance versus velocity 
#        for 24 extra-galactic nebulae") +
#   theme(legend.position = "none")

###############################################################################
# Plot data
###############################################################################

plotCI <- function (x, y, xlab, ylab, main) {
  plot(x, y, pch = 16, col = "dodgerblue4",
       xlab = xlab, ylab = ylab,
       main = main, cex.main = 0.8,
       cex.axis = 0.8, cex.lab = 0.9,
       las = 1, xlim = c(min(x), max(x)),
       ylim = c(min(y), max(y)))
  
  fit <- lm(y~x)
  summary(fit)

  abline(fit, col = "dodgerblue4")
  
  CI <- predict(fit, interval = "confidence")
  
  cint <- data.frame(x, lower = CI[,2], upper = CI[,3])
  cint <- cint[order(x),]
  with(cint, points(x, lower, type = "l",
                    col = "firebrick3", lwd = 2))
  with(cint, points(x, upper, type = "l",
                    col = "firebrick3", lwd = 2))
  
#   plot(resid(fit),fitted(fit),
#        pch = 16, col = "steelblue3",
#        xlab = "Residuals", ylab = "Fitted values",
#        main = paste("Residual Plot for\n", ylab, "by", xlab),
#        cex.main = 0.8, cex.lab = 0.9,
#        cex.axis = 0.9, las = 1)
#   
#   summary(fit)
}

plotCI(x = velocity, y = distance,
       xlab = "Recession Velocity (km/sec)",
       ylab = "Distance (megaparsecs)",
       main = "Measured distance versus velocity")

###############################################################################
# Specify Model
###############################################################################

fit <- lm(distance ~ velocity)

plot(fitted(fit), resid(fit),
     xlab = "Predicted Distances (Megaparsecs)",
     ylab = "Residuals",
     main = "Residuals by Fitted Values",
     las = 1, pch = 16, col = "dodgerblue4",
     xlim = c(0,2), ylim = c(-1,1))
