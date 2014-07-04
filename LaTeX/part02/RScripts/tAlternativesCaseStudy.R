###############################################################################
# Pollution
###############################################################################

download.file("https://raw.githubusercontent.com/faulconbridge/appliedStats/master/LaTeX/part02/data/tAlternativesCaseStudy01.csv",
              "pollution.csv", method="wget",
              extra="--no-check-certificate")
pollution <- read.csv("pollution.csv", header = TRUE)

pollution <- tAlternativesCaseStudy01

# These data will be for the concentrations of
# aluminum in micrograms per gram

aluminumData <- data.frame(clone = unique(pollution$Tree),
                       august = with(pollution[(pollution$Metal == "Aluminum" &
                                                  pollution$Month == "August"),],
                                     Concentration),
                       november = with(pollution[(pollution$Metal == "Aluminum" &
                                                    pollution$Month == "November"),],
                                       Concentration))

plot(density(aluminumData$august), col = "dodgerblue4",
     xlab = "Concentration of Aluminum (micrograms per gram)",
     ylab = "Probability", main = "Aluminum Resorption By Month",
     xlim = c(0, 25), ylim = c(0, 0.12),
     cex.main = 0.8, cex.lab = 0.9,
     cex.axis = 0.8, las = 1)
polygon(density(aluminumData$august), col = "dodgerblue4",
        density = 75)
polygon(density(aluminumData$november), col = "firebrick2",
        density = 75)
text("August", x = 3, y = 0.1, col = "dodgerblue4")
text("November", x = 3, y = 0.085, col = "firebrick2")

with(aluminumData, wilcox.test(august, november, paired = TRUE))
median(aluminumData$august)
median(aluminumData$november)
