<% include MainNav %>

<article>
	<div class="mod-hero">
		<div class="hero-wrapper">
			<img src="$EntryPhoto.URL" alt="" class="hero">
		</div>
		<a href="#" class="prev link">
			<div class="background">
				<img src="http://now.lincoln.com/wp-content/uploads/2013/11/Big-Red-600x337.jpg">
				<span class="overlay"></span>
			</div>
			<span class="label">
				<span class="inner">
					<strong>Previous Post</strong> -
				  Previous Article Title
				</span>
			</span>
			<span class="icon-arrow-left"></span>
		</a>
		<a href="#" class="next link">
			<div class="background">
				<img src="http://now.lincoln.com/wp-content/uploads/2013/12/CarlosAmorales_ArtBasel_LetsSeeHowItReverberates-600x316.jpg">
				<span class="overlay"></span>
			</div>
			<span class="label">
				<span class="inner">
					<strong>Next Post</strong> -
				  Next Article Title
				</span>
			</span>
			<span class="icon-arrow-right"></span>
		  </a>
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
	<a href="#">
		<h6>read next</h6>
		<h2>Empowering Women and Minorities: Alejandra Gonzalez</h2>
	</a>
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

