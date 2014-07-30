<% include MainNav %>
<br>
<div class="container">
	<% include BreadCrumbs %>
	<div class="row clearfix">
		<div class="col-md-8">
			$Content
			<hr />
			<ul class="small-block-grid-1 large-block-grid-2 directory-list">
			<% loop $DirectoryEntries %>
				<li>
					<h2>$Title</h2>
					<p class="more-social">
						<% if $TwitterUsername %>
						<a href="http://twitter.com/{$TwitterUsername}" target="_blank" class="btn twitter">@$TwitterUsername</a>
						<% end_if %>

						<% if $InstagramLink %><a href="$InstagramLink" target="_blank" class="btn instagram">Instagram</a><% end_if %>
					</p>
					<p>$FacebookEmbed</p>

				</li>
			<% end_loop %>
		</div><!-- end .col-md-8 -->
  		<div class="col-md-4">
  			<% include BlogSideBar %>
  		</div>
	</div>
</div>