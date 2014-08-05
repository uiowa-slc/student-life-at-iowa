<% include MainNav %>
<br>
<div class="container">
	<% include BreadCrumbs %>
	<div class="row clearfix">
		<div class="col-md-8">
			<% if $Content %>
				$Content
				<hr />
			<% end_if %>
			<ul class="small-block-grid-1 large-block-grid-2 directory-list">
			<% loop $DirectoryEntries %>
				<li>
					<div class="directory-content">
					<!--<h2>$Title</h2>-->
						$FacebookEmbed
						<p class="more-social">
							<% if $WebsiteLink %>
							<a href="{$WebsiteLink}" class="btn" target="_blank">Website</a>
							<% end_if %>
							<% if $TwitterUsername %>
							<a href="http://twitter.com/{$TwitterUsername}" target="_blank" class="btn twitter">@$TwitterUsername</a>
							<% end_if %>

							<% if $InstagramLink %><a href="$InstagramLink" target="_blank" class="btn instagram">Instagram</a><% end_if %>
						</p>
					</div>
				</li>
				<% if $MultipleOf(2) %>
					<hr />
				<% end_if %>
			<% end_loop %>
		</div><!-- end .col-md-8 -->
  		<div class="col-md-4">
  			<% include BlogSideBar %>
  		</div>
	</div>
</div>