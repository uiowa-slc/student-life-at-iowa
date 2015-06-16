	<% if $Credits %>
		<%t Blog.By "Posted by" %>
		<% loop $Credits %><% if not $First && not $Last %>, <% end_if %><% if not $First && $Last %> and <% end_if %><% if $URLSegment %><a href="$URL">$Name.XML</a><% else %>$Name.XML<% end_if %><% end_loop %>
	<% end_if %>
	on <time datetime="$PublishDate.format(c)" itemprop="datePublished">$PublishDate.format("F j, Y")</time>