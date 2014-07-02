set.seed(0)
before <- c(rnorm(100, 4.9, 3.8))
after <- c(rnorm(100,3.8, 2.9))
wilcox.test(before, after, paired = FALSE)

set.seed(0)
pretest <- c(rnorm(100,70,10))
posttest <- c(rnorm(100,85,7))
difference <- pretest - posttest

# Paired-samples test
wilcox.test(pretest, posttest, paired = TRUE)

# Difference vector or one-sample test
wilcox.test(difference)

###############################################################################
# Case Study -- College Tuitions
###############################################################################

data <- data.frame(status = c(rep("unaffected",15),
                              rep("affected",15)),
                   value = c(1.94,1.44,1.56,1.58,2.06,1.66,1.75,1.77,
                             1.78,1.92,1.25,1.93,2.04,1.62,2.08,1.27,
                             1.63,1.47,1.39,1.93,1.26,1.71,1.67,1.28,
                             1.85,1.02,1.34,2.02,1.59,1.97))

with(data, wilcox_test(value~status))
