<% include MainNav %>
<br>
<div class="container">
	<% include BreadCrumbs %>
	<div class="row clearfix">
		<div class="col-md-8 memberpage">
			<% with CurrentProfile %>
				<div class="clearfix profile">
					<% if $BlogProfileImage %><img src="$BlogProfileImage.CroppedImage(150,150).URL" alt="$FirstName $Surname"><% end_if %>
					<h2>$FirstName $Surname</h2>
					<div>
						$Bio
					</div>
				</div>
				<br>
				<p><strong>News Entries</strong> written by $FirstName:</p>
				<% loop BlogPosts %>
					<article class="clearfix">
						<% if $FeaturedImage %>
						<a href="$Link" class="memberpage-img">
							<img data-original="$FeaturedImage.URL" src="{$ThemeDir}/images/placeholder-medium.jpg" alt="$Title" class="unveil">
						</a>
						<% end_if %>
						<div class="memberpage-content">
							<h3><a href="$Link">$Title</a></h3>
							<p class="date"><em>$Date.Long</em></p>
							<p>$Content.LimitCharacters(160)</p>
						</div>
					</article>
					<% if not Last %><hr><% end_if %>
				<% end_loop %>
				<br>
				<br>
				<br>
				<% if $LeadershipLegacyBlogEntries %>
					<p><strong>Leadership Legacy entries</strong> written by $FirstName:</p>
					<% loop LeadershipLegacyBlogEntries %>
						<article class="clearfix">
							<a href="$Link" class="memberpage-img">
								<img src="$FeaturedImage.CroppedImage(230,150).URL" alt="$Title">
							</a>
							<div class="memberpage-content">
								<h3 class=""><a href="$Link">$Title</a></h3>
								<p class="date"><em>$Date.Long</em></p>
								<p class="">$Content.LimitCharacters(160)</p>
							</div>
							</a>
						</article>
					<% end_loop %>
				<% end_if %>
			<% end_with %>
		</div><!-- end .col-md-8 -->
  		<div class="col-md-4">
  			<% include BlogSideBar %>
  		</div>
	</div>
</div>
