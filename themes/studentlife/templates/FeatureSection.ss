<!-- <section class="fixed bg{$Pos}" data-bottom-top="background-position: 50% 100%"  data-top-bottom="background-position: 50% 0%" style="background-image: url('$BackgroundImage.URL');"> -->
<section class="fixed feature-section" style="background-image: url('$BackgroundImage.URL');">
	<div class="feature-section-inner" data-bottom-top="background-color:rgba(0,0,0,.2);" data-top-bottom="background-color:rgba(0,0,0,.7);">
		<div class="container">
			<h1 class="section-title">$Title</h1>
			<div class="section-desc">$Content</div>
			<ul class="unstyled justify justify-4 feature-callouts">
				<% loop Features.Limit(4) %>
				<li class="callout justify-item">
					<a href="#">
						<img src="{$Image.CroppedImage(250, 400).URL}" />
						<button>View</button>
						<div class="callout-content">
							<h3>$Title</h3>
							<p>$Content</p>
						</div>
					</a>
				</li>
				<% end_loop %>
			</ul>
			<!-- <div id="" class="clearfix">
				<% loop Features.Limit(4) %>
				<a href="$Link">
					<figure>
						<img src="{$Image.URL}" />
						<figcaption>
							<h2>$Title</h2>
							<p>$Content</p>
							<button>View</button>
						</figcaption>
					</figure>
				</a>
				<% end_loop %>
			</div> -->
		</div>
	</div>
</section>
