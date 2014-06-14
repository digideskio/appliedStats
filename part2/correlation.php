<?php
  $part = "part2";
  $title = "Correlation";
  require_once("../header.php");
?>
    <h2>Displaying Relationships</h2>
    <hr>
    
    <h3>Scatterplots</h3>
    <p>Okay, so this is something that we could have presented back a few chapters ago when we talked about data visualization. Unfortunately, that wouldn't haev worked with the example we were using, so instead of completely switching gears on you, we decided to wait until now to present it.</p>
    
    <p>Scatterplots are used to display data using cartesian coordinates. For instance, we may wish to visualize the growth of the U.S. population by decade:</p>
    
    <img src="assets/correlationScatter.jpeg" width="700px" height="366px" />
    
    <h3>Scatterplots with Categorical Variables</h3>
    <p>Additionally, we can use scatterplots to visualize data with categorical indicators. For example, if we wanted to look at the U.S population by year, split by males and females:</p>
    
    <img src="assets/correlationCategorical.jpeg" width="700px" height="366px" />
    
    <h2>Correlation</h2>
    <hr>
    
    <h3>Measuring Linear Association</h3>
    <p>Woah, hold up now: this sounds like we're heading towards some scary waters. Linear association? I thought this wasn't supposed to be a mathy book!</p>
    
    <p>Don't worry, we didn't lie to you. That's just a bit of a scary term for a not-so-scary concept. <span class="dt">Linear association</span>, in its most basic form, just means that when you increase one variable by so many units, another variable increases by so many other units. For instance, let's say that for every degree Fahrenheit we increase, we increase the number of daily neighborhood ice cream sales by 10 cones. That's easy, right?</p>
    
    <p>And that's all that correlation is measuring: the degree to which a change in one variable coincides with a change in another variable. Now, importantly, this doesn't mean that one causes the other. As a matter of fact, that's so important that it gets its own section a little ways down the page. But, as long as we keep that in the back of our minds for now, we can go ahead and define correlation as:</p>
    
    \[ \begin{eqnarray*}
    \rho_{X,Y} &=& \frac{\text{cov}(X,Y)}{\sigma_X\sigma_Y}&\text{ for a population} \\
    r&=& \frac{1}{n-1}\sum_{i=1}^n\left(\frac{x_i-\bar{x}}{s_x}\right)\left(\frac{y_i-\bar{y}}{s_y}\right)&\text{ for a sample}
    \end{eqnarray*} \]
    
    <p>So, although this looks like we're going back into the Forbidden Forest, it's a pretty straightforward couple of equations: they're saying that this correlation coefficient \(r\) is just equal to the covariance of two variables, \(x\) and \(y\), divided by the product of their standard deviations. Or, put another way, it's the amount that two variables change together divided by the amount of that change that we can attribute to chance.</p>
    
    <p>This will then give us a single value, \(r\), which can be anywhere from -1 to +1. Now, in this case, both negative and positive 1 mean the same thing (or pretty close to the same thing): this coefficient tells us about the strength of the relationship between the two variables. So, if we have \(r=-1\), that means that for every increase of \(x\) units of one variable, we decrease by \(y\) units of a second variable. Likewise, for \(r=1\), this tells us that for every \(x\) units that we increase one variable, we increase the other by exactly \(y\) units. Finally, if we have \(r=0\), that tells us that there is absolutely no relationship between our two variables. In other words, you could increase one variable by over 9000 units and absolutely nothing would change in your second variable.</p>
    
    <p>Unfortunately, most of us will never see a correlation that strong in real life: that would mean that there is absolutely no variance of your data. Now, if we're talking about a physical law and measuring it with incredibly high-precision instruments, it's entirely possible that we will have a correlation that strong. However, in most studies, there will be some random variance thrown in that weakens the correlation.</p>
    
    <p>So remember:</p>
    
    \[ \begin{eqnarray*}
    r&=& \pm1 &\implies \text{strong correlation} \\
    r&=& 0 &\implies \text{weak correlation}
    \end{eqnarray*} \]
    
    <h3>Correlation Matrices (Multiple Correlation)</h3>
    <p>We know that correlation is a measure of dependence between two variables. However, there may be times when you want to examine multiple variables at once. In cases like this, it may be useful to create a <span class="dt">correlation matrix</span>. This is simply a lower-triangular matrix of correlations among multiple variables.</p>
    
    <p>For instance, let's say that I want to see how adiposity in different parts of the body correlate. I may do something like:</p>
    
    <pre class="brush: r">
as.dist(cor(bodyFat))

           Neck   Chest  Abdomen      Hip
        +--------------------------------
  Chest | 0.766                             
Abdomen | 0.728   0.911
    Hip | 0.705   0.823    0.860          
  Thigh | 0.668   0.708    0.736    0.881
    </pre>
    
    <p>Here we can see the correlations between Neck, Chest, Abdomen, Hip, and Thigh adiposity&mdash;ranging from 0.67 to 0.91. However, what if we wanted to visualize these correlations as scatterplots?</p>
    
    <pre class="brush: r">
pairs(~Neck+Chest+Abdomen+Hip+Thigh,data=bodyFat,upper.panel=NULL)
    </pre>
    
    <img src="assets/correlationMatrix.jpeg" "width="700px" height="366px" />
    
    <p>Finally, we will likely want to assess the significance of these correlations. To do so, we will have to install the Hmisc package:</p>
    
    <pre class="brush: r">
install.packages("Hmisc")
library(Hmisc)
rcorr(as.matrix(bodyFat))
    </pre>
    
    <p>This will return all bivariate correlations and levels of significance for the specified matrix. (NB: The data must be input as a matrix for this function to work. If you are using a data frame, first pass it through the as.matrix() function.)</p>
    
    <h3>Partial Correlations</h3>
    <p>In our previous section, we looked at correlations among multiple variables. These were all referred to as <span class="dt">bivariate correlations</span> because each correlation only looked at exactly two variables. However, we saw that each of those 5 variables correlated significantly with each of the others. So it may be more appropriate to conduct a <span class="dt">partial correlation</span>: this will take two variables&mdash;say, Neck and Chest&mdash; and measure their degree of association after controlling for the effect of Abdomen, Hip, and Thigh. Doing so gives the result:</p>
    
    <pre class="brush: r">
source("http://www.yilab.gatech.edu/pcor.R")

neck <- bodyFat$Neck
chest <- bodyFat$Chest
others <- subset(bodyFat, select=c(Abdomen:Thigh))

pcor.test(neck,chest,others)

   estimate      p.value  statistic    n
      0.344      9.7e-09       5.73  249
    </pre>
    
    <p>We can see that the observed correlation drops from \(r=0.766\) with the bivariate correlation to \(r=0.344\) with the partial correlation. This means that, when we control for the effects of Abdomen, Hip, and Thigh adiposity, neck and chest still covary significantly with a correlation of about 0.34.</p>
    
    <h3>Sensitivity to the Data Distribution</h3>
    <p></p>
    
    <h3>Some Considerations: Causality and Linearity</h3>
    <h4>Causal Inferences</h4>
    <p>Importantly, one cannot make causal inferences from correlational designs: if you think back to the chapter on research design, for a causal inference to by justified, there must be (1) temporal precedence; (2) covariation; and (3) nonspuriousness. Here, we violate the first and third assumptions. Regarding temporal precedence, neither of the measures that we are looking at clearly precedes the other: the measurements could be made simultaneously; one could always occur before the other; or the order of occurrence could be random at each point of measurement. Additionally, correlational studies don't have any control or experimental conditions in place to ensure that potential confounding variables are controlled for and don't give rise to spurious correlations.</p>
    
    <p>Given these concerns, we are only able to say that Variable A and Variable B tend to covary: that is, when one changes in a certain way, the other is likely to change in a certain way. For instance, consider height and weight. Let's say that there is a positive correlation between the two (i.e., that taller people tend to weigh more and that people who weigh less tend to be shorter). We can say that someone who is 6'1" is likely to weigh more than someone who is 4'10"; however, it becomes silly to say that if someone loses weight, he or she will start shrinking in height. Likewise, by gaining weight, no one will ever grow taller. There is a general trend of the data; however, this does not mean that a change in one ever causes a change in the other.</p>
    
    <h4>Linearity of the Relationship</h4>
    <p>Another consideration when looking at correlations is the relationship between the two variables of interest. Namely, there must be a linear trend. In this context, a linear trend is going to mean that every time Variable A changes by \( x \) units, Variable B will change by \(y\) units. For instance, take these four plots:</p>
    
    <img src="assets/correlationLinearity.jpeg" width="700px" height="366px" />
    
    <p>Here we have four different relationships between our two variables with the same regression line plotted against all of them. As far as a correlation is concerned, the data follow that solid line.</p>
    
    <h4>Sensitivity to the Distribution</h4>
    <p>Also important is the sensitivity of </p>
    
    <h2>Case Study: National Education Trends</h2>
    <hr>
    
    <p>First let's go ahead and download our data from GitHub:</p>

    <pre class="brush: r">
# This will let us download the file from a remote URL

download.file(
    "https://raw.githubusercontent.com/faulconbridge/appliedStats/gh-pages/part1/data/correlationCaseStudy.csv",
    "census.csv","wget",extra="--no-check-certificate")

# And now we will read the data into R and store it
# in a data frame called "data"

data <- read.csv("census.csv",header=TRUE,sep=",")
    </pre>
    
    <p>Now, we have two columns that we're interested in: highSchoolorHigher and perCapitaIncome. We would like to see if there is a relation between a state's per capita income and the proportion of its residents to have completed high school or higher. So let's start by constructing a scatterplot of the two variables:</p>
    
    <pre class="brush: r">
# Notice, when we reference a column we use the syntax
# dataset$column. The first half tells R which data set
# we are referencing, the dollar sign indicates that we
# want to reference a specific column, and everything
# after that is the column name itself.

plot(data$HighSchoolOrHigher,data$perCapitaIncome,
     xlab="Proportion with HS diploma or higher",
     ylab="Per capita income (dollars)",
     main="Scatterplot of Education by Per Capita Income")

# We can also plot a line of best fit:

fit <- lm(data$perCapitaIncome~data$HighSchoolOrHigher)
abline(fit)
    </pre>
    
    <img src="assets/correlationCaseStudy.jpeg" width="700px" height="366px" />
    
    <p>As we can see, there appears to be a positive linear relationship between per capita income and the proportion of a state's residents having a high school diploma or higher. Our next step is then to quantify the strength of this relationship. To do this, we will perform a bivariate correlation</p>
    
    <pre class="brush: r">
# The syntax for a correlation test in R is easy:
# it is cor.test(var1, var2) where var1 and var2
# are the two variables that you're interested in.

cor.test(data$perCapitaIncome,data$HighSchoolOrHigher)

  Pearson's product-moment correlation

data:  data$perCapitaIncome and data$HighSchoolOrHigher
t = 2.7752, df = 49, p-value = 0.007788
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.1034750 0.5847427
sample estimates:
      cor 
0.3685491 
    </pre>
    
    <p>As we can see, there are several noteworthy items presented in this table. Firstly, we have a <em>t</em>-statistic of 2.78. This is above the 1.96 threshold that we set, indicating that our correlation is probably going to be significant. From there, we can look at our <em>p</em>-value (0.008) and see that it is below the 0.05 threshold, indicating that we do indeed have a significant correlation.</p>
    
    <p>If it weren't obvious from the scatterplot above, this is a positive correlation with a Pearson's r=0.37, meaning that there exists a fair positive relationship between our two variables. I.e., when one is larger, the other will also tend to be larger.</p>
    
    <h2>Exercises</h2>
    <hr>
    
    <ol>
      <li>Download the <a href="https://raw.githubusercontent.com/faulconbridge/appliedStats/master/part2/data/correlationEx01.csv" target="_blank">Patient Satisfaction data set</a> from GitHub. This dataset contains information from patients surveyed at various hospitals following their treatment to assess their satisfaction with the experience. We will be using these data for the following exercises.</li>
      <li>Do patient ratings for nursesCommunicateWell and doctorsCommunicateWell correlate with one another? Provide evidence to back up your answer. Include a scatterplot of the data.</li>
      <li>Now perform a partial correlation between those two same variables, but controlling for givenInformationAboutRecovery and staffExplainedMedications.</li>
      <li>Create a lower-diagonal correlation matrix correlating all of the variables included in the dataset (except for the hospital ID). What correlations are significant? Are there any that are non-significant? (NOTE: You will have to remove null values using the na.omit() function for this to work properly.</li>
      <li>Construct a scatterplot matrix of all bivariate correlations using the code:
      <pre class="brush: r">
pairs(~nursesCommunicateWell + doctorsCommunicateWell + receivedImmediateHelp +
      painManagedByTreatment + staffExplainedMedications + bathroomsAlwaysClean +
      givenInformationAboutRecovery + rateHospitalPositively,
      data=ex01, upper.panel=NULL)
      </pre>
      
      Do any of the scatterplots look concerning? Look for outliers, non-linear trends, etc.</li>
      <li><span class="dt">Test yourself:</span> Choose two new variables and performa bivariate correlation test. Do they correlate significantly? Do you think there are any other variables that should be controlled for? If so, perform a partial correlation, controlling for those additional variables. Do the results differ? Explain why they do. Comment on the assumptions made by the correlation tests you have run. Are they met? Are any violated?</li>
      <li>Download the <a href="https://raw.githubusercontent.com/faulconbridge/appliedStats/master/part2/data/correlationCaseStudy.csv" target="_blank">Census American Community Survey</a> from GitHub. This dataset, used in the case study above, contains information about employment and other demographic characteristics nationwide.</li>
      <li>Is there a correlation between noHighSchoolDiploma (the proportion of residents without a HS diploma or GED equivalent) and publicTransit (the proportion of residents who use public transit to go to and from work)?</li>
      <li>Is there a correlation between HighSchoolOrHigher and percentOnSNAP? Justify your findings and include at least one figure.</li>
      <li>Is there a correlation between medianRent and percentImpoverished? Are there any variables we might want to control for using a partial correlation?</li>
      <li><span class="dt">Test yourself:</span> Choose some (or all) of the variables in this dataset and make a correlation matrix for them. Choose a correlation that looks interesting or surprising and investigate it further. If applicable, perform a partial correlation test rather than a bivariate correlation.</li>
    </ol>
    
    <h2>Additional Resources</h2>
    <hr>
    <ol>
      <li><a href="data/" target="_blank">All data sets</a> used in the chapter</li>
      <li><a href="RScripts/" target="_blank">All R scripts</a> used in the chapter</li>
      <li><a href="answers/correlation.html" target="_blank">Answer key</a> to the chapter's exercises</li>
    </ol>

<?php
  require_once("../footer.php");
?>