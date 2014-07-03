# Download and view the file
download.file("https://raw.githubusercontent.com/faulconbridge/appliedStats/master/LaTeX/part02/data/tToolsCaseStudy01.csv", "medicareSpending.csv",
              method="wget", extra="--no-check-certificate")
medicareSpending <- read.csv("medicareSpending.csv", header=TRUE)
View(medicareSpending)

# Subset the data to include only the relevant states
stateData <- subset(medicareSpending, state == "CA" | state == "NY",
                      select = c(state, spendingPerPatient))

# Perform Levene's test for equality of variances
library(car)
leveneTest(y = stateData$spendingPerPatient, group = stateData$state)

# Visualize data from our two states
with(stateData[stateData$state=="CA",],
     hist(spendingPerPatient, freq = FALSE,
          xlim = c(0.6,1.4), ylim = c(0,5),
          col = "firebrick2", density = 75,
          border = "black", breaks = 16,
          main = "Medicare Spending Per Patient By State",
          xlab = "Spending Per Patient",
          ylab = "Relative Frequency",
          cex.main = 0.8, cex.lab = 0.9,
          cex.axis = 0.8, las = 1))

with(stateData[stateData$state=="NY",],
     hist(spendingPerPatient, add = TRUE,
          freq = FALSE, breaks = 9,
          xlim = c(0.7,1.3), ylim = c(0,5),
          col = "dodgerblue3", density = 75,
          border = "black"))

text(x = 0.7, y = 4.5,
     "California (M=0.98)", col = "firebrick2",
     cex = 0.8)
text(x = 0.7, y = 3.5,
     "New York (M=0.96)", col = "dodgerblue3",
     cex = 0.8)

# We can visualize the data from any state easily
# using this dummy code: just swap in whatever
# state abbreviation you want!

plotState <- function(myState) {
  with(medicareSpending[medicareSpending$state == myState,],
       hist(spendingPerPatient, freq = FALSE,
            col = "firebrick2", density = 75,
            border = "black",
            main = paste("Medicare Spending Per Patient in", myState),
            xlab = "Spending Per Patient",
            ylab = "Relative Frequency"))
}

plotState('IN')

# Perform an independent-samples t-test
# with equal variances not assumed

with(stateData, t.test(spendingPerPatient~state, equal.var=FALSE))
