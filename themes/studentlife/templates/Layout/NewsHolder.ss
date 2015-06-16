
<% include MainNav %>
<br>

<% if $CurrentTag %>
	<!-- ========= BEGIN SELECTED TAG CONTENT ========= -->
	<section class="latestnews">
		<div class="container">
			<h2 class="cat-heading-title"><% _t('BlogHolder_ss.VIEWINGTAGGED', 'Viewing entries tagged with') %> '$CurrentTag.Title'</h2>
			<div class="rule"></div>
			<div id="" class="justify justify-3">
			<% loop PaginatedList %>
				<article class="latestnews-item justify-item">
					<a href="$Link" class="item-img">
						<% if $ListingPhoto %>
							<img src="$ListingPhoto.CroppedImage(360,200).URL" alt="$Title">
						<% else_if $FeaturedImage %>
							<img src="$FeaturedImage.CroppedImage(360,200).URL" alt="$Title">
						<% end_if %>
						<div class="item-img-title">
							<h3 class="news-clip-heading">$Title</h3>
							<% if $Summary %>
								<p>$Summary</p>
							<% else %>
								<p>$Excerpt</p>
							<% end_if %>
						</div>
					</a>
				</article>
			<% end_loop %>
			<article class="justify-item filler"></article>
		</div>
		<% include NewsPagination %>
	</div><!-- end .container -->
</section>

<% else %>

<!-- ========= BEGIN MAIN CONTENT ========= -->
<section>
	<div class="container">
		<div class="row blog-featured">
			<% loop $BlogPosts %>
				<% if $IsFeatured %>
					<div class="col-md-8">
						<a href="$Link">
							<% if $ListingPhoto %>
								<img class="unveil" src="<% include PlaceholderLargeSrc %>" data-original="$ListingPhoto.CroppedImage(800,500).URL" alt="$Title">
							<% else_if $FeaturedImage %>
								<img class="unveil" src="<% include PlaceholderLargeSrc %>" data-original="$FeaturedImage.CroppedImage(800,500).URL" alt="$Title">
							<% end_if %>
						</a>
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

		<% loop PaginatedList %>
			<article class="latestnews-item justify-item">
					<a href="$Link" class="item-img">
						<% if $ListingPhoto %>
							<img class="unveil" src="{$ThemeDir}/images/placeholder-medium.jpg" data-original="$ListingPhoto.CroppedImage(360,200).URL" alt="$Title">
						<% else_if $FeaturedImage %>
							<img class="unveil" src="{$ThemeDir}/images/placeholder-medium.jpg" data-original="$FeaturedImage.CroppedImage(360,200).URL" alt="$Title">
						<% end_if %>
						<div class="item-img-title">
							<h3 class="news-clip-heading">$Title</h3>
							<p class="snippit">$Content.LimitCharacters(160)</p>
						</div>
					</a>
				</article>
			<% end_loop %>
			<article class="justify-item filler"></article>
		</div>
		<% include NewsPagination %>
	</div>
</section>
<!--<section class="video-list">
	
	<iframe src="http://www.youtube.com/embed/?listType=user_uploads&list=imubuddy" width="480" height="400" frameBorder="0"></iframe>

</section>-->
<section>
	<div class="container">
		<h2 class="cat-heading-title">Photo Galleries</h2>
		<div class="rule"></div>
		<div class="flexslider news-gallery">
			<ul class="slides">
				<% if $PhotoGalleryTitleOne %>
					<li>
				 		<img class="unveil" src="{$ThemeDir}/images/loader.gif" data-original="$PhotoGalleryImageOne.SetWidth(1024).URL" alt="$PhotoGalleryTitleOne" />
				 		<h3 class="caption"><a href="$PhotoGalleryURLOne"><span>$PhotoGalleryTitleOne</span></a></h3>
					</li>
				<% end_if %>
				<% if $PhotoGalleryTitleTwo %>
					<li>
				 		<img class="unveil" src="{$ThemeDir}/images/loader.gif" data-original="$PhotoGalleryImageTwo.SetWidth(1024).URL" alt="$PhotoGalleryTitleTwo" />
				 		<h3 class="caption"><a href="$PhotoGalleryURLTwo"><span>$PhotoGalleryTitleTwo</span></a></h3>
					</li>
				<% end_if %>
				<% if $PhotoGalleryTitleTwo %>
					<li>
				 		<img class="unveil" src="{$ThemeDir}/images/loader.gif" data-original="$PhotoGalleryImageThree.SetWidth(1024).URL" alt="$PhotoGalleryTitleThree" />
				 		<h3 class="caption"><a href="$PhotoGalleryURLThree"><span>$PhotoGalleryTitleThree</span></a></h3>
					</li>
				<% end_if %>
			</ul>
	 	</div>
	</div>
</section>
<br>

<% end_if %>
