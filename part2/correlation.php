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
    
    <h3>Scatterplots with Categorical Variables</h3>
    <p></p>
    
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
    
    <h3>Correlation Matrices (Multiple Correlation)</h3>
    <p></p>
    
    <h3>Partial Correlations</h3>
    <p></p>
    
    <h3>Sensitivity to the Data Distribution</h3>
    <p></p>
    
    <h3>Some Considerations: Causality and Linearity</h3>
    <p></p>
    
    <h2>Case Study: National Education Trends</h2>
    <hr>
    
    <p>First let's go ahead and download our data from GitHub:</p>

    <pre>
      <code>
# This will let us download the file from a remote URL

download.file(
    "https://raw.githubusercontent.com/faulconbridge/appliedStats/gh-pages/part1/data/ch06CaseStudy.csv",
    "census.csv","wget",extra="--no-check-certificate")

# And now we will read the data into R and store it
# in a data frame called "data"

data <- read.csv("census.csv",header=TRUE,sep=",")
      </code>
    </pre>
    
    <p>Now, we have two columns that we're interested in: highSchoolorHigher and perCapitaIncome. We would like to see if there is a relation between a state's per capita income and the proportion of its residents to have completed high school or higher. So let's start by constructing a scatterplot of the two variables:</p>
    
    <pre>
      <code>
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
      </code>
    </pre>
    
    <img src="assets/ch06CaseStudy.jpeg" width="700px" height="366px" />
    
    <p>As we can see, there appears to be a positive linear relationship between per capita income and the proportion of a state's residents having a high school diploma or higher. Our next step is then to quantify the strength of this relationship. To do this, we will perform a bivariate correlation</p>
    
    <pre>
      <code>
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
      </code>
    </pre>
    
    <p>As we can see, there are several noteworthy items presented in this table. Firstly, we have a <em>t</em>-statistic of 2.78. This is above the 1.96 threshold that we set, indicating that our correlation is probably going to be significant. From there, we can look at our <em>p</em>-value (0.008) and see that it is below the 0.05 threshold, indicating that we do indeed have a significant correlation.</p>
    
    <p>If it weren't obvious from the scatterplot above, this is a positive correlation with a Pearson's r=0.37, meaning that there exists a fair positive relationship between our two variables. I.e., when one is larger, the other will also tend to be larger.</p>
    
    <h3></h3>
    <p></p>
    
    <h3></h3>
    <p></p>
    
    <h3></h3>
    <p></p>
    
    <h3></h3>
    <p></p>
    
    <h2>Exercises</h2>
    <hr>
    
    <h2>Additional Resources</h2>
    <hr>
    
    
    
<?php
  require_once("../footer.php");
?>