
<div class="homepage__header">

	$Header("dark-header","overlay")




	<% if $YearInReviewHeroFeatures %>
		<div class="carousel" id="main-content__container">
			<% loop YearInReviewHeroFeatures %>
				<div class="carousel-cell">
					<% if $Image %>
						<% with $Image %>
						<div class="cell-bg" data-flickity-bg-lazyload="$CroppedFocusedImage(1500,900).URL" <% if $FocusX || $FocusY %>style="background-position: $PercentageX% $PercentageY%;"<% end_if %>>
						<% end_with %>
							<div class="inner">
								<div class="cell-text">
									<span>Featured Page</span>
									<h2>$Title</h2>
									<% if $ButtonText %>
										<% if $ExternalLink %>
											<a href="$ExternalLink" target="_blank" class="cell-btn">$ButtonText</a>
										<% else %>
											<a href="$AssociatedPage.Link" class="cell-btn">$ButtonText</a>
										<% end_if %>
									<% end_if %>
								</div>
							</div>
						</div>
					<% else_if $Video %>
						<div class="cell-bg">
							<div class="fullwidth-video">
								<video playsinline autoplay muted loop autoplay src="$Video.URL" id="vid-bg" class="ani-vid-fadein" style="opacity: 1;" <% if $VideoPoster %>poster="$VideoPoster.CroppedFocusedImage(1500,900).URL"<% end_if %>></video>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 285 80" preserveAspectRatio="xMidYMid slice">
									<defs>
										<mask id="mask" x="0" y="0" width="100%" height="100%" >
											<rect x="0" y="0" width="100%" height="100%" />
											<text x="82"  y="60">2017</text>
										</mask>
									</defs>
									<rect x="0" y="0" width="100%" height="100%" />
								</svg>
							</div>
							<%-- <div class="inner">
								<div class="cell-text">
									<span>Featured Page</span>
									<h2>$Title</h2>
									<% if $ButtonText %>
										<% if $ExternalLink %>
											<a href="$ExternalLink" target="_blank" class="cell-btn">$ButtonText</a>
										<% else %>
											<a href="$AssociatedPage.Link" class="cell-btn">$ButtonText</a>
										<% end_if %>
									<% end_if %>
								</div>
							</div> --%>
						</div>
					<% else %>
						<%-- if no image or video, fallback to a default image --%>
						<% with $Image %>
						<div class="cell-bg" data-flickity-bg-lazyload="division-project/src/images/cell-bg.jpg">
						<% end_with %>
							<div class="inner">
								<div class="cell-text">
									<span>Featured Page</span>
									<h2>$Title</h2>
									<% if $ButtonText %>
										<% if $ExternalLink %>
											<a href="$ExternalLink" target="_blank" class="cell-btn">$ButtonText</a>
										<% else %>
											<a href="$AssociatedPage.Link" class="cell-btn">$ButtonText</a>
										<% end_if %>
									<% end_if %>
								</div>
							</div>
						</div>

					<% end_if %>
				</div>
			<% end_loop %>
		</div>
	<% end_if %>

	<% if $YearInReviewHeroFeatures && $YearInReviewHeroFeatures.Count > 1 %>
		<div class="carousel-nav" data-flickity='{ "asNavFor": ".carousel", "contain": true, "pageDots": false, "prevNextButtons": false, "autoPlay": true }'>
			<% loop YearInReviewHeroFeatures %>
				<div class="carousel-nav-cell">
					$Title
				</div>
			<% end_loop %>
		</div>
	<% end_if %>
</div>

$BlockArea(BeforeContent)

<section class="yir-section">
	<div class="row">
		<div class="columns small-12 large-6">
			<h2 class="header--caps">2017-2018 Year in review</h2>
			<div>
				<p>Each fall, the Division of Student Life has an opportunity to showcase some of the accomplishments from the previous academic year. It is something I look forward to enthusiastically. I see the work of this dedicated and loyal team every single day, so it gives me great pleasure to be able to share it with you.</p>
				<p>Giving students a well-rounded, positive experience during their time at the University of Iowa is our number one goal, and we embrace the important role that Student Life plays in shaping that experience. The staff is committed to presenting students with opportunities for co-curricular learning, leadership, and personal growth.</p>
				<div class="slidetext" style="display:none;">
					<p>As you look through the annual report, you will see how the division is supporting the work of the university’s strategic plan, learn more about initiatives taking place in various departments, and be inspired by the stories of our students and staff. I hope you will take time to reflect on how our work shapes UI as a forward-thinking institution that provides students with a safe, encouraging environment in which to live and flourish.</p>
					<p>At Iowa, we are as committed to our students as ever and remain fiercely loyal to our mission to foster student success by creating and promoting inclusive, educationally purposeful services and activities within and beyond the classroom. You will see examples of this in the following pages, and I hope it makes you as proud as it makes me.</p>
					<p>Thank you for supporting the Division of Student Life. By working together, we have the power to elevate the student experience and change lives.</p>
					<p>Together for UI,<br />
						Melissa
					</p>
				</div>
				<hr class="large" />

				<p><button class="toggletext" data-content="toggle-text">Read More</button></p>
			</div>
		</div>
		<div class="columns small-12 large-5 large-offset-1">
			<img src="{$ThemeDir}/dist/images/melissa.jpg" alt="">
			<small>Melissa S. Shivers, Ph.D.</small>
		</div>
	</div>
</section>

<section class="yir-section yir-stats">

	<div class="stats">
		<div class="stats__box">
			<div class="stats__inner">
				<span class="stats__num">8,408</span>
				<span class="stats__label">Events</span>
			</div>
		</div>
		<div class="stats__box stats__box--span2">
			<div class="stats__inner">
				<span class="stats__num stats__num--lg">1,422,972</span>
				<span class="stats__label">Students</span>
				<span class="stats__copy">Visited the Recreational Services in 2018</span>
			</div>
		</div>
		<div class="stats__box">
			<div class="stats__inner">
				<span class="stats__num">1,264</span>
				<span class="stats__label">Students</span>
				<span class="stats__copy">Served by Student Disability Services in 2018</span>
			</div>
		</div>
		<div class="stats__box">
			<div class="stats__inner">
				<span class="stats__label header--caps">Meet The Class Of</span>
				<span class="stats__num stats__num--thin stats__num--xlg">2017</span>
			</div>
		</div>
		<div class="stats__box stats__box--dm">
			<div class="stats__inner">
				<span class="stats__num stats__num--stroke stats__num--xlg">3M+</span>
				<span class="stats__copy">Raised by UIDM for Children's Hospital</span>
			</div>
		</div>
		<div class="stats__box">
			<button class="cardflip-btn"></button>
			<div class="card-container">
				<div class="card">
					<div class="face front">
						<div class="stats__inner">
							<span class="stats__num">2,135</span>
							<span class="stats__label">Students</span>
							<span class="stats__copy">Attended a violence prevention team workshop</span>
						</div>
					</div>
					<div class="face back">Yo, what up?</div>
				</div>
			</div>
		</div>
		<%-- <div class="stats__box">
			<div class="stats__inner">
				<span class="stats__num">2,135</span>
				<span class="stats__label">Students</span>
				<span class="stats__copy">Attended a violence prevention team workshop</span>
			</div>
		</div> --%>
		<div class="stats__box">
			<div class="stats__inner">
				<span class="stats__num stats__num--thin stats__num--md header--caps">Seventy <span class="gray">Thousand</span></span>
				<span class="stats__copy">Number of students and staff who participated in a group fitness class.</span>
			</div>
		</div>
		<div class="stats__box stats__box--spanAll">
			<div class="stats__inner">
				<span class="stats__num stats__num--xlg stats__num--thin header--caps">2018 Key Statistics</span>
				<span class="stats__copy">The Division of Student Life fosters student success by creating and promoting inclusive educationally <br />purposeful services and activities within and beyond the classroom.</span>
			</div>
		</div>
		<div class="stats__box">
			<div class="stats__inner">
				<span class="stats__num">1,363</span>
				<span class="stats__label">Students</span>
				<span class="stats__copy">Employed by University Housing &amp; Dining</span>
			</div>
		</div>
		<div class="stats__box stats__box--reverse">
			<div class="stats__inner">
				<span class="stats__num">560</span>
				<span class="stats__label">Meals</span>
				<span class="stats__copy">Distributed through Hawkeye Meal Share</span>
			</div>
		</div>
		<div class="stats__box stats__box--span2">
			<div class="stats__inner">
				<span class="stats__num stats__num--lg stats__num--floatleft">36</span>
				<span class="stats__copy stats__copy--alignleft">Women who attended a 5 day residential leadership training institute where they received over 40 hours of training on leadership.</span>
			</div>
		</div>
		<div class="stats__box stats__box--span2 pie">
			<div class="stats__inner">
				<span class="stats__num stats__num--lg stats__num--floatleft ">98%</span>
				<span class="stats__copy stats__copy--alignleft">Overall satisfaction reported by patients for their visit to the Iowa Memorial Union Nurse Care.</span>
			</div>
		</div>
		<div class="stats__box">
			<div class="stats__inner">
				<span class="stats__num stats__num--stroke stats__num--xlg">36</span>
				<span class="stats__copy">New student organizations created in 2018</span>
			</div>
		</div>
		<div class="stats__box stats__box--house">
			<div class="stats__inner">
				<span class="stats__num stats__num--thin stats__num--md header--caps">Sixteen <span class="gray">Thousand</span></span>
				<span class="stats__copy">Number of rooms sold in the Iowa House Hotel in 2017-2018.</span>
			</div>
		</div>
	</div>

</section>

<section class="yir-section yir-stories">
	<div class="column row">
		<% if $StoryTitle %><h2>$StoryTitle</h2><% end_if %>
		<div id="filters">
			<div class="filter">
				<input type="checkbox" name="excel" value=".excel" id="excel">
				<label for="excel">Excel</label>
			</div>
			<div class="filter">
				<input type="checkbox" name="stretch" value=".stretch" id="stretch">
				<label for="stretch">Stretch</label>
			</div>
			<div class="filter">
				<input type="checkbox" name="engage" value=".engage" id="engage">
				<label for="engage">Engage</label>
			</div>
			<div class="filter">
				<input type="checkbox" name="choose" value=".choose" id="choose">
				<label for="choose">Choose</label>
			</div>
			<div class="filter">
				<input type="checkbox" name="serve" value=".serve" id="serve">
				<label for="serve">Serve</label>
			</div>
		</div>
		<br />
	</div>

	<div class="column row">
		<div class="yir-article-container">

			<% loop $Entries %>
				<% include YearInReviewBlogCard %>
			<% end_loop %>

		</div>
	</div><!-- end row -->
</section>

<section class="yir-section yir-video">
	<div class="row">
		<div class="columns small-12">
			<iframe width="560" height="315" src="https://www.youtube.com/embed/e_AgeDadPjI?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
		</div>
	</div>
</section>


$BlockArea(AfterContent)
