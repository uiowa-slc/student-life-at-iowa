<% include MainNav %>
<br>
<div class="container">
	<% include BreadCrumbs %>
	<div class="row clearfix">
		<div class="col-md-8">
			<section class="blogEntry">
				<article itemscope="" itemtype="http://schema.org/Article" class="BlogContent">
					<header>
						<h1 class="postTitle" itemprop="name headline">$Title</h1>
						<div class="byline-top">
							<time datetime="$Date.format(c)" itemprop="datePublished">$Date.Long</time> - <% include Byline %>
							<% if TagsCollection %>
								to
								<% loop TagsCollection %>
									<a href="$Link" title="<% _t('BlogEntry_ss.VIEWALLPOSTTAGGED', 'View all posts tagged') %> '$Tag'" rel="tag">$Tag</a><% if not Last %>,<% end_if %>
								<% end_loop %>
							<% end_if %>
						</div>
					</header>
					<p><img src="$Photo.SetWidth(800).URL" alt=""></p>
					$Content
					<footer>
						<% if TagsCollection %>
							<div class="tags">
								<p>
								<span class="glyphicon glyphicon-tag"></span> <% _t('BlogEntry_ss.TAGS', 'Tags:') %>
								<% loop TagsCollection %>
									<a href="$Link" title="<% _t('BlogEntry_ss.VIEWALLPOSTTAGGED', 'View all posts tagged') %> '$Tag'" rel="tag">$Tag</a><% if not Last %>,<% end_if %>
								<% end_loop %>
								</p>
							</div>
						<% end_if %>
						<% if $Member %>
							<% with $Member %>
								<div class="byline clearfix">
									<a href="$Link" class="byline-img">
										<img src="$Photo.CroppedImage(130,130).URL" alt="Read all articles by $FirstName $Surname">
									</a>
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
				<aside class="BlogRelated">
					<h2>Related</h2>
					<% loop $RelatedNewsEntries %>
						<li><a href="$Link">$Title</a></li>
					<% end_loop %>
				</aside>
			</section>
		</div>
  		<div class="col-md-4">
  			<% include BlogSideBar %>
  		</div>
	</div>
</div>
