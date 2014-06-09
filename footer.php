<div class="nav">
    <ul>
        <?php
            $chKey = array_search($title, $chapters);
            if($index[$part][$title]["previous"]!=NULL) {
                echo "<li><a href=\"".$index[$part][$title]["previous"]."\">&larr; ".$chapters[$chKey-1]."</a></li>";
            }
            echo "<li><a href=\"/\">Home</a></li>";
            if($index[$part][$title]["next"]!=NULL) {
                echo "<li><a href=\"".$index[$part][$title]["next"]."\">".$chapters[$chKey+1]." &rarr;</a></li>";
            }            
        ?>
    </ul>
  </div>
</body>
</html>