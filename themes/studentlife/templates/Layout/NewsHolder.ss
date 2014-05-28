
<% include MainNav %>

<div id="BlogContent" class="blogcontent">

	<% if SelectedTag %>
		<h3><% _t('BlogHolder_ss.VIEWINGTAGGED', 'Viewing entries tagged with') %> '$SelectedTag'</h3>
	<% else_if SelectedDate %>
		<h3><% _t('BlogHolder_ss.VIEWINGPOSTEDIN', 'Viewing entries posted in') %> $SelectedNiceDate</h3>
	<% else_if SelectedAuthor %>
		<h3><% _t('BlogHolder_ss.VIEWINGPOSTEDBY', 'Viewing entries posted by') %> $SelectedAuthor</h3>
	<% end_if %>

	<% if BlogEntries %>
		<% loop BlogEntries %>
			<% include BlogSummary %>
		<% end_loop %>
	<% else %>
		<h2><% _t('BlogHolder_ss.NOENTRIES', 'There are no blog entries') %></h2>
	<% end_if %>

</div>

<section>
	<div class="container">
		<div class="row">
			<% loop $allChildren %>
			<% if $IsFeatured %>
			<div class="col-md-9">
				<div class="row">
					<div class="col-md-8">
						<img src="$Photo.SetWidth(800).URL">
					</div>
					<div class="col-md-4">
						<h2>$Title</h2>
						<p>$Content.LimitCharacters(220)</p>
					</div>
				</div>
				<br>
				<% end_if %>
				<% end_loop %>
			</div>
			<div class="col-md-3">
				<div class="blog-sidebar">
					col 3
				</div>
			</div>
		</div>
	</div>
</section>
<section class="latestnews">
	<div class="container">
		<h2 class="cat-heading-title">Latest</h2>
		<div class="rule"></div>
		<div id="container" class="latestnews-masonry">
			<% loop BlogEntries.Limit(12) %>
			<article class="latestnews-item item">
				<a href="$Link" class="item-img">
					<img src="$Photo.SetWidth(360).URL">
					<div class="item-img-title">
						<h3 class="news-clip-heading">$Title</h3>
						<p class="meta">$Date.Long <% if $Author %>by <em>$Author</em><% end_if %></p>
					</div>
				</a>
				<!-- <p class="snippit">$Content.LimitCharacters(220)</p> -->
				<!-- <div class="rule"></div> -->
			</article>
			<% end_loop %>
		</div>
	</div><!-- end .container -->
</section>


<section class="video-list">

</section>

<section>
	<div class="container">
		<h2 class="cat-heading-title">Photo Galleries</h2>
		<div class="rule"></div>
		<div class="flexslider news-gallery">
			<ul class="slides">
				<% if $PhotoGalleryTitleOne %>
					<li>
				 		<img src="$PhotoGalleryImageOne.SetWidth(1024).URL" alt="" />
				 		<h3 class="caption"><a href="$PhotoGalleryURLOne"><span>$PhotoGalleryTitleOne</span></a></h3>
					</li>
				<% end_if %>
				<% if $PhotoGalleryTitleTwo %>
					<li>
				 		<img src="$PhotoGalleryImageTwo.SetWidth(1024).URL" alt="" />
				 		<h3 class="caption"><a href="$PhotoGalleryURLTwo"><span>$PhotoGalleryTitleTwo</span></a></h3>
					</li>
				<% end_if %>
				<% if $PhotoGalleryTitleTwo %>
					<li>
				 		<img src="$PhotoGalleryImageThree.SetWidth(1024).URL" alt="" />
				 		<h3 class="caption"><a href="$PhotoGalleryURLThree"><span>$PhotoGalleryTitleThree</span></a></h3>
					</li>
				<% end_if %>
			</ul>
	 	</div>
	</div>
</section>
<br>
