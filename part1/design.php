<?php
  $part = "part1";
  $title = "Research Design";
  require_once("../header.php");
?>
    <h2>Relating Design and Analysis</h2>
    <hr>
    
    <h3>Garbage In, Garbage Out</h3>
    <p>This is a book about applied statistical analysis. So why are we including a whole chapter on considerations for designing your experiments?</p>
    
    <p>It's simple: if your experimental design is bad, or your data collection methods are bad, then your results will be bad. Choosing an appropriate statistical analysis, although that's the crux of this book, does not guarantee that you will walk away with interpretable, generalizable results. For that, you need a well-designed experiment.</p>
    
    <p>One of the biggest reasons that experiments are ever conducted is to evidence (or at least plausibly suggest) a causal link between one or more variables and a particular outcome. To do this, we design experiments with various control and experimental groups, all of which we assume are <span class="dt">probabilistically equivalent</span>. This means that we know the probability of finding a difference between any of our groups on the basis of pure chance alone. That is, this allows us to believe that just because we find a difference between two groups on one variable, we cannot infer anything about differences among other variables. In turn, this (1) assures us that our findings are due to differences in the treatment and not in the participants and (2) let's us generalize our results to larger populations.</p>
    
    <p>However, to do this, we need to ensure that our studies are both internally and externally valid. <span class="dt">Internal validity</span> refers to our ability to justify our conclusions: it is what enables a researcher to establish a causal link between a treatment and an effect. <span class="dt">External validity</span> is an extension of this: it is our ability to take our causal inferences and apply them to populations (rather than only to the sample used in a study).</p>
    
    <h2>Designing Sound Experiments</h2>
    <hr>
    
    <h3>Internal Validity</h3>
    <p>Again, <span class="dt">internal validity</span> reflects the ability of a researcher to draw causal conclusions from a study. Generally, for a study to be internally valid, it must broadly satisfy three conditions:</p>
    
    <ol>
      <li>Temporal precedence (the cause precedes the effect);</li>
      <li>Covariation (the cause and effect are related); and</li>
      <li>Nonspuriousness (there are no other plausible explanations for the observed effect).</li>
    </ol>
    
    <p>Unfortunately, there are a number of practices that can threaten a study's internal validity. A short list of these is included below.</p>
    
    <h4>Confounding</h4>
    <p>A confounding variable is one that is not controlled for by the experimenter, yet that correlates with both the dependent and independent variables. This may result in the appearance of a relationship between the two variables when in actuality neither impacts the other, but both are mediated by a third variable. This is termed a <span class="dt">spurious relationship</span>. For instance, if we look at U.S. spending on science and technology and the number of suicides by hanging, strangulation, and suffocation from 1999 through 2009:</p>
    
    <img src="assets/spuriousCorr.jpeg" width="700px" height="366px" />
    
    <p>we see that they correlate. And pretty highly. But that's also an idiotic relationship: U.S. spending on science and technology has no effect on the number of suicides by hanging each year. The fact that these two variables correlate is either purely coincidental or mediated by some third variable that we haven't considered. (For instance, over that 10-year span, the U.S. has experienced both inflation&mdash;about 28%&mdash;and population growth&mdash;about 13%&mdash;that would each cause the increases that we see in our two variables.)</p>
    
    <p>Yet, if we ignore the absurdity of it and only look at the statistics, we see that there is a highly significant correlation between the two (r = 0.99; t = 23.90; <em>p</em>-value < 0.001). That's probably the best correlation (or at least the highest Pearson's r) you'll see in your natural-born life. Without context, that would be a highly convincing correlation. Yet, as soon as we stop and think about this, it becomes clear that this is likely a spurious relationship.</p>
    
    <p>Unfortunately, in many cases, spurious relationships will not be so obvious. As such, the researcher must be careful to randomly select his or her study participants and to carefully control for the manipulated factors in the study to prevent the influence of uncontrolled factors.</p>
    
    <h4>Selection Bias</h4>
    <p>Selection bias is likely one of the more (if not the most) common threats to the internal validity of a study. The idea here is that the sample of participants is not truly a random and representative sample. (I.e., not every possible participant has an equal chance of being selected for the study and certain groups will be overreprsented while other groups may not be represented at all.) Two common practices that create this type of bias are convenience sampling and voluntary response sampling.</p>
    
    <p><span class="dt">Convenience sampling</span> refers to the practice of only using as your sample pool participants who are easy to reach; <span class="dt">voluntary response sampling</span> allows participants to opt in to your study. Unfortunately, these both may skew results, and yet are also common practices in many of the social sciences. Take a psychological experiment, for example: we allow convenience sampling by drawing from the pool of students currently enrolled in an introductory psych course. This pool of participants is neither representative of the university as a whole, nor necessarily generalizable across other universities or to the national population as a whole. Further, these students are usually allowed to choose the studies in which they would like to participate, resulting in voluntary response sampling.</p>
    
    <p>Although neither is necessarily enough to skew the results of a study to the point of it being flatly wrong, considerations such as these do limit the generalizability of one's study. (We'll discuss this more in depth below under the <span class="dt">Sample Limitations</span> heading.)</p>
    
    <p>When conducting a study, there are various strategies that you can use to help ensure a representative sample is chosen. A brief list of these includes:</p>
    
    <ol>
      <li><span class="dt">Simple Random Sampling</span> &mdash; This implies that everyone in a population has an equal probability of being selected. For instance, say that we want to choose 100 students out of a university with 2000 students. A way to simple randomly sample these students would be to put every student's name into a hat and draw 100 names at random without replacemens (i.e., not putting a name back into the hat after it has been drawn). This would give any individual student a 1-in-20 (5%) chance of being selected.</li>
      <li><span class="dt">Systematic Sampling</span> &mdash; If you're familiar with Latin, you'll recognize that the English word "decimate" derives from the Latin "decimus" (meaning "tenth"). Originally, this referred to the practice of killing every tenth soldier in a mutinous legion. (Happy, right?) Systematic sampling is similar: given a pool of applicants of size \( N \), and knowing that you want \( n \) participants in your study, you choose every \(k^{th} \) individual from the pool where \(k=\frac{N}{n}\). So if we wanted 20 subjects out of a pool of 600, we would arrange them all into a list and pick every 30<sup>th</sup> person (\(\frac{600}{20}\)) on that list.</li>
      <li><span class="dt">Stratified Random Sampling</span> &mdash; Simplifying the actual selection strategies a bit, a stratified random sample is composed of a random sample of participants from different strata of a population (e.g., age group; ethnicity; etc.). Each stratum should be mutually-exclusive (i.e., no individual should be in multiple strata).</li>
      <li><span class="dt">Cluster Sampling</span> &mdash; Here, the total population is divided into <a href="http://en.wikipedia.org/wiki/Data_clustering" target="_blank">clusters</a>. A simple random sample of these groups is selected and from these groups a simple random sample of participants is selected.</li>
    </ol>
    
    <h4>History</h4>
    <p>Unfortunately, history is one of the few threats to internal validity that researchers cannot always control for. Occasionally, events outside the scope of an experiment may impact participants' responses to the experiment. (For example, Americans' attitudes to U.S. clandestine operations would probably have differed dramatically if a researcher asked immediately before 9/11 versus immediately after, regardless of the experimental manipulation.)</p>
    
    <h4>Maturation/Mortality</h4>
    <p>In longer-term studies, participants may change significantly between measurements (e.g., the concentration of children at 4 years versus 5 years old). Additionally, participants may (and likely will) drop out of longitudinal studies. This is unavoidable; however, should be an important factor for a researcher conducting this type of study to consider and attempt to control for.</p>
    
    <h4>Testing Effects</h4>
    <p>When participants are given the same (or a similar) test at multiple points in time (e.g., pretesting and posttesting), participant responses on later tests may change as a function of having been already exposed to the measure. For instance, participants may remember questions and their correct answers; they may know what a "good" or "bad" response is; etc. In some cases, steps can be taken to identify whether testing effects have biased participant responses (such as a <a href="http://www.bing.com/search?q=solomon+four-group+design" target="_blank">Solomon four-group design</a>).</p>
    
    <h4>Experimenter bias</h4>
    <p>As must as experimenters wish to be objective, we do all have some hypothesis or other that we want to see confirmed or refuted. These personal biases may affect the way in which we interact with participants in experimental and control groups, and by doing so bias their responses or our interpretation of their responses. In many cases this can be eliminated by automating the testing and scoring process and by conducting double-blind experiments in which neither the participant nor the researcher knows which testing group the participant is in.</p>
    
    <h3>External Validity</h3>
    <p>Given that we can draw causal inferences from our research, we may also want to generalize those results to broader populations. However, researchers often use very specialized populations (college students; psychiatric populations; etc.) that may not be representative of larger groups, or </p>
    
    <h4>Treatment Interactions</h4>
    <p>Occasionally, an experimental effect may only be observed when multiple treatments interact, or when a treatment interacts with a non-experimental variable such as setting or participant selection. Perhaps the effect only exists in a certain physical location or in an experimental setting (and not in everyday life).</p>
    
    <h4>Order Effects</h4>
    <p>In addition to randomizing the selection of participants, researchers should be careful, when possible, to randomize the order of treatment. Specifically, if a participant receives Treatment A and then Treatment B, her response may be different than it would have been had she received Treatment B before Treatment A. By randomizing the treatment order, researchers are able to control for this.</p>
    
    <h4>Hawthorne Effect</h4>
    <p>Also known as the observer effect, this is a phenomenon by which individuals act differently while being observed than they would otherwise.</p>
    
    <h4>Rosenthal Effect</h4>
    <p>Similar to the Hawthorne Effect, this refers to a tendency for individuals to perform better the more expectation is placed on them to succeed.</p>
    
    <h4>Sample Limitations</h4>
    <p>This may refer both to the size and makeup of a researcher's sample. If the number of participants is too small, there is greater risk of sampling error and selecting a non-representative sample from the available pool of participants. Alternately, the participants' intrinsic characteristics (e.g., age, sex, race, education, etc.) may not be representative of the population that a researcher is attempting to study and to reach general conclusions about.</p>

<?php
  require_once("../footer.php");
?>