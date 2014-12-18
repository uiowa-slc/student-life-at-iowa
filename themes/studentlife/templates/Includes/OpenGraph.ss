<meta property="og:title" content="$Title" />
<meta property="og:type" content="article" />
<meta property="og:url" content="$AbsoluteLink" />
<% if $Photo %>
	<meta property="og:image" content="$Photo.AbsoluteURL" />
<% else %>
	<meta property="og:image" content="{$BaseHref}{$ThemeDir}/images/og-poster.jpg" />
<% end_if %>
<meta property="og:description" content="$Content.LimitCharacters(120)" />
<meta property="og:site_name" content="Student Life at Iowa" />
<meta property="fb:admins" content="64131067165" />