
<% include MainNav %>
<br>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-8">
			<% include BreadCrumbs %>
			<div class="blogEntry">
				<h1 class="postTitle">$Title</h1>
				<p class="authorDate"><% _t('BlogEntry_ss.POSTEDBY', 'Posted by') %> $Author.XML <% _t('BlogEntry_ss.POSTEDON', 'on') %> $Date.Long <!-- | $Comments.Count <% _t('BlogEntry_ss.COMMENTS', 'Comments') %> --></p>
				<% if TagsCollection %>
					<p class="tags">
						 <% _t('BlogEntry_ss.TAGS', 'Tags:') %>
						<% loop TagsCollection %>
							<a href="$Link" title="<% _t('BlogEntry_ss.VIEWALLPOSTTAGGED', 'View all posts tagged') %> '$Tag'" rel="tag">$Tag</a><% if not Last %>,<% end_if %>
						<% end_loop %>
					</p>
				<% end_if %>
				<hr>
				<p><img src="$Photo.SetWidth(800).URL" alt=""></p>

				<div class="BlogContent">
					$Content
				</div>

			</div><!-- end .blogEntry -->
		</div><!-- end .col-md-8 -->
  		<div class="col-md-4">
  			<% include BlogSideBar %>
  		</div>
	</div>
</div>
