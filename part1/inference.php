<?php
  $part = "part1";
  $title = "Introduction to Statistical Inference";
  require_once("../header.php");
?> 
    <h2>What Is Statistical Inference</h2>
    <hr>
    
    <h3>Its Purpose</h3>
    <p>Statistical inference provides formalized methods for drawing conclusions about a population from sample data. That is, stastical inference refers to the whole suite of quantitative tools that we have developed to test data-driven hypotheses, accounting for random variation in those data. These are the tools that we will spend the remainder of the book discussing in some degree of depth.</p>
    
    <p>We have developed these statistical models to make predictions about populations and to draw conclusions about differences between populations. These lie in contrast to both descriptive statistics and purely qualitative methods. More correctly, we might say that all three lie on a spectrum with qualitative measures being employed to provide a very general overview of a topic without seeking to address substantive differences among populations or to predict future trends. Oftentimes this type of research is used to inform later quantitative studies by providing new directions for research based on participant opinions, beliefs, and feedback.</p>
    
    <p>Squarely in the middle lie descriptive statistics: these provide a descriptive overview of a set of data; however, they are not (in and of themselves) able to predict trends or quantify difference. It is only when they are applied in the context of statistical models that they can be used to reach decisive conclusions from and about our data.</p>
    
    <h3>Hypotheses for Means</h3>
    <p>In statistical inference, we often form hypotheses about our data. These will generally take the form of a null and alternative hypothesis. Alternative hypotheses may be one- or two-sided. The null hypothesis (abbreviated \(H_0\); pronounced "H-null") always predicts that there is no difference between our control and treatment groups (i.e., \(H_0: \mu=\mu_0\) where \(\mu\) is the mean of our treatment group and \(\mu_0\) is the mean of the control group). Predictably, the alternative hypothesis (\(H_A\); pronounced "H-A") predicts that a difference in our two groups exists. If one-sided, it predicts a direction of the difference (e.g., \(H_A: \mu > \mu_0\); two-sided hypotheses predict only that a difference exists, but are agnostic as to the direction of that difference (\(H_A: \mu \neq \mu_0\)).</p>
    
    <p>We also operate with the understanding that is easier to prove something as false than as true. Given this, the null hypothesis is always presumed true until suficient evidence is found supporting the alternative hypothesis. Importantly, though, we do not ever formally accept the null hypothesis: we may only fail to reject it. (Recall again that most inferential statistics seek to disprove a hypothesis rather than prove it.) In this way, we may fail to reject the null hypothesis, but never accept it. (However, we may accept the alternative hypothesis. By disproving the null, we are demonstrating that its converse must, by that fact, be true.)</p>
    
    <h3>Test Statistics and Statistical Significance</h3>
    <p>Whenever we perform a statistical test, we are usually given two important pieces of data: a test statistic and a p-value. Standardized test statistics can take a number of different forms (z-, t-, and F-statistics are three of the more common) and each has a slightly different interpretation. However, speaking generally, every <span class="dt">test statistic</span> is a single, quantified measure for assessing patterns in the data that distinguish between the null and alternative hypotheses.</p>
    
    <p>Accompanying this test statistic is the <span class="dt">p-value</span>. Universally, this measure has a single interpretation: it is the probability (from 0 to 1, inclusive) that the differences observed in the data arise due to chance and natural random variation. As such, smaller p-values indicate that there is a smaller probability of the differences seen being due to chance. Many disciplines impose a "5% rule" on this statistic: that is, they consider any p-value less than 0.05 (or 5%) as being statistically significant.</p>
    
    <p>We use the term <span class="dt">statistically significant</span> to indicate that we are reasonably confident that the differences observed in the data are in fact due to an experimental manipulation or some actual difference between the groups we're looking at. There is no specific reason for using a threshold of 5%&mdash;and indeed sometimes a 1% or 0.1% cutoff will be used instead&mdash;; however, this is the most commonly-agreed-upon threshold for describing a test as significant.</p>
    
    <p>One further consideration when performing statistical tests is that statistical significance is not the same as practical significance. Two sets of data can easily be statistically significant without being practically significant. As an example, consider patient scores on a depression questionnaire: groups from two different clinics may have significantly different scores, but if the mean scores still classify both groups as chronically depressed, a couple-point difference doesn't make a particularly meaningful impact on either group's treatment. As such, it may often be important to distinguish between what differences are statistically significant and what differences have a practical, meaningful significance.</p>
    
    <p>Statistical tests will also typically provide a <span class="dt">confidence interval</span> for the true parameter value. That is, this measure gives a range that, with some percent confidence, should contain the "true" value that the researcher is trying to measure. For example, if a researcher wished to know if there was a difference in average heights of boys and girls at age 8, a 95% CI from 0.3 &ndash; 0.9 would indicate that there was a 95% chance that the true mean difference in height (i.e., if we measured the height of every 8-year-old boy and girl in the world) was between 0.3 feet (or 4 inches) and 0.9 feet (or 10.8 inches). Given that this confidence interval doesn't contain 0 (which would indicate that there is no difference in heights), we can likely assume that there does exist a difference in mean height between our two populations.</p>
    
    <h2>Some Considerations about Statistical Inference</h2>
    <hr>
    
    <h3>Conditions for Inference</h3>
    <p>For our conclusions about statistical tests to be valid, there are always assumptions that need to be met about the data. These assumptions differ from test to test; however, they generally require a random sample (or at least a representative sample) of the population to have been selected. Many times the test will also require that the data not be significantly skewed by outliers or that samples have equivalent variance. In any case, with each test presented we will clearly outline the assumptions that must be met as well as those that should be met but that can be violated without necessarily invalidating the test.</p>
    
    <h3>Cautions about Significance Tests</h3>
    <h4>How Small a p-value?</h4>
    <p>As mentioned above, the magnitude of a p-value needed for a result to be called "significant" is arbitrary: 5% simply happens to be what is widely agreed upon. However, this still means that 1 out of every 20 experiments will tell the researcher that a significant difference exists when there actually isn't one. If we use a 1% threshold, that drops to 1 in every 100 trials. Still more stringent is 1 in 1000 trials, or a 0.1% cutoff. But how small or large a p-value do we really need to convince us of an effect?</p>
    
    <p>Many times, a much smaller p-value will be needed to refute a well-established theory. However, if you are exploring a new program of research, larger p-values may be fine if they are simply exploratory analyses that will be used to indicate potential avenues for further research.</p>
    
    <h4>The Danger of Multiple Tests</h4>
    <p>When performing statistical analyses, if a researcher analyses the data enough different ways, eventually he or she will obtain statistically significant results. By sheer chance, this is bound to at some point happen. However, one significant result among 20 non-significant results does not constitute strong evidence against a null hypothesis. Rather, this is a process knows as p-hacking: the practice of waiting until a researcher finds an analysis that will produce a favorable result and then reporting that test as definitive evidence in favor of his or her hypothesis.</p>
    
<?php
  require_once("../footer.php");
?>