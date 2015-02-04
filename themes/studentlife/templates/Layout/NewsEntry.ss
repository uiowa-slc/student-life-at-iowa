<% include MainNav %>
<br>
<div class="container">
	<% include BreadCrumbs %>
	<div class="row clearfix">
		<div class="col-md-8">
			<section>
				<article itemscope="" itemtype="http://schema.org/Article" class="blog-content">
					<header>
						<h1 class="post-title" itemprop="name headline">$Title</h1>
						<div class="byline-top">
							<% include Byline %> on <time datetime="$Date.format(c)" itemprop="datePublished">$Date.format("F j, Y")</time>
						</div>
					</header>
					<p><img src="$Photo.SetWidth(800).URL" alt="Image representing the post $Title"></p>
					<ul class="blog-social">
						<li><a href="javascript:window.open('http://www.facebook.com/sharer/sharer.php?u=$AbsoluteLink', '_blank', 'width=400,height=500');void(0);"  title="Share on Facebook"><span class="social-icon icon-facebook"></span> Facebook</a>
						</li>
						<li><a href="https://twitter.com/intent/tweet?text=$AbsoluteLink" title="Share on Twitter" target="_blank"><span class="social-icon icon-twitter"></span> Twitter</a></li>
						<li><a href="https://plus.google.com/share?url=$AbsoluteLink" title="Share on Google Plus" target="_blank"><span class="social-icon icon-googleplus"></span> Google+</a></li>
					</ul>
					<div class="blog-entry">
						$Content
					</div>
					<footer>
						<% if TagsCollection %>
							<div class="tags">
								<p>
								<span class="glyphicon glyphicon-tag"></span> <% _t('BlogEntry_ss.TAGS', 'Tags:') %>
								<% loop TagsCollection %>
									<a href="$Link" title="<% _t('BlogEntry_ss.VIEWALLPOSTTAGGED', 'View all posts tagged') %> '$Tag'" rel="tag">$Tag</a>
								<% end_loop %>
								</p>
							</div>
						<% end_if %>
						<% if $Member %>
							<% with $Member %>
								<div class="byline clearfix">
									<% if $Photo %>
									<a href="$Link" class="byline-img">
										<img src="$Photo.CroppedImage(130,130).URL" alt="Read all articles by $FirstName $Surname">
									</a>
									<% end_if %>
									<div class="byline-bio">
										<h4><em>By</em> <a href="$Link" class="byline-author">$FirstName $Surname</a></h4>
										<% if $Bio %>$Bio<% end_if %>
										<p class="byline-buttons"><a href="$Link" class="btn btn-default btn-sm">Archives</a></p>
									</div>
								</div>
							<% end_with %>
						<% end_if %>
					</footer>
				</article>
				<% if $RelatedNewsEntries %>
					<aside class="blog-related">
						<h3>Related Articles</h3>
						<ul class="unstyled justify justify-3">
							<% loop $RelatedNewsEntries(3) %>
								<li class="justify-item">
									<% if $Photo || $ListingPhoto %>
										<a href="$Link">
											<% if $ListingPhoto %>
												<img src="$ListingPhoto.CroppedImage(240,160).URL" alt="$Title" />
											<% else %>
												<img src="$Photo.CroppedImage(240,160).URL" alt="$Title" />
											<% end_if %>
										</a>
									<% end_if %>
									<h5><a href="$Link">$Title</a></h5>
								</li>
							<% end_loop %>
							<li class="justify-item filler"></li>
							<li class="justify-item filler"></li>
						</ul>
					</aside>
				<% end_if %>
			</section>
		</div>
  		<div class="col-md-4">
  			<% include BlogSideBar %>
  		</div>
	</div>
</div>
