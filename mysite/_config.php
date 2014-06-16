<?php

global $project;
$project = 'mysite';

global $database;
$database = 'student-life';
 
// Use _ss_environment.php file for configuration
require_once("conf/ConfigureFromEnv.php");
MySQLDatabase::set_connection_charset('utf8');

// Set the current theme. More themes can be downloaded from
// http://www.silverstripe.org/themes/
SSViewer::set_theme('studentlife');

// Set the site locale
i18n::set_locale('en_US');
FulltextSearchable::enable();
