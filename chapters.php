<?php
    $index = array(
        "part1" => array(
            "Preface" => array(
                "description" => "This chapter includes the motivations for writing this book; why you should care about good statistical analysis; how the book is structured; what software and background knowledge are recommended; and some commonly-used statistical terminologies. It's a good place to start if you're new to the game, but perfectly okay to skip if you already have some experience with applied statistics.",
                "link" => "part1/preface",
                "previous" => "",
                "next" => "introToR",
            ),
            "Introduction to R" => array(
                "description" => "Throughout this book, R is used to illustrate examples and conduct all analyses. This chapter is meant to serve as a quick primer for those who have not used the software before. Topics include installation, reading data, authoring scripts, and basic data manipulation, graphics generation, and statistical modeling.",
                "link" => "part1/introToR",
                "previous" => "preface",
                "next" => "uncertainty",
            ),
            "Measuring Uncertainty" => array(
                "description" => "Before working with inferential statistics, you should have a solid understanding of how we quantify uncertainty. Included in this chapter is an overview of measures of spread and central tendency and their important to applied statistics; sampling distributions; methods to visualize and understand data; and a basic discussion of probability.",
                "link" => "part1/uncertainty",
                "previous" => "introToR",
                "next" => "design",
            ),
            "Research Design" => array(
                "description" => "",
                "link" => "part1/design",
                "previous" => "uncertainty",
                "next" => "inference",
            ),
            "Introduction to Statistical Inference" => array(
                "description" => "",
                "link" => "part1/inference",
                "previous" => "design",
                "next" => "../part2/correlation",
            ),
        ),
        "part2" => array(
            "Correlation" => array(
                "description" => "Correlation is a statistical technique used to illustrate dependence between multiple variables. (I.e., correlation quantifies the degree to which different variables change together.) In this chapter, we give an overview of correlational tests, illustrate when they are appropriate, and discuss their limitations of inference.",
                "link" => "part2/correlation",
                "previous" => "../part1/design",
                "next" => "regression",
            ),
            "Simple Linear Regression" => array(
                "description" => "",
                "link" => "part2/regression",
                "previous" => "correlation",
                "next" => "multipleRegression",
            ),
            "Multiple Regression" => array(
                "description" => "",
                "link" => "part2/multipleRegression",
                "previous" => "regression",
                "next" => "moreRegression",
            ),
            "Related Issues in Regression" => array(
                "description" => "",
                "link" => "part2/moreRegression",
                "previous" => "multipleRegression",
                "next" => "",
            ),
        ),
        "part3" => array(
            "t-Tools" => array(
                "description" => "",
                "link" => "",
                "previous" => "",
                "next" => "",
            ),
            "Alternatives to t-Tools" => array(
                "description" => "",
                "link" => "",
                "previous" => "",
                "next" => "",
            ),
            "One-Way ANOVA" => array(
                "description" => "",
                "link" => "",
                "previous" => "",
                "next" => "",
            ),
            "Multifactor Studies" => array(
                "description" => "",
                "link" => "",
                "previous" => "",
                "next" => "",
            ),
            "Multifactor Studies with Replication" => array(
                "description" => "",
                "link" => "",
                "previous" => "",
                "next" => "",
            ),
        ),
        "part4" => array(
            "Time-Series Data" => array(
                "description" => "",
                "link" => "",
                "previous" => "",
                "next" => "",
            ),
            "Rank-Ordered Data" => array(
                "description" => "",
                "link" => "",
                "previous" => "",
                "next" => "",
            ),
            "Counts, Proportions, and Odds" => array(
                "description" => "",
                "link" => "",
                "previous" => "",
                "next" => "",
            ),
        ),
        "part5" => array(
            "Choosing the Right Analysis: A Cheat Sheet" => array(
                "description" => "",
                "link" => "",
                "previous" => "",
                "next" => "",
            ),
            "License" => array(
                "description" => "",
                "link" => "license",
                "previous" => "",
                "next" => "",
            ),
        ),
    );
    
    $partKeys = array_keys($index);
    $chapterKeys = array();
    for($i =0; $i < count($partKeys); $i++) {
        $chapterKeys[] = array_keys($index[$partKeys[$i]]);
    };
    
    $chapters = array();
    foreach($chapterKeys as $parts) {
        foreach($parts as $chapter) {
            $chapters[] = $chapter;
        }
    }
?>