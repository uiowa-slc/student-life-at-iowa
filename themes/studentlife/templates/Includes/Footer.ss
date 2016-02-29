<!-- Footer -->
<footer class="footer clearfix" role="contentinfo">
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<a href="http://studentlife.uiowa.edu" class="hide-print"><img src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" data-src="{$ThemeDir}/images/dosl-uiowa.png" alt="Division Of Student Life" class="lazyload" style="margin-top: -20px;"></a><br>
				<p>The Division of Student Life fosters student success by creating and promoting inclusive educationally purposeful services and activities within and beyond the classroom.</p>
				<p>249 Iowa Memorial Union, Iowa City, IA 52242<br>
					Phone: 319-335-3557</p>
			</div>
			<div class="col-md-4">
				<div class="row">
					<div class="col-xs-6">
						<ul class="footer-nav">
							<% loop Menu(1) %>
								<li><a href="$Link">$MenuTitle</a></li>
							<% end_loop %>
						</ul>
					</div>
					<div class="col-xs-6">
						<ul class="footer-nav">
							<li><a href="https://www.facebook.com/uistudentlife"><span class="icon-facebook"></span> Facebook</a></li>
							<li><a href="https://twitter.com/uistudentlife"><span class="icon-twitter"></span> Twitter</a></li>
							<li><a href="https://www.youtube.com/user/imubuddy"><span class="icon-youtube"></span> Youtube</a></li>
							<li><a href="https://www.flickr.com/photos/imubuddy"><span class="icon-flickr"></span> Flickr</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<h4>Support The Division</h4>
				<p>Gifts through the Vice President for Student Life Development Fund allow us to continue and enhance our efforts to prepare students for a successful life in school and beyond.</p>
				<a href="https://www.givetoiowa.org/GiveToIowa/WebObjects/GiveToIowa.woa/wa/goTo?area=studentlife" class="appt-btn">Give Online Now</a>
				<!-- <div class="clearfix">
					<div class="fb-like-box" data-href="https://www.facebook.com/uistudentlife" data-height="70px" data-colorscheme="dark" data-show-faces="false" data-header="false" data-stream="false" data-show-border="false"></div>
				</div>
				<br>
				<div>
					<a href="https://twitter.com/imubuddy" class="twitter-follow-button" data-show-count="true" data-lang="en" data-size="medium">Follow @twitterapi</a>
				</div>
			</div> -->
		</div>
		<hr>
		<% include CopyrightPrivacyFooter %>
	</div>
</footer>