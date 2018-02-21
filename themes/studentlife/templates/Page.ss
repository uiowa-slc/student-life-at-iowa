<!DOCTYPE html>
<!--[if lt IE 9]>         <html lang="en" class="lt-ie9 no-js"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en" class="no-js demo-1"> <!--<![endif]-->
<head>
<% include GoogleTagManagerHead %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$Title | Student Life at Iowa | The University of Iowa</title>
<% base_tag %>
<!-- Typekit -->
<% include TypeKit %>

<!-- Twitter Card data -->
<meta name="twitter:card" content="summary">
<meta name="twitter:site" content="@uistudentlife">
<meta name="twitter:title" content="$Title">
<meta name="twitter:description" content="$Content.LimitCharacters(120)">
<% if $ListingPhoto %>
	<meta name="twitter:image" content="$ListingPhoto.AbsoluteURL">
<% else_if $FeaturedImage %>
	<meta name="twitter:image" content="$FeaturedImage.AbsoluteURL">
<% end_if %>

<!-- Open Graph data -->
<% include OpenGraph %>

<!-- CSS -->
<link rel="stylesheet" href="{$ThemeDir}/css/master.css">

<!-- IE FIXES -->
<!--[if lt IE 9]>
    <script src="{$ThemeDir}/js/ie/html5shiv.js"></script>
    <script src="{$ThemeDir}/js/ie/respond.min.js"></script>
<![endif]-->

</head>

<body class="$URLSegment">
  <% include GoogleTagManagerBody %>
	<% include UiowaBar %>
    $Layout


	<% include Footer %>
   <!-- JS -->
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   <script src="{$ThemeDir}/js/build/production.min.js"></script>

</body>
</html>
