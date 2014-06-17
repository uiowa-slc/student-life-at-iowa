<% include MainNav %>
<br>
<div class="container">
	<% include BreadCrumbs %>
	<div class="row clearfix">
		<div class="col-md-8">
			<% with Member %>
				<p>First Name: $FirstName <br />
					Last Name: $Surname <br />
					Bio: $Bio <br />
					Photo: $Photo <br />
				</p>
				<p>News Entries written by $FirstName:</p>
				<ul>
					<% loop NewsEntries %>
						<li><a href="$Link">$Title</a></li>
					<% end_loop %>
				</ul>
				<p>Leadership Legacy Entries written by $FirstName:</p>
				<ul>
					<% loop LeadershipLegacyBlogEntries %>
						<li><a href="$Link">$Title</a></li>
					<% end_loop %>
				</ul>
			<% end_with %>
		</div><!-- end .col-md-8 -->
  		<div class="col-md-4">
  			<% include BlogSideBar %>
  		</div>
	</div>
</div>
