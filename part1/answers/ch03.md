Answers for Chapter 3 (Measuring Uncertainty) Exercises
========================================================

1. In R, execute the following code:
  
  ```r
  set.seed(0)
  height1 <- rnorm(25, 5.6667, 1/3)
  
  avgHeight <- NULL
  
  for (i in 1:500) {
      height <- rnorm(25, 5.6667, 1/3)
      avgHeight <- rbind(avgHeight, mean(height))
  }
  ```


2. What are the mean and median values of height1 and avgHeight? What are their standard deviations?
  
  For height1, the mean is 5.68, the median is 5.6477, and the standard deviation is 0.3092. Likewise, for avgHeight, the mean is 5.6682, the median is 5.6656, and the standard deviation is 0.0677.

3. What would we expect the standard error of avgHeight to be if we had 500 samples and a population standard deviation of 0.33 feet?

  Knowing the equation for standard error is $\frac{\sigma}{\sqrt{n}}$, our standard error is 0.003.

4. Prepare a histogram of height1 and avgHeight. Do they differ? Does either look problematic? (E.g., departures from normality)

  ![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

  
  Based on these histograms, both look approximately normal in their distribution.
 
5. Make a kernel density plot of height1 and avgHeight. Do they differ from the histograms? Which gives a better picture of the data?

  ![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-31.png) ![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-32.png) 

  
  We see some departures from normality in the kernel density plot of height1: specifically, there are some rightward values that form a small second peak. Overall, however, both distributions appear approximately normal. Yet, in the histograms we fail to see some of the features of the data, such as that smaller second peak in the height1 data.
