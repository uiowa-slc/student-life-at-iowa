<article class="yir-article <% if $First %>grid-sizer<% end_if %> clearfix <% if $Tags.exists %><% loop $Tags %>$URLSegment <% end_loop %><% end_if %>">
	<% if $FeaturedImage %>
		<a href="$Link" class="yir-article__img">
			<img src="$FeaturedImage.FocusFill(550,325).URL" alt="$Title">
		</a>
	<% else_if $BackgroundImage %>
		<a href="$Link" class="yir-article__img">
			<img src="$BackgroundImage.FocusFill(550,325).URL" alt="$Title">
		</a>
	<% else_if $YoutubeBackgroundEmbed %>
		<a href="$Link" class="yir-article__img">
			<img src="http://img.youtube.com/vi/$YoutubeBackgroundEmbed/sddefault.jpg" width="550" height="325" alt="$Title">
		</a>
	<% end_if %>
	<div class="yir-article__content <% if $FeaturedImage || $BackgroundImage || $YoutubeBackgroundEmbed %>yir-article__content--wimage<% end_if %>">

		<% if $Departments.exists %>
			<p class="yir-article__departments">
				<% loop $Departments %>
					$Title<% if not Last %>, <% else %><% end_if %>
				<% end_loop %>
			</p>
		<% end_if %>

		<h3 class="yir-article__heading">
			<a href="$Link">$Title</a>
		</h3>
		<br />
		<% if $Credits %><div class="news-card__author">By <% loop $Credits %><% if not $First && not $Last %>, <% end_if %><% if not $First && $Last %><span class="byline__and">&nbsp;and </span><% end_if %><span class="byline__author">$FirstName $Surname</span><% end_loop %></div><% end_if %>
	</div>
</article>
