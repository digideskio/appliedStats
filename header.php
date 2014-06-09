<?php require_once("chapters.php"); ?>
<!DOCTYPE html>
<html>

<head>
  <meta charset='utf-8' />
  <meta http-equiv="X-UA-Compatible" content="chrome=1" />
  <meta name="description" content="Applied Statistics: An Introduction to Statistical Analysis. An overview of basic techniques for sound analysis and interpretation of experimental data for non-statisticians." />
  <meta name="keywords" content="Stats, Statistics, Statistical analysis, Applied statistics">
  <meta name="author" content="Chris Wetherill" />

  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,700&subset=latin' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" media="screen" href="stylesheets/stylesheet.css">
  <title><?php echo $title." | Applied Statistics"; ?></title>
  <script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
</head>

<body>
  <div class="content">
    <h1>
      <?php
        $number = array_search($title,$chapters,TRUE);
        echo $number+1 . " &mdash; " . $chapters[$number];
      ?>
    </h1>
    <br />