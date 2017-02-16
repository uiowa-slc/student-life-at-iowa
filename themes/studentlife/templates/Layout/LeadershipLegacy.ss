
<% include MainNav %>


<% loop $AllChildren.Limit(1) %>
	<div class="flexslider legacy-hero">
		<ul class="unstyled slides">
			<% loop $BlogPosts.Sort(Sort) %>
				<li class="flex-active-slide">
					<div class="gradient"></div>
					<div class="flexcaption">
						<a href="$Link" class="link">
							<div class="hero-issue">$Up.Title</div>
							<h2 class="title">$Title</h2>
						</a>
					</div>
					<div class="legacy-hero-img" style="background-image:url('$FeaturedImage.URL');"></div>
				</li>
			<% end_loop %>
		</ul>
	</div>
<% end_loop %>

<div class="container">
	<div class="leader-heading">
		<h3><img src="{$ThemeDir}/images/leadershiplegacy_small.png" class="block" alt="Leadership Legacy Logo"></h3>
	</div>

	<div class="row legacy-holder-content clearfix">
		<div class="col-md-6">
			<div class="legacy-col">
				<h2>Impacting Tomorrow's Leaders</h2>
				$Content
			</div>
		</div>
		<div class="col-md-6">
			<div class="legacy-col">
			<h2>Stay connected to Iowa</h2>
				To continue receiving the Leadership Legacy newsletter by email, update your record online at <a href="http://iowalum.com/update">iowalum.com/update</a>. We look forward to keeping in touch with you through Leadership Legacy!
				<p>If you're not an alum, but would like to receive Leadership Legacy email newsletter, submit your email address below.</p>
				<!-- Begin MailChimp Signup Form -->
				<link href="//cdn-images.mailchimp.com/embedcode/classic-10_7.css" rel="stylesheet" type="text/css">
				<style type="text/css">
					#mc_embed_signup{background:#fff; clear:left; font:14px Helvetica,Arial,sans-serif; }
					/* Add your own MailChimp form style overrides in your site stylesheet or in this style block.
					   We recommend moving this block and the preceding CSS link to the HEAD of your HTML file. */
				</style>
				<div id="mc_embed_signup">
				<form action="//uiowa.us2.list-manage.com/subscribe/post?u=c61b1cddac92babd42d7d628e&amp;id=5610779be6" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
				    <div id="mc_embed_signup_scroll">
					
				<div class="mc-field-group">
					<label for="mce-EMAIL">Your Email Address: </label>
					<input type="email" value="" name="EMAIL" class="required email" id="mce-EMAIL">
				</div>
					<div id="mce-responses" class="clear">
						<div class="response" id="mce-error-response" style="display:none"></div>
						<div class="response" id="mce-success-response" style="display:none"></div>
					</div>    <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
				    <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_c61b1cddac92babd42d7d628e_5610779be6" tabindex="-1" value=""></div>
				    <div class="clear"><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button"></div>
				    </div>
				</form>
				</div>

				<!--End mc_embed_signup-->
			</div>
		</div>
	</div><!-- end .row -->
</div>


<section>
	<div class="container">
		<% loop $AllChildren %>
			<div class="issue-section">
				<h3 class="issue-section-title"><em>$Title</em></h3>
				<ul class="unstyled clearfix">
				<% loop $BlogPosts.Sort(Sort).Limit(1) %>
					<li class="post size-300x360">
						<a href="$Link">
							<figure>
			            	<div class="poster" style="background-image: url('$FeaturedImage.SetHeight(500).URL');"></div>
			            	<figcaption>
			               	$Title
			               </figcaption>
			           	</figure>
						</a>
					</li>
				<% end_loop %>
				<% loop $BlogPosts.Sort(Sort).Limit(4,1) %>
					<li class="post size-180">
						<a href="$Link">
							<figure>
			            	<div class="poster" style="background-image: url('$FeaturedImage.SetHeight(250).URL');"></div>
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


