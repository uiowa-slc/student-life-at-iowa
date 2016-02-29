

<section class="homeSlide feature-$ID">

	<div id="$Title" class="fixed lazyload" data-center="background-position: 50% 0px;" data-top-bottom="background-position: 50% -150px;" data-bottom-top="background-position: 50% 50px;" style="background-image: url(data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7);" data-src="$BackgroundImage.URL">

		<div class="feature-section-inner" data-bottom-top="background-color:rgba(0,0,0,.2);" data-top-bottom="background-color:rgba(0,0,0,.7);">

		<div class="container">
			<h1 class="section-title">$Title</h1>
			<div class="section-desc">$Content</div>
			<div class="unstyled feature-callouts responsive">
				<% loop Features.Limit(4) %>
				<div class="callout">
					<div class="callout-margin">
						<a href="$Link">
							<img class="lazyload" src="{$ThemeDir}/images/placeholder-home.jpg" data-src="{$Image.CroppedImage(344, 600).URL}" alt="$Title" />
							<button>View</button>
							<div class="callout-content">
								<h3>$Title</h3>
								<p>$Content</p>
							</div>
						</a>
					</div>
				</div>
				<% end_loop %>
			</div>
		</div>

		</div>

	</div>

</section>
