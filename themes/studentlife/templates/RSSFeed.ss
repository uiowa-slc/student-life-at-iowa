<?xml version="1.0"?>
<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:media="http://search.yahoo.com/mrss/">
	<channel>
		<title>$Title</title>
		<link>$Link</link>
		<atom:link href="$Link" rel="self" type="application/rss+xml" />
		<description>$Description.XML</description>
		<% loop $Entries %>
		<item>
			<title>$Title.XML</title>
			<link>$AbsoluteLink</link>
			<% if $ListingPhoto %><media:thumbnail url="$ListingPhoto.CroppedImage(360, 200).AbsoluteURL" height="$Photo.CroppedImage(360, 200).Height" width="360"></media:thumbnail><% else_if $Photo %><media:thumbnail url="$Photo.CroppedImage(360, 200).AbsoluteURL" height="$Photo.CroppedImage(360, 200).Height" width="360"></media:thumbnail><% end_if %>
			<% if $Description %><description>$Description.AbsoluteLinks.XML</description><% end_if %>
			<% if $Date %><pubDate>$Date.Rfc822</pubDate>
			<% else %><pubDate>$Created.Rfc822</pubDate><% end_if %>
			<% if $Author %><dc:creator>$Author.XML</dc:creator><% end_if %>
			<guid>$AbsoluteLink</guid>
		</item>
		<% end_loop %>
	</channel>
</rss>
