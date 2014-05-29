

<section class="homeSlide feature-$ID">

	<div id="$Title" class="fixed" data-center="background-position: 50% 0px;" data-top-bottom="background-position: 50% -150px;" data-bottom-top="background-position: 50% 50px;" style="background-image: url('$BackgroundImage.URL');">

		<div class="feature-section-inner" data-bottom-top="background-color:rgba(0,0,0,.2);" data-top-bottom="background-color:rgba(0,0,0,.7);">

		<div class="container">
			<h1 class="section-title">$Title</h1>
			<div class="section-desc">$Content</div>
			<div class="home-flexslider">
				<ul class="unstyled justify feature-callouts slides">
					<% loop Features.Limit(4) %>
					<li class="callout justify-item">
						<a href="$Link">
							<img src="{$Image.CroppedImage(430, 750).URL}" class="" />
							<button>View</button>
							<div class="callout-content">
								<h3>$Title</h3>
								<p>$Content</p>
							</div>
						</a>
					</li>
					<% end_loop %>
				</ul>
			</div>
		</div>

		</div>

	</div>

</section>
