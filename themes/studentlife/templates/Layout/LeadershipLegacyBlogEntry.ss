<% include MainNav %>

<article>
	<div class="mod-hero">
		<div class="hero-wrapper">
			<img src="$EntryPhoto.URL" alt="" class="hero">
		</div>
		<!-- Previous Article Link -->
		<% if PreviousPage %>
			<a href="$PreviousPage.Link" class="prev link">
				<div class="background">
					<img src="$PreviousPage.EntryPhoto.URL">
					<span class="overlay"></span>
				</div>
				<span class="label">
					<span class="inner">
						<strong>Previous Post</strong> -
					  $PreviousPage.Title
					</span>
				</span>
				<span class="icon-arrow-left"></span>
			</a>
		<% end_if %>
		<% if NextPage %>
			<a href="$NextPage.Link" class="next link">
				<div class="background">
					<img src="$NextPage.EntryPhoto.URL">
					<span class="overlay"></span>
				</div>
				<span class="label">
					<span class="inner">
						<strong>Next Post</strong> -
					  $NextPage.Title
					</span>
				</span>
				<span class="icon-arrow-left"></span>
			</a>
		<% end_if %>
	</div>

	<div class="legacy-wrapper">
		<div class="mod-single">
			<header>
				<h1>$Title</h1>
			</header>
			<div class="content">
				<div class="body">
					<% if Author %><p>By <em>$Author</em></p><% end_if %>
					$Content
				</div>
			</div>
		</div>
	</div>
</article>

<aside class="next-story">
	<% if NextPage %>
		<a href="$NextPage.Link">
			<h6>read next</h6>
			<h2>$NextPage.Title</h2>
		</a>
	<% else %>
		<a href="$PreviousPage.Link">
			<h6>read previous</h6>
			<h2>$PreviousPage.Title</h2>
		</a>
	<% end_if %>
</aside>

<p>&nbsp;</p>

<section>
	<div class="container">
		<% loop $ChildrenOf(leadership-legacy) %>
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

