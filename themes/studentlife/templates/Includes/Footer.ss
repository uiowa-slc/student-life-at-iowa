<!-- Footer -->
<footer class="footer clearfix" role="contentinfo">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<a href="http://studentlife.uiowa.edu" class="hide-print"><img src="{$ThemeDir}/images/dosl-uiowa.png" alt="Division Of Student Life" style="margin-top: -20px;"></a><br>
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
							<li><a href="https://www.facebook.com/uistudentlife">Facebook</a></li>
							<li><a href="https://twitter.com/imubuddy">Twitter</a></li>
							<li><a href="https://www.youtube.com/user/imubuddy">Youtube</a></li>
							<li><a href="https://www.flickr.com/photos/imubuddy">Flickr
							<li><a href="http://instagram.com/imubuddy">Instagram</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="clearfix">
					<div class="fb-like-box" data-href="https://www.facebook.com/uistudentlife" data-height="70px" data-colorscheme="dark" data-show-faces="false" data-header="false" data-stream="false" data-show-border="false"></div>
				</div>
				<br>
				<div>
					<a href="https://twitter.com/imubuddy" class="twitter-follow-button" data-show-count="true" data-lang="en" data-size="medium">Follow @twitterapi</a>
				</div>
			</div>
		</div>
		<hr>
		<p>&copy; $Now.Year <a href="http://www.uiowa.edu/" target="_blank">The University of Iowa</a>. All Rights Reserved.</p>
	</div>
</footer>