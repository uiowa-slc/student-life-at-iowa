
<% include MainNav %>


<% loop $Children.limit(1) %>
	<div class="flexslider legacy-hero">
		<ul class="unstyled slides">
			<% loop $allChildren %>
				<li class="flex-active-slide">
					<div class="gradient"></div>
					<div class="flexcaption">
						<a href="$Link" class="link">
							<div class="hero-issue">$Up.Title</div>
							<h2 class="title">$Title</h2>
						</a>
					</div>
					<div class="legacy-hero-img" style="background-image:url('$EntryPhoto.URL');"></div>
				</li>
			<% end_loop %>
		</ul>
	</div>
<% end_loop %>

<div class="container">
	<div class="row legacy-holder-content clearfix">
		<div class="col-md-6">
			<h2><img src="{$ThemeDir}/images/leadershiplegacy_small.png" class="block"></h2>
			$Content
		</div>
		<div class="col-md-6">
			<h2>Our Newsletter</h2>
			<p>The Leadership Legacy newsletter embodies our mission to provide the necessary tools for student success and excellence in the Division of Student Life. Alumni will receive this biannual newsletter that includes stories about both current and past leaders, featured student organizations, news, updates and more. Join our list to ensure your subscription and stay up-to-date on all the latest Leadership Legacy news and information.</p>
		</div>
	</div><!-- end .row -->
</div>


<section>
	<div class="container">
		<% loop $Children %>
			<div class="issue-section">
				<h3 class="issue-section-title"><em>$Title</em></h3>
				<ul class="unstyled clearfix">
				<% loop $allChildren.Limit(1) %>
					<li class="post size-300x360">
						<a href="$Link">
							<figure>
			            	<div class="poster" style="background-image: url('$EntryPhoto.SetHeight(500).URL');"></div>
			            	<figcaption>
			               	$Title
			               </figcaption>
			           	</figure>
						</a>
					</li>
				<% end_loop %>
				<% loop $allChildren.Limit(4,1) %>
					<li class="post size-180">
						<a href="$Link">
							<figure>
			            	<div class="poster" style="background-image: url('$EntryPhoto.SetHeight(250).URL');"></div>
			            	<figcaption>
			               	$Title
			               </figcaption>
			           	</figure>
						</a>
					</li>
				<% end_loop %>
				</ul>
			</div>
		<% end_loop %>
	</div><!-- end .container -->
</section>

<% include Footer %>
