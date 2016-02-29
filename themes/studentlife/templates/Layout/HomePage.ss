
<section class="upcoming-events clearfix">
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-6">
				<div class="row">
					<div class="col-sm-12">
						<h2 class="text-center"><a href="http://afterclass.uiowa.edu/">Latest Events &rarr;</a></h2>
					</div>
				</div>
				<ul class="unstyled justify justify-2">
					<% with $LocalistCalendar %>
						<% loop $EventList.limit(2) %>
							<li class="justify-item">
								<h3 class="event-title"><a href="$AfterClassLink" target="_blank">$Title</a></h3>
								<% loop $Dates %>
									<p class="date-time">
										<em>
										<% with $StartDateTime %>
											<time itemprop="startDate" datetime="$Format(c)">
												$Format(l), $Format(F) $Format(j)
											</time>at
											$Format("g:i A")
										<% end_with %>
										</em>
									</p>
								<% end_loop %>
								<p class="event-desc">
									$SummaryContent.BigSummary(25)
								</p>
							</li>&nbsp;
						<% end_loop %>
					<% end_with %>
				</ul>
			</div>

			<div class="col-md-6">
				<div class="row">
					<div class="col-sm-12">
						<h2 class="text-center"><a href="news/">Latest News &rarr;</a></h2>
					</div>
				</div>
				<ul class="unstyled justify justify-2">
					<% with Page(news) %>
					<p>$Title</p>
					<% loop $BlogPosts.Limit(2) %>
						<li class="justify-item">
							<h3 class="event-title"><a href="$Link">$Title</a></h3>
							<div class="news-desc">
								<p><em>
									<% include Byline %>
								</em></p>
								<p>$Content.Summary(25)</p>
							</div>
						</li>&nbsp;
					<% end_loop %>
					<% end_with %>
				</ul>
			</div>
		</div>
	</div>
</section>

<!--
<section class="upcoming-events clearfix">
	<div class="container">
		<div id="mc_embed_signup" class="email-signup">
			<form action="http://uiowa.us2.list-manage.com/subscribe/post?u=c61b1cddac92babd42d7d628e&amp;id=8e3635391c" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate form-inlines" role="form" target="_blank" novalidate>
				<h5>Subscribe to our mailing list</h5>

				<div class="row">
					<div class="mc-field-group form-group col-sm-8">
						<label for="mce-EMAIL" class="sr-only">Email Address  <span class="asterisk">*</span></label>
						<input type="email" value="" name="EMAIL" class="required email form-control" id="mce-EMAIL" placeholder="Enter email address">
					</div>
					<div id="mce-responses" class="clear">
						<div class="response" id="mce-error-response" style="display:none"></div>
						<div class="response" id="mce-success-response" style="display:none"></div>
					</div>
					<div style="position: absolute; left: -5000px;"><input type="text" name="b_c61b1cddac92babd42d7d628e_8e3635391c" tabindex="-1" value=""></div>
					<div class="col-sm-4 form-group">
						<input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button btn btn-default btn-block">
					</div>
				</div>
			</form>
			<div class="row">
				<div class="col-xs-12 clearfix social-wrapper">
					<a href="https://www.facebook.com/uistudentlife" class="social-links"><span class="icon-facebook"></span> Facebook</a>&nbsp;
					<a href="https://twitter.com/uistudentlife" class="social-links"><span class="icon-twitter"></span> Twitter</a>
				</div>
			</div>
		</div>
	</div>
</section>
-->
	<% loop Children %>
		$RenderedSection
	<% end_loop %>