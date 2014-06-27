<?php
require_once("chapters.php");

$rand = rand(0, count($partKeys));
$part = $partKeys[$rand];
$page = $chapterKeys[$rand][rand(0,count($chapterKeys[$rand]))];

$location = $index[$part][$page]["link"];
header("Location: http://book.chriswetherill.me/$location")
?>