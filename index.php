<?php
  $title = "Applied Statistics";
  require_once("header.php");
  require_once("chapters.php");
  $count = 1;
?>
    <h1 class="title">Applied Statistics</h1>
    <h2 class="title">An Introduction to Statistical Analysis</h2>
    
    <p>This book is provided under the terms of the <a href="http://book.chriswetherill.me/license" target="_blank">Apache License, Version 2.0</a>. Not all datasets used throughout the book may be under this license; in such cases, the terms of use will be clearly stated on GitHub. To edit <a href="https://github.com/faulconbridge/appliedStats" target="_blank">this version</a>, you will need a <a href="https://github.com/" target="_blank">GitHub account</a>.</p>
    
    <h2>Introduction</h2>
    <hr>
    
    <?php
      for ($i = 0; $i < count($index["part1"]); $i++) {
        echo "<h3><a href=\"".$index["part1"][$i]["link"]."\">".$count." &mdash; ".$index["part1"][$i]["title"]."</a></h3>";
        echo "<p>".$index["part1"][$i]["description"]."</p>";
        $count++;
      }
    ?>
    
    <h2>Describing Relationships and Predicting Values</h2>
    <hr>
    
    <?php
      for ($i = 0; $i < count($index["part2"]); $i++) {
        echo "<h3><a href=\"".$index["part2"][$i]["link"]."\">".$count." &mdash; ".$index["part2"][$i]["title"]."</a></h3>";
        echo "<p>".$index["part2"][$i]["description"]."</p>";
        $count++;
      }
    ?>
    
    <h2>Comparisons Among Multiple Samples</h2>
    <hr>
    
    <?php
      for ($i = 0; $i < count($index["part3"]); $i++) {
        echo "<h3><a href=\"".$index["part3"][$i]["link"]."\">".$count." &mdash; ".$index["part3"][$i]["title"]."</a></h3>";
        echo "<p>".$index["part3"][$i]["description"]."</p>";
        $count++;
      }
    ?>
    
    <h2>Inferences from Unusual Data Structures</h2>
    <hr>
    
    <?php
      for ($i = 0; $i < count($index["part4"]); $i++) {
        echo "<h3><a href=\"".$index["part4"][$i]["link"]."\">".$count." &mdash; ".$index["part4"][$i]["title"]."</a></h3>";
        echo "<p>".$index["part4"][$i]["description"]."</p>";
        $count++;
      }
    ?>
    
    <h2>Supplemental Materials</h2>
    <hr>
    
    <?php
      for ($i = 0; $i < count($index["part5"]); $i++) {
        echo "<h3><a href=\"".$index["part5"][$i]["link"]."\">".$count." &mdash; ".$index["part5"][$i]["title"]."</a></h3>";
        echo "<p>".$index["part5"][$i]["description"]."</p>";
        $count++;
      }
    ?>
    <br /><br />
  </div>
</body>
</html>