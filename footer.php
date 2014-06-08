<div class="nav">
    <ul>
        <?php
            if($index[$part][$chapter]["previous"]!=NULL) {
                echo "<a href=\"".$index[$part][$chapter]["previous"]."\"&larr; ".$index[$part][$chapter]["title"];
            }
        ?>
        <li><a href="/">Home</a></li>
        <li><a href="introToR">Introduction to R &rarr;</a></li>
    </ul>
  </div>
</body>
</html>