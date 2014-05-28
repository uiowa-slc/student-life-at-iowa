<section class="latest-news">
	<div class="container">
		<h1 class="section-title">Latest News</h1>
		<ul class="unstyled justify justify-4">
				<% loop $BlogEntries(4) %>
					<li class="justify-item">
						<h2 class="news-title"><a href="$Link">$Title</a></h2>
						<div class="news-desc">
								$Content.Summary(30)
							<p class="news-date">$Date.Format("M. n")</p>
						</div>
					</li>
				<% end_loop %>
			<li class="justify-item filler"></li>
		</ul>
	</div>
</section>