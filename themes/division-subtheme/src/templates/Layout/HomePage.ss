<div class="head">
	<div class="navpanel">
		$Header("dark-header","overlay")
	</div>
	<div class="headbg">
		<% loop NewHomePageHeroFeatures %>
		<div class="fullwidth-video">
			<video playsinline autoplay muted loop autoplay src="$Video.URL" id="vid-bg" class="ani-vid-fadein" style="opacity: 1;" <% if $VideoPoster %>poster="$VideoPoster.CroppedFocusedImage(1500,900).URL"<% end_if %>></video>
		</div>
		<% end_loop %>
	</div>
	<div class="headinner">
		<div class="inpanel"></div>
	</div>
</div>

<div class="bdcontent"></div>
<div class="bdcontent2"></div>