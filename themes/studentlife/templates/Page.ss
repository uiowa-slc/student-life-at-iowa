<!DOCTYPE html>
<!--[if lt IE 9]>         <html lang="en" class="lt-ie9 no-js"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en" class="no-js demo-1"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$Title | Student Life at Iowa | The University of Iowa</title>
<% base_tag %>
<% include Ascii %>
<!-- Typekit -->
<% include TypeKit %>

<!-- Open Graph -->
<meta property="og:type" content="article">
<meta property="og:url"	content="$AbsoluteLink">
<meta property="og:site_name" content="Student Life at Iowa">
<meta property="og:image" content="$Photo.AbsoluteURL">
<meta property="og:title" content="$Title">
<meta property="og:description" content="$Content.LimitCharacters(160)" />

<!-- CSS -->
<link rel="stylesheet" href="{$ThemeDir}/css/master.css">

<!-- IE FIXES -->
<!--[if lt IE 9]>
    <script src="{$ThemeDir}/js/ie/html5shiv.js"></script>
    <script src="{$ThemeDir}/js/ie/respond.min.js"></script>
<![endif]-->

<!-- Analytics -->
<% include Analytics %>

</head>

<body class="$URLSegment">

	<% include DivisionBar %>
    $Layout


	<% include Footer %>
   <!-- JS -->
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   <script src="{$ThemeDir}/js/min/production-min.js"></script>

</body>
</html>
