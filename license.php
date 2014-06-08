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
  <title>License | Applied Statistics</title>
</head>

<body>
    <div class="content">
        <p>Copyright <?php
						// gets the current year for the copyright
						$date_timestamp = strtotime("now");
						$date = new DateTime();
						$date->setTimestamp($date_timestamp);
						echo $date->format('Y');
					?> Christopher Wetherill</p>
        <p>Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at:</p>
        
        <p>http://www.apache.org/licenses/LICENSE-2.0</p>
        
        <p>Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.</p>
    </div>
</body>

</html>