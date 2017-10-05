<% if $URLSegment == "home" %>
<meta property="og:title" content="Student Life at Iowa" />
<% else %>
<meta property="og:title" content="$Title - Student Life at Iowa" />
<% end_if %>
<meta property="og:type" content="article" />
<meta property="og:url" content="$AbsoluteLink" />
<% if $ListingPhoto %>
	<meta property="og:image" content="$ListingPhoto.Fill(1200,630).AbsoluteURL" />
	<meta property="og:image:secure_url" content="$ListingPhoto.AbsoluteURL" />
<% else_if $FeaturedImage %>
	<meta property="og:image" content="$FeaturedImage.Fill(1200,630).AbsoluteURL" />
	<meta property="og:image:secure_url" content="$FeaturedImage.AbsoluteURL" />
	<meta property="og:image:width" content="$FeaturedImage.Width" />
	<meta property="og:image:height" content="$FeaturedImage.Height" />
<% else %>
	<meta property="og:image" content="$FeaturedImage.Fill(1200,630).AbsoluteURL" />
	<meta property="og:image:secure_url" content="{$BaseHref}{$ThemeDir}/images/og-poster.jpg" />
	<meta property="og:image:width" content="1200" />
	<meta property="og:image:height" content="650" />
<% end_if %>
<meta property="og:description" content="$Content.LimitCharacters(120)" />
<meta property="og:site_name" content="Student Life at Iowa" />
<meta property="fb:admins" content="64131067165" />