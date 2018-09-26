$Header
<main class="main-content__container" id="main-content__container">

	$Breadcrumbs

	<div class="column row">
		<div class="main-content__header">
			<h1>$Title</h1>
			<% if $Summary %>
				<div class="blogpost__summary">$Summary</div>
			<% end_if %>
		</div>
	</div>

	$BlockArea(BeforeContent)

	<div class="row">
		<article role="main" class="main-content main-content--with-padding <% if $Children || $Menu(2) || $SidebarBlocks ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
			$BlockArea(BeforeContentConstrained)
			<div class="main-content__text">
				<% if $FeaturedImage %>
					<% if FeaturedImage.Width >= 700 %>
						<p class="post-image"><img class="dp-lazy" src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" data-original="$FeaturedImage.SetWidth(1040).URL" alt="$FeaturedImage.Title" role="presentation" width="840" height="$FeaturedImage.SetWidth(1040).Height" /></p>
					<% end_if %>
				<% end_if %>
				<div class="content">

					<div class="blogmeta clearfix">
						<% include ByLine %>

						<ul class="blogmeta__social">
							<li><a href="javascript:window.open('http://www.facebook.com/sharer/sharer.php?u=$AbsoluteLink', '_blank', 'width=400,height=500');void(0);"  title="Share on Facebook"><img src="{$ThemeDir}/dist/images/icon_facebook.png" alt="Share on Facebook"></a>
							</li>
							<li><a href="https://twitter.com/intent/tweet?text=$AbsoluteLink" title="Share on Twitter" target="_blank"><img src="{$ThemeDir}/dist/images/icon_twitter.png" alt="Share on Twitter"></a></li>
							<li><a href="javascript:window.open('https://www.linkedin.com/cws/share?url=$AbsoluteLink', '_blank', 'width=400,height=500');void(0);" title="Share on LinkedIn" target="_blank"><img src="{$ThemeDir}/dist/images/icon_linkedin.png" alt="share on linkedid"></a></li>
						</ul>
					</div>
					<% if $FeaturedImage %>
						<% if FeaturedImage.Width < 700 %>
							<img class="dp-lazy" src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" data-original="$FeaturedImage.URL" alt="$FeaturedImage.Title" class="right post-image">
						<% end_if %>
					<% end_if %>

					$Content
					<% if $ExternalURL %>
						<p><a href="$ExternalURL" class="button--shaded" target="_blank">$ExternalURLText</a></p>
					<% end_if %>
				</div>

				$BlockArea(AfterContentConstrained)
				<!-- Year In Review -->
				<% if $HasTag("2018 Year In Review") %>
					<div class="backtoreview">
						<h3 style="margin-top: 0;">2018 Year In Review</h3>
						<p>This article is part of the <strong>2018 Year in Review</strong>, which highlights some of the Division of Student Life's accomplishments from the previous academic year.</p>
						<p><a href="/1718-year-in-review/" class="button">Go to Year in Review</a></p>
					</div>
				<% end_if %>

				<% include TagsCategories %>
			</div>
			$Form
		</article>
		<aside class="sidebar dp-sticky">
			<% include SideNav %>
			<% if $SideBarView %>
				$SideBarView
			<% end_if %>
			$BlockArea(Sidebar)
		</aside>
	</div>
	$BlockArea(AfterContent)
</main>











