Answers for Correlation Exercises
========================================================

1. Download the Patient Satisfaction data set from GitHub. This dataset contains information from patients surveyed at various hospitals following their treatment to assess their satisfaction with the experience. We will be using these data for the first few exercises.




2. Do nurse and doctor communication ratings correlate? First we can construct a scatterplot of our data:

  
  ```r
  plot(ex01$nursesCommunicateWell, ex01$doctorsCommunicateWell, xlab = "Percent patients who say nurses communicate well", 
      ylab = "Percent patients who say doctors communicate well")
  ```
  
  ![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


  We can see that the assumption of linearity does not appear to be violated. Given this, we can perform a bivatiate correlation test of these data:

  
  ```r
  cor.test(ex01$nursesCommunicateWell, ex01$doctorsCommunicateWell)
  ```
  
  ```
  ## 
  ## 	Pearson's product-moment correlation
  ## 
  ## data:  ex01$nursesCommunicateWell and ex01$doctorsCommunicateWell
  ## t = 70.03, df = 3973, p-value < 2.2e-16
  ## alternative hypothesis: true correlation is not equal to 0
  ## 95 percent confidence interval:
  ##  0.7290 0.7569
  ## sample estimates:
  ##    cor 
  ## 0.7433
  ```


  Clearly, patient ratings of nurses' and doctors' abilities to communicate well correlate highly (r=0.74) and to a level of statistical significance (t=70.03; p-value < 0.001).

3. Give the partial correlation between doctor and nurse communicativity controlling for staffExplainedMedications and givenInformationAboutRecovery. First we will make a data frame containing the two variables we wish to control for. We will also load the source code to perform a partial correlation:

  
  ```r
  source("http://www.yilab.gatech.edu/pcor.R")
  controlled <- subset(ex01, select = c(givenInformationAboutRecovery, staffExplainedMedications))
  ```

  
  And we will conduct the correlation test:
  
  
  ```r
  pcor.test(ex01$nursesCommunicateWell, ex01$doctorsCommunicateWell, controlled)
  ```
  
  ```
  ##   estimate    p.value statistic    n gn  Method            Use
  ## 1   0.4891 4.338e-273     35.31 3968  2 Pearson Var-Cov matrix
  ```

  
  Again we see a strong correlation (r = 0.50) that reaches a level of statistical significance (t = 35.31; p-value < 0.001).

4. Create a lower-diagonal correlation matrix and comment on it.

  
  ```r
  corMatrix <- subset(ex01, select = c(nursesCommunicateWell:rateHospitalPositively))
  corMatrix <- na.omit(corMatrix)
  as.dist(cor(corMatrix))
  ```
  
  ```
  ##                               nursesCommunicateWell doctorsCommunicateWell
  ## doctorsCommunicateWell                       0.7424                       
  ## receivedImmediateHelp                        0.8440                 0.6913
  ## painManagedByTreatment                       0.7777                 0.6356
  ## staffExplainedMedications                    0.7663                 0.6559
  ## bathroomsAlwaysClean                         0.6880                 0.5468
  ## givenInformationAboutRecovery                0.5383                 0.3832
  ## rateHospitalPositively                       0.7761                 0.6073
  ##                               receivedImmediateHelp painManagedByTreatment
  ## doctorsCommunicateWell                                                    
  ## receivedImmediateHelp                                                     
  ## painManagedByTreatment                       0.7227                       
  ## staffExplainedMedications                    0.7147                 0.6651
  ## bathroomsAlwaysClean                         0.7074                 0.5605
  ## givenInformationAboutRecovery                0.4611                 0.4837
  ## rateHospitalPositively                       0.6769                 0.6715
  ##                               staffExplainedMedications
  ## doctorsCommunicateWell                                 
  ## receivedImmediateHelp                                  
  ## painManagedByTreatment                                 
  ## staffExplainedMedications                              
  ## bathroomsAlwaysClean                             0.6025
  ## givenInformationAboutRecovery                    0.4885
  ## rateHospitalPositively                           0.6490
  ##                               bathroomsAlwaysClean
  ## doctorsCommunicateWell                            
  ## receivedImmediateHelp                             
  ## painManagedByTreatment                            
  ## staffExplainedMedications                         
  ## bathroomsAlwaysClean                              
  ## givenInformationAboutRecovery               0.3927
  ## rateHospitalPositively                      0.6100
  ##                               givenInformationAboutRecovery
  ## doctorsCommunicateWell                                     
  ## receivedImmediateHelp                                      
  ## painManagedByTreatment                                     
  ## staffExplainedMedications                                  
  ## bathroomsAlwaysClean                                       
  ## givenInformationAboutRecovery                              
  ## rateHospitalPositively                               0.5724
  ```
  
  ```r
  
  install.packages("Hmisc")
  ```
  
  ```
  ## Error: trying to use CRAN without setting a mirror
  ```
  
  ```r
  library(Hmisc)
  ```
  
  ```
  ## Loading required package: grid
  ## Loading required package: lattice
  ## Loading required package: survival
  ## Loading required package: splines
  ## Loading required package: Formula
  ## 
  ## Attaching package: 'Hmisc'
  ## 
  ## The following objects are masked from 'package:base':
  ## 
  ##     format.pval, round.POSIXt, trunc.POSIXt, units
  ```
  
  ```r
  
  rcorr(as.matrix(corMatrix))
  ```
  
  ```
  ##                               nursesCommunicateWell doctorsCommunicateWell
  ## nursesCommunicateWell                          1.00                   0.74
  ## doctorsCommunicateWell                         0.74                   1.00
  ## receivedImmediateHelp                          0.84                   0.69
  ## painManagedByTreatment                         0.78                   0.64
  ## staffExplainedMedications                      0.77                   0.66
  ## bathroomsAlwaysClean                           0.69                   0.55
  ## givenInformationAboutRecovery                  0.54                   0.38
  ## rateHospitalPositively                         0.78                   0.61
  ##                               receivedImmediateHelp painManagedByTreatment
  ## nursesCommunicateWell                          0.84                   0.78
  ## doctorsCommunicateWell                         0.69                   0.64
  ## receivedImmediateHelp                          1.00                   0.72
  ## painManagedByTreatment                         0.72                   1.00
  ## staffExplainedMedications                      0.71                   0.67
  ## bathroomsAlwaysClean                           0.71                   0.56
  ## givenInformationAboutRecovery                  0.46                   0.48
  ## rateHospitalPositively                         0.68                   0.67
  ##                               staffExplainedMedications
  ## nursesCommunicateWell                              0.77
  ## doctorsCommunicateWell                             0.66
  ## receivedImmediateHelp                              0.71
  ## painManagedByTreatment                             0.67
  ## staffExplainedMedications                          1.00
  ## bathroomsAlwaysClean                               0.60
  ## givenInformationAboutRecovery                      0.49
  ## rateHospitalPositively                             0.65
  ##                               bathroomsAlwaysClean
  ## nursesCommunicateWell                         0.69
  ## doctorsCommunicateWell                        0.55
  ## receivedImmediateHelp                         0.71
  ## painManagedByTreatment                        0.56
  ## staffExplainedMedications                     0.60
  ## bathroomsAlwaysClean                          1.00
  ## givenInformationAboutRecovery                 0.39
  ## rateHospitalPositively                        0.61
  ##                               givenInformationAboutRecovery
  ## nursesCommunicateWell                                  0.54
  ## doctorsCommunicateWell                                 0.38
  ## receivedImmediateHelp                                  0.46
  ## painManagedByTreatment                                 0.48
  ## staffExplainedMedications                              0.49
  ## bathroomsAlwaysClean                                   0.39
  ## givenInformationAboutRecovery                          1.00
  ## rateHospitalPositively                                 0.57
  ##                               rateHospitalPositively
  ## nursesCommunicateWell                           0.78
  ## doctorsCommunicateWell                          0.61
  ## receivedImmediateHelp                           0.68
  ## painManagedByTreatment                          0.67
  ## staffExplainedMedications                       0.65
  ## bathroomsAlwaysClean                            0.61
  ## givenInformationAboutRecovery                   0.57
  ## rateHospitalPositively                          1.00
  ## 
  ## n= 3966 
  ## 
  ## 
  ## P
  ##                               nursesCommunicateWell doctorsCommunicateWell
  ## nursesCommunicateWell                                0                    
  ## doctorsCommunicateWell         0                                          
  ## receivedImmediateHelp          0                     0                    
  ## painManagedByTreatment         0                     0                    
  ## staffExplainedMedications      0                     0                    
  ## bathroomsAlwaysClean           0                     0                    
  ## givenInformationAboutRecovery  0                     0                    
  ## rateHospitalPositively         0                     0                    
  ##                               receivedImmediateHelp painManagedByTreatment
  ## nursesCommunicateWell          0                     0                    
  ## doctorsCommunicateWell         0                     0                    
  ## receivedImmediateHelp                                0                    
  ## painManagedByTreatment         0                                          
  ## staffExplainedMedications      0                     0                    
  ## bathroomsAlwaysClean           0                     0                    
  ## givenInformationAboutRecovery  0                     0                    
  ## rateHospitalPositively         0                     0                    
  ##                               staffExplainedMedications
  ## nursesCommunicateWell          0                       
  ## doctorsCommunicateWell         0                       
  ## receivedImmediateHelp          0                       
  ## painManagedByTreatment         0                       
  ## staffExplainedMedications                              
  ## bathroomsAlwaysClean           0                       
  ## givenInformationAboutRecovery  0                       
  ## rateHospitalPositively         0                       
  ##                               bathroomsAlwaysClean
  ## nursesCommunicateWell          0                  
  ## doctorsCommunicateWell         0                  
  ## receivedImmediateHelp          0                  
  ## painManagedByTreatment         0                  
  ## staffExplainedMedications      0                  
  ## bathroomsAlwaysClean                              
  ## givenInformationAboutRecovery  0                  
  ## rateHospitalPositively         0                  
  ##                               givenInformationAboutRecovery
  ## nursesCommunicateWell          0                           
  ## doctorsCommunicateWell         0                           
  ## receivedImmediateHelp          0                           
  ## painManagedByTreatment         0                           
  ## staffExplainedMedications      0                           
  ## bathroomsAlwaysClean           0                           
  ## givenInformationAboutRecovery                              
  ## rateHospitalPositively         0                           
  ##                               rateHospitalPositively
  ## nursesCommunicateWell          0                    
  ## doctorsCommunicateWell         0                    
  ## receivedImmediateHelp          0                    
  ## painManagedByTreatment         0                    
  ## staffExplainedMedications      0                    
  ## bathroomsAlwaysClean           0                    
  ## givenInformationAboutRecovery  0                    
  ## rateHospitalPositively
  ```

  
  As we can see, all bivariate correlations reach a level of statistical significance

5. Comment on assumptions for correlation.

  
  ```r
  pairs(~nursesCommunicateWell + doctorsCommunicateWell + receivedImmediateHelp + 
      painManagedByTreatment + staffExplainedMedications + bathroomsAlwaysClean + 
      givenInformationAboutRecovery + rateHospitalPositively, data = ex01, upper.panel = NULL)
  ```
  
  ![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 

  
  E.g., The scatterplot for givenInformationAboutRecovery by rateHospitalPositively shows a bit of an odd trend: it almost looks like it may be a logistic curve.
  
  These comments are rather subjective: the important thing is that you are looking critically at your data to make sure that the test's assumptions are met.

6. --NOT INCLUDED--

7. Download the ACS data

  
  ```r
  download.file("https://raw.githubusercontent.com/faulconbridge/appliedStats/master/part2/data/correlationCaseStudy.csv", 
      "acs.csv", method = "wget", extra = "--no-check-certificate")
  acs <- read.csv("acs.csv", header = TRUE)
  ```


8. Do noHighSchoolDiploma and publicTransit correlate?

  
  ```r
  cor.test(acs$noHighSchoolDiploma, acs$publicTransit)
  ```
  
  ```
  ## 
  ## 	Pearson's product-moment correlation
  ## 
  ## data:  acs$noHighSchoolDiploma and acs$publicTransit
  ## t = -0.0777, df = 49, p-value = 0.9384
  ## alternative hypothesis: true correlation is not equal to 0
  ## 95 percent confidence interval:
  ##  -0.2858  0.2653
  ## sample estimates:
  ##     cor 
  ## -0.0111
  ```


9. Do HighSchoolOrHigher and percentOnSNAP correlate?

  
  ```r
  cor.test(acs$HighSchoolOrHigher, acs$percentOnSNAP)
  ```
  
  ```
  ## 
  ## 	Pearson's product-moment correlation
  ## 
  ## data:  acs$HighSchoolOrHigher and acs$percentOnSNAP
  ## t = -4.106, df = 49, p-value = 0.0001521
  ## alternative hypothesis: true correlation is not equal to 0
  ## 95 percent confidence interval:
  ##  -0.6859 -0.2677
  ## sample estimates:
  ##    cor 
  ## -0.506
  ```
  
  ```r
  plot(acs$HighSchoolOrHigher, acs$percentOnSNAP)
  ```
  
  ![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-10.png) 


10. Do medianRent and percentImpoverished correlate?

  
  ```r
  cor.test(acs$medianRent, acs$percentImpoverished)
  ```
  
  ```
  ## 
  ## 	Pearson's product-moment correlation
  ## 
  ## data:  acs$medianRent and acs$percentImpoverished
  ## t = -2.431, df = 49, p-value = 0.01876
  ## alternative hypothesis: true correlation is not equal to 0
  ## 95 percent confidence interval:
  ##  -0.55359 -0.05769
  ## sample estimates:
  ##     cor 
  ## -0.3281
  ```
  
  ```r
  plot(acs$percentImpoverished, acs$medianRent)
  ```
  
  ![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-11.png) 

