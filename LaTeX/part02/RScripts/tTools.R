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

set.seed(0)
site1 <- c(rnorm(1000, mean = 36500, sd = 2000))
site2 <- c(rnorm(1000, mean = 39000, sd = 1780))
t.test(site1, site2, paired=TRUE)

treeVolumes <- data.frame(Volume = c(site1, site2),
                          Site = c(rep("Site 1", 1000), rep("Site 2", 1000)))

ggplot(treeVolumes, aes(Volume, fill = Site)) +
  geom_histogram(binwidth = 1000, colour = "black") + 
  xlim(30000, 45000) +
  xlab("Volume (cubic feet)") + 
  ggtitle("Volumes of Douglas Firs from Two Sites")
  
