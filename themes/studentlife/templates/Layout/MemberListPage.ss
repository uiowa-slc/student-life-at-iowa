<% include MainNav %>
<br>
<div class="container">
	<% include BreadCrumbs %>
	<div class="row clearfix">
		<div class="col-md-8">
			<h2>Author List</h2>
			<ul>
			<% loop $Members %>
				<li><a href="$Link">$FirstName $Surname</a></li>
			<% end_loop %>
			</ul>
		</div><!-- end .col-md-8 -->
  		<div class="col-md-4">
  			<% include BlogSideBar %>
  		</div>
	</div>
</div>
