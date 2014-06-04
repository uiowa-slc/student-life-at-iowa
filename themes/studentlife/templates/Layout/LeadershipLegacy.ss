
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
	<div class="leader-heading">
			<h1><em>"Impacting Tomorrow's Leaders"</em></h1>
	</div>

	<div class="row legacy-holder-content clearfix">
		<div class="col-md-8">
			<h2><img src="{$ThemeDir}/images/leadershiplegacy_small.png" class="block" alt="Leadership Legacy Logo"></h2>
			$Content
		</div>
		<div class="col-md-4">
			<h2></h2>
			<p>Join our list to ensure your subscription and stay up-to-date on all the latest Leadership Legacy news and information.</p>
			<!-- Begin MailChimp Signup Form -->
			<link href="//cdn-images.mailchimp.com/embedcode/slim-081711.css" rel="stylesheet" type="text/css">
			<style type="text/css">
				#mc_embed_signup{background:#fff; clear:left; font:14px Helvetica,Arial,sans-serif; }
				#mc_embed_signup form {padding:0;}
			</style>
			<div id="mc_embed_signup">
				<form action="http://uiowa.us2.list-manage1.com/subscribe/post?u=c61b1cddac92babd42d7d628e&amp;id=5610779be6" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
					<label for="mce-EMAIL">Subscribe to our mailing list</label>
					<input type="email" value="" name="EMAIL" class="email" id="mce-EMAIL" placeholder="email address" required>
				    <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
				    <div style="position: absolute; left: -5000px;"><input type="text" name="b_c61b1cddac92babd42d7d628e_5610779be6" tabindex="-1" value=""></div>
				    <div class="clear"><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button"></div>
				</form>
			</div>

			<!--End mc_embed_signup-->
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


