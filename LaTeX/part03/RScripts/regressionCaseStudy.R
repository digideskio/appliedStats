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