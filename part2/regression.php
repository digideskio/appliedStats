
<?php
  $part = "part2";
  $title = "Simple Linear Regression";
  require_once("../header.php");
?>
    <h2>Overview of Simple Linear Regression</h2>
    <hr>
    
    <h3>Uses of Simple Linear Regression</h3>
    <p>In the last chapter we touched briefly on the idea of using the value of one variable to predict the value of another. Where correlation is used to describe the magnitude of the relatinoship between two variables, a tool called <span class="dt">simple linear regression</span> takes that relationship and uses it to predict the values of Variable B, given some arbitrary value of Variable A. In this context, however, we refer to the \(x\) variable as our <span class="dt">explanatory variable</span> or our <span class="dt">regressor</span> and to the \(y\) variable as the <span class="dt">response variable</span>.</p>
    
    <h3>Least Squares Fitting</h3>
    <p></p>
    
    <script src="js/jquery-1.4.4.min.js"></script>
    <script src="js/jquery.scianimator.min.js"></script>
    
    <div id="least_squares" style="display: inline-block;"></div>
    
    <script src="js/least.squares.js"></script>

    
    <h3>Coefficient of Determination</h3>
    <p></p>
    
    <h3>Residuals</h3>
    <p></p>
    
    <h2>Cautions and Considerations</h2>
    <hr>
    
    <h3>Basic Assumptions</h3>
    <p></p>
    
    <h3>Outliers and Influential Points</h3>
    <p></p>
    
    <h2>Case Study: [STUDY]</h2>
    <hr>
    
    <h2>Exercises</h2>
    <hr>
    
    <h2>Additional resources</h2>
    <hr>
<?php
  require_once("../footer.php");
?>