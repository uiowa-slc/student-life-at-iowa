
<% include MainNav %>
<br>
<section>
	<div class="container">
		<div class="row blog-featured">
			<% loop $allChildren %>
				<% if $IsFeatured %>
					<div class="col-md-8">
						<a href="$Link"><img src="$Photo.CroppedImage(800,500).URL" alt="$Title"></a>
					</div>
					<div class="col-md-4">
						<h1><a href="$Link">$Title</a></h1>
						<p>$Content.Summary(30)</p>
						<p><a href="$Link" class="btn btn-default">Continue Reading</a></p>
					</div>
				<% end_if %>
			<% end_loop %>
		</div>
	</div>
</section>

<section class="latestnews">
	<div class="container">
		<h2 class="cat-heading-title">Latest News</h2>
		<div class="rule"></div>
		<div id="" class="justify justify-3">
			<% loop BlogEntries %>

				<article class="latestnews-item justify-item">
					<a href="$Link" class="item-img">
						<img src="$Photo.CroppedImage(360,200).URL" alt="$Title">
						<div class="item-img-title">
							<h3 class="news-clip-heading">$Title</h3>
							<p class="meta">$Date.Long <% if $Author %>by <em>$Author</em><% end_if %></p>
							<p class="snippit">$Content.LimitCharacters(160)</p>
						</div>
					</a>
					<!-- <p class="snippit">$Content.LimitCharacters(220)</p> -->
					<!-- <div class="rule"></div> -->
				</article>

			<% end_loop %>
		</div>
		<% include BlogPagination %>
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
				 		<img src="$PhotoGalleryImageOne.SetWidth(1024).URL" alt="$PhotoGalleryTitleOne" />
				 		<h3 class="caption"><a href="$PhotoGalleryURLOne"><span>$PhotoGalleryTitleOne</span></a></h3>
					</li>
				<% end_if %>
				<% if $PhotoGalleryTitleTwo %>
					<li>
				 		<img src="$PhotoGalleryImageTwo.SetWidth(1024).URL" alt="$PhotoGalleryTitleTwo" />
				 		<h3 class="caption"><a href="$PhotoGalleryURLTwo"><span>$PhotoGalleryTitleTwo</span></a></h3>
					</li>
				<% end_if %>
				<% if $PhotoGalleryTitleTwo %>
					<li>
				 		<img src="$PhotoGalleryImageThree.SetWidth(1024).URL" alt="$PhotoGalleryTitleThree" />
				 		<h3 class="caption"><a href="$PhotoGalleryURLThree"><span>$PhotoGalleryTitleThree</span></a></h3>
					</li>
				<% end_if %>
			</ul>
	 	</div>
	</div>
</section>
<br>
