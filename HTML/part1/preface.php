<?php
  $part = "part1";
  $title = "Preface";
  require_once("../header.php");
?>
    <h2>Introduction to the Book</h2>
    <hr>
      
    <h3>About the Author</h3>
    <p>Christopher Wetherill is currently a PhD student in Virginia Tech's <a href="http://www.tbmh.vt.edu" target="_blank">Translational Biology, Medicine, and Health</a> program. He received his undergraduate degree from John Carroll University. He has consulted with individuals and nonprofits on experimental design and statistical analyses since 2012. He recently edited <em><a href="https://infoactive.co/ebook" target="_blank">Data. Design. A simple introduction to preparing and visualizing information</a></em>, a Creative Commons-licensed ebook detailing best practices for survey design and data collection and presentation.</p>
    
    <h3>Structure of the Book</h3>
    <p>This book is split into four main sections: an introduction to statistical inference; regression tools; comparisons of means among several samples; and working with unusual data structures. By and large, no part or chapter requires any existing knowledge of any previous part of chapter. The one exception to this is the introductory material: if you are not comfortable with the basic ways in which we quantify uncertainty, then you will struggle with the rest of the material. If you do not have a firm grip of the basics of statistical inference, or if you haven't thought about this in a while, you should probably take an afternoon to refresh yourself.</p>
    <p>Each chapter in this book follows the same general structure: we begin with an introduction to the topic and considerations of when and how a given test should be applied, what are its limitations, and what conditions it assumes are met. We then provide a sample case study, including all relevant background information and a complete analysis and write-up of the data. Finally, we include a summary of how to implement the test using the statistical software R and conclude with a number of comprehension exercises and data sets to be analyzed.</p>
    <br />
    
    <h2>To the Student</h2>
    <hr>
    
    <h3>What You Will Learn</h3>
    <p>You shouldn't expect this book to make you an experienced statistician. That isn't what it's meant to do. Rather, this book aims to explain statistical analyses and their output in a way that is easily-digested by individuals without a strong mathematical or statistical background or who have previously had bad experiences with statistics and have shied away from the subject. The hope is that, after going through this book, you will be able to (1) understand when to apply a number of the most commonly-used statistical tests; (2) accurately construct and run the tests; and (3) easily interpret and report the output of these analyses to both technical and non-technical audiences.</p>
    
    <p>There may still be a point at which you do need to consult a professional statistician: in fact, this book tries to emphasize recognizing your limits and when it may be appropriate to seek outside help. When this is the case, you should still be better-equipped to present your data and whatever analyses have already been run, and to explain the central problems that you are trying to solve easily and effectively.</p>
    
    <h3>Case Studies and Exercises</h3>
    <p>Each statistical analysis presented is accompanied by one or more case studies in which we perform a complete analysis of a given data set, highlight the relevant output and how to interpret it, and give a full APA-style write-up of the analysis and results. All data used are real (unless otherwise specifically noted), and where possible we link to the original study or other supporting materials. The full data used in the analyses will always be provided so that the reader is able to perform the analysis alongside us and can confirm his or her results.</p>
    <p>Likewise, all exercises are taken from real-world problems and all original supporting materials that can be provided are. For data analysis problems, we do not provide a full stepwise write-up of the analysis: only a summary of the results that should be obtained. If your results do not agree with our answers, you are always welcome to open an <a href="https://github.com/faulconbridge/appliedStats/issues" target="_blank">issue on GitHub</a>. If you do, please properly format any R code that you choose to include: <a href="https://guides.github.com/features/mastering-markdown/" target="_blank">GitHub-flavored Markdown</a> makes this easy to do.</p>
    
    <h3>Mathematical Background</h3>
    <p>This book doesn't assume that the reader has any strong mathematical background: the emphasis of this book is on identifying, running, and interpreting appropriate statistical analyses for the data that you are working with, and not on the statistical theory that informs these tests. However, to have a good understanding of these analyses, the reader will occasionally need to learn and understand a few mathematical formulas. When these are presented, they are always accompanied with a non-technical explanation.</p>
    
    <h3>Recommended Software</h3>
    <p>All analyses presented in this book are implemented by the author using <a href="http://cran.r-project.org/mirrors.html" target="_blank">The R Project for Statistical Computing</a> and <a href="http://rstudio.com" target="_blank">R Studio</a>, a graphical user interface for R. We chose R because, unlike SAS, SPSS, STATA, MiniTab, etc., it is entirely open-source, meaning that it is free for anyone to use and even contribute back to. Further, analyses run in R are easily reproducible: that is, it is very easy to take the code that we use to run an analysis in a case study, paste it into R, and get the exact same results that we do.</p>
    <p>We understand that different statistical packages have different interfaces and very different ways of presenting analysis results. And although we only document R in this book, we do our best to give you links to additional resources that explain how to run and interpret the analysis using other popular commercial stats packages. If you're ever desperate to run an analysis in another statistical package and we don't provide links to help you, you're welcome to open an <a href="https://github.com/faulconbridge/appliedStats/issues" target="_blank">issue on GitHub</a>, although we can't promise that we will have a good answer for you.</p>
    
    <h3>Common Statistical Terms</h3>
      <span class="dt">Statistic: </span> <span class="dd">Any quantity that can be calculated from a set of data.</span> <br />
      <span class="dt">Population: </span> <span class="dd">The collection of all possible measurements taken. For example, "the heights of every 12-year-old boy in America" or "all automobiles with three wheels."</span><br />
      <span class="dt">Sample: </span> <span class="dd">A subset of a population. For example, "the heights of 100 12-year-old boys from Ohio" or "20 tricycles bought from Toys-R-Us."</span><br />
      <span class="dt">Parameter: </span><span class="dd">A statistic referring to a population. This is usually denoted by a Greek letter.</span><br />
      <span class="dt">Estimate: </span><span class="dd">A statistic referring to a sample. This is a "best guess" at the parameter for the population. Estimates are denoted by either a hat or a Roman letter.</span><br />
      <span class="dt">Mean: </span><span class="dd">The arithmetic mean of a set of data. When referring to the parameter, we denote this \( \mu \); when referring to the estimate, we denote this \( \bar{x} \) (pronounced "x-bar") or \( \hat{\mu} \) (pronounced "mu-hat").</span><br />
      <span class="dt">Standard Deviation: </span><span class="dd">A measure of how far dispersed observations are from their mean. Denoted \( \sigma \) when referring to the parameter or \( s \) for the estimate.</span><br />
      <span class="dt">Standard Error: </span><span class="dd">The standard deviation of the sampling distribution of a statistic. Denoted \( s.e. \) or \( SE \).</span>
    
    <h3>Additional Resources</h3>
      <p>Additional resources are provided at the end of every chapter. These will usually include:</p>
      <ul>
        <li>A link to the answer key for the chapter's exercises;</li>
        <li>Links to resources for performing the chapter's analyses in other statistical packages;</li>
        <li>Our references for writing the chapter and further readings if you would like a more advanced knowledge of the analyses covered;</li>
        <li>A link to all data sets and other supporting materials used and referenced in the chapter and end-of-chapter exercises;</li>
        <li>And any other miscellaneous material that we think might be helpful to you.</li>
      </ul>
      
  </div>
<?php
  require_once("../footer.php");
?>
  
