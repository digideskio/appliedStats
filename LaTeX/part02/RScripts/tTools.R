library(ggplot2)

###############################################################################
# One-Sample t-Test Example
###############################################################################

set.seed(0)
treeVolume <- c(rnorm(1000, mean = 36500, sd = 2000))
t.test(treeVolume)

hist(treeVolume, freq = TRUE, density = 55, col = "blue",
     breaks = 15, main = "Histogram of Douglas Fir Volumes",
     xlab = "Volume (cubic feet)", xlim = c(30000, 44000),
     ylim = c(0, 225))

segments(39000, 0, 39000, 225, lwd = 3,
         lty = 2)
text(41000, 190, "Population mean")
text(41000, 175, "volume")

segments(mean(treeVolume), 0, mean(treeVolume), 225,
         lwd = 3, lty = 2, col = "gray35")
text(33500, 190, "Sample mean volume", col = "gray35")

###############################################################################
# Paired-Samples Example
###############################################################################

# Let's say that we're measuring systolic
# blood pressures of patients before and
# after treatment with a drug meant to 
# reduce hypertension

set.seed(2820)

# We have 500 patients with a preTreat systolic
# bp of M = 145, SD = 11
preTreat <- c(rnorm(1000, mean = 145, sd = 9))

# And a postTreat systolic bp M = 130
# and SD = 15
postTreat <- c(rnorm(1000, mean = 138, sd = 8))

# Did the treatment reduce hypertension?
t.test(preTreat, postTreat, paired=TRUE)

bloodPressures <- data.frame(Systolic = c(preTreat, postTreat),
                          Treatment = c(rep("Pre-Treatment", 1000), 
                                        rep("Post-Treatment", 1000)))

ggplot(bloodPressures, aes(x = Systolic, fill = Treatment)) +
  geom_bar(binwidth = 3, colour = "black", position = "identity", alpha = 0.6) + 
  xlim(117, 174) +
  xlab("Systolic Blood Pressure (mmHg)") + 
  ggtitle("Systolic Blood Pressure Before and After Treatment")