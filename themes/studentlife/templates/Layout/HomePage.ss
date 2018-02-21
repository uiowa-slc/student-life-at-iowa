
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

<section class="homeSlide feature-8">

	<div id="Get Involved" class="fixed" data-center="background-position: 50% 0px;" data-top-bottom="background-position: 50% -150px;" data-bottom-top="background-position: 50% 50px;" style="background-image: url(assets/feature-section-bg/get-involved-new.jpg);">

		<div class="feature-section-inner" data-bottom-top="background-color:rgba(0,0,0,.2);" data-top-bottom="background-color:rgba(0,0,0,.7);">

		<div class="container">
			<h1 class="section-title">Get Involved</h1>
			<div class="section-desc"><p>Book a lecture, plan a campus event, or start a new student organization. The Division of Student Life offers hundreds of opportunities to get involved, volunteer, develop skills, and make a difference. </p></div>
			<div class="unstyled feature-callouts responsive">
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://csil.uiowa.edu">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/csil-feature.jpg" alt="Student Organizations" />
							<button>View</button>
							<div class="callout-content">
								<h3>Student Organizations</h3>
								<p>Join one of over 500 student organizations to stay connected to campus, develop leadership skills, &amp; have fun!</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://uisg.uiowa.edu/">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/student-government.jpg" alt="Student Government" />
							<button>View</button>
							<div class="callout-content">
								<h3>Student Government</h3>
								<p>By students, for students. UISG and GPSG work to support &amp; improve the student experience at Iowa. </p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://wrac.uiowa.edu">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/wrac.jpg" alt="Women&#039;s Resource &amp; Action Center" />
							<button>View</button>
							<div class="callout-content">
								<h3>Women&#039;s Resource &amp; Action Center</h3>
								<p>Empowering individuals and fighting oppression since 1971</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://pickone.uiowa.edu">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/_resampled/FillWyIzNDQiLCI2MDAiXQ/pickone.jpg" alt="Pick One" />
							<button>View</button>
							<div class="callout-content">
								<h3>Pick One</h3>
								<p>Pick one organization to boost your campus experience. </p>
							</div>
						</a>
					</div>
				</div>
				
			</div>
		</div>

		</div>

	</div>

</section>

	
		

<section class="homeSlide feature-10">

	<div id="Student Success" class="fixed" data-center="background-position: 50% 0px;" data-top-bottom="background-position: 50% -150px;" data-bottom-top="background-position: 50% 50px;" style="background-image: url(assets/feature-section-bg/student-success.jpg);">

		<div class="feature-section-inner" data-bottom-top="background-color:rgba(0,0,0,.2);" data-top-bottom="background-color:rgba(0,0,0,.7);">

		<div class="container">
			<h1 class="section-title">Student Success</h1>
			<div class="section-desc"><p><span>We ensure that every Hawkeye has access to the tools and connections they need to make their University experience unique and complete.</span></p></div>
			<div class="unstyled feature-callouts responsive">
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://dos.uiowa.edu">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/_resampled/FillWyIzNDQiLCI2MDAiXQ/dean.jpg" alt="Dean of Students" />
							<button>View</button>
							<div class="callout-content">
								<h3>Dean of Students</h3>
								<p>Engaging students, supporting positive community behavior, and enriching the college experience.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://csil.uiowa.edu/leadership">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/_resampled/FillWyIzNDQiLCI2MDAiXQ/leadership.jpg" alt="Leadership Programs" />
							<button>View</button>
							<div class="callout-content">
								<h3>Leadership Programs</h3>
								<p>Building tomorrow&#039;s leaders today.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://vp.studentlife.uiowa.edu/initiatives/grow/">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/iowa-grow.jpg" alt="Iowa GROW" />
							<button>View</button>
							<div class="callout-content">
								<h3>Iowa GROW</h3>
								<p>Enhancing student development through work-life connections. </p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://sds.studentlife.uiowa.edu">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/sds-thumb.jpg" alt="Disability Services" />
							<button>View</button>
							<div class="callout-content">
								<h3>Disability Services</h3>
								<p>Providing solutions and overcoming challenges. </p>
							</div>
						</a>
					</div>
				</div>
				
			</div>
		</div>

		</div>

	</div>

</section>

	
		

<section class="homeSlide feature-11">

	<div id="Culture and Entertainment" class="fixed" data-center="background-position: 50% 0px;" data-top-bottom="background-position: 50% -150px;" data-bottom-top="background-position: 50% 50px;" style="background-image: url(assets/feature-section-bg/culture-entertainment.jpg);">

		<div class="feature-section-inner" data-bottom-top="background-color:rgba(0,0,0,.2);" data-top-bottom="background-color:rgba(0,0,0,.7);">

		<div class="container">
			<h1 class="section-title">Culture and Entertainment</h1>
			<div class="section-desc"><p>Three cultural centers and an LGBTQ Resource Center, dozens of multicultural organizations, and entertainment opportunities help enrich and stretch the student experience.</p></div>
			<div class="unstyled feature-callouts responsive">
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://csil.uiowa.edu/multicultural/">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/_resampled/FillWyIzNDQiLCI2MDAiXQ/cultural-centers.jpg" alt="Cultural Centers" />
							<button>View</button>
							<div class="callout-content">
								<h3>Cultural Centers</h3>
								<p>Creating a multicultural and inclusive community for students.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://lectures.uiowa.edu/">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/lecturecommittee-jane.jpg" alt="Lecture Committee" />
							<button>View</button>
							<div class="callout-content">
								<h3>Lecture Committee</h3>
								<p>Bringing the University face-to-face with the world&#039;s notable thinkers throughout each academic year.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://cab.uiowa.edu/">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/_resampled/FillWyIzNDQiLCI2MDAiXQ/cab-thumb.jpg" alt="Campus Activities Board" />
							<button>View</button>
							<div class="callout-content">
								<h3>Campus Activities Board</h3>
								<p>We provide a wide range of awesome activities for students every week throughout the year.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://scope.uiowa.edu/">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/scope.jpg" alt="Scope" />
							<button>View</button>
							<div class="callout-content">
								<h3>Scope</h3>
								<p>Bringing quality concerts and entertainment to the University of Iowa campus and  community.</p>
							</div>
						</a>
					</div>
				</div>
				
			</div>
		</div>

		</div>

	</div>

</section>

	
		

<section class="homeSlide feature-12">

	<div id="Recreation and Wellness" class="fixed" data-center="background-position: 50% 0px;" data-top-bottom="background-position: 50% -150px;" data-bottom-top="background-position: 50% 50px;" style="background-image: url(assets/feature-section-bg/recreation-new.jpg);">

		<div class="feature-section-inner" data-bottom-top="background-color:rgba(0,0,0,.2);" data-top-bottom="background-color:rgba(0,0,0,.7);">

		<div class="container">
			<h1 class="section-title">Recreation and Wellness</h1>
			<div class="section-desc"><p>We offer a variety of programs for all ages. Take a look around and discover the exciting recreation opportunities at the University of Iowa.</p></div>
			<div class="unstyled feature-callouts responsive">
				
				<div class="callout">
					<div class="callout-margin">
						<a href="https://recserv.uiowa.edu/">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/recreation.jpg" alt="Recreational Services" />
							<button>View</button>
							<div class="callout-content">
								<h3>Recreational Services</h3>
								<p>Recreational Services is here to serve the recreation needs of the University Community.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://recserv.uiowa.edu/intramural-sports">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/intramural.jpg" alt="Intramural Sports" />
							<button>View</button>
							<div class="callout-content">
								<h3>Intramural Sports</h3>
								<p>Offering an extensive range of sport leagues, tournaments, and events for University of Iowa students, faculty and staff.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://studenthealth.uiowa.edu/wellness/">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/wellness.jpg" alt="Wellness Services" />
							<button>View</button>
							<div class="callout-content">
								<h3>Wellness Services</h3>
								<p>Supporting individuals in their pursuit of optimal health and well-being.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://recserv.uiowa.edu/facilities/outdoor-rental-center">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/outdoor-rental.jpg" alt="Outdoor Rental Center" />
							<button>View</button>
							<div class="callout-content">
								<h3>Outdoor Rental Center</h3>
								<p>Quality outdoor equipment is available for rent. </p>
							</div>
						</a>
					</div>
				</div>
				
			</div>
		</div>

		</div>

	</div>

</section>

	
		

<section class="homeSlide feature-13">

	<div id="Health and Safety" class="fixed" data-center="background-position: 50% 0px;" data-top-bottom="background-position: 50% -150px;" data-bottom-top="background-position: 50% 50px;" style="background-image: url(assets/feature-section-bg/health-safety.jpg);">

		<div class="feature-section-inner" data-bottom-top="background-color:rgba(0,0,0,.2);" data-top-bottom="background-color:rgba(0,0,0,.7);">

		<div class="container">
			<h1 class="section-title">Health and Safety</h1>
			<div class="section-desc"><p>We support student wellness and learning through educational and health promotion services that help students create healthy lifestyles.</p></div>
			<div class="unstyled feature-callouts responsive">
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://studenthealth.uiowa.edu/">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/_resampled/FillWyIzNDQiLCI2MDAiXQ/studenthealth.jpg" alt="Student Health and Wellness" />
							<button>View</button>
							<div class="callout-content">
								<h3>Student Health and Wellness</h3>
								<p>Delivering quality healthcare and promoting healthy lifestyles for all University of Iowa students.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://counseling.studentlife.uiowa.edu">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/_resampled/FillWyIzNDQiLCI2MDAiXQ/barry-counseling.jpg" alt="Counseling Services" />
							<button>View</button>
							<div class="callout-content">
								<h3>Counseling Services</h3>
								<p>Psychological services, outreach, and training that foster the mental health of students.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://vp.studentlife.uiowa.edu/initiatives/alcohol-harm-reduction/">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/harm-reduction.jpg" alt="Harm Reduction" />
							<button>View</button>
							<div class="callout-content">
								<h3>Harm Reduction</h3>
								<p>Taking a proactive and comprehensive approach to reducing high-risk drinking and related harms to students.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://osmrc.uiowa.edu/">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/_resampled/FillWyIzNDQiLCI2MDAiXQ/osmrc-thumb.jpg" alt="Office of the Sexual Misconduct Response Coordinator" />
							<button>View</button>
							<div class="callout-content">
								<h3>Office of the Sexual Misconduct Response Coordinator</h3>
								<p>(OSMRC) coordinates the university&#039;s response to reports of sexual assault, sexual harassment, domestic violence, and stalking.</p>
							</div>
						</a>
					</div>
				</div>
				
			</div>
		</div>

		</div>

	</div>

</section>

	
		

<section class="homeSlide feature-15">

	<div id="Living On Campus" class="fixed" data-center="background-position: 50% 0px;" data-top-bottom="background-position: 50% -150px;" data-bottom-top="background-position: 50% 50px;" style="background-image: url(assets/feature-section-bg/living-on-campus.jpg);">

		<div class="feature-section-inner" data-bottom-top="background-color:rgba(0,0,0,.2);" data-top-bottom="background-color:rgba(0,0,0,.7);">

		<div class="container">
			<h1 class="section-title">Living On Campus</h1>
			<div class="section-desc"><p>Embrace your sense of adventure, broaden your horizons, and make the most of your college years by exploring the University of Iowa and the Iowa City area.</p></div>
			<div class="unstyled feature-callouts responsive">
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://housing.uiowa.edu">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/housing-50.jpg" alt="Housing" />
							<button>View</button>
							<div class="callout-content">
								<h3>Housing</h3>
								<p>Providing clean, well-maintained, secure, healthy, and affordable housing options designed to meet the needs of student living.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://dining.uiowa.edu/">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/housing-dining.jpg" alt="Dining" />
							<button>View</button>
							<div class="callout-content">
								<h3>Dining</h3>
								<p>University Dining offers students, faculty, and staff a welcoming, affordable dining experience just around the corner.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://housing.uiowa.edu/living-learning-communities">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/llc.jpg" alt="Living Learning Communities" />
							<button>View</button>
							<div class="callout-content">
								<h3>Living Learning Communities</h3>
								<p>Offering over 30 unique living-learning communities for students.</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="callout">
					<div class="callout-margin">
						<a href="http://housing.uiowa.edu/associated-residence-halls-arh">
							<img class="lazyload" src="themes/studentlife/images/placeholder-home.jpg" data-src="assets/Uploads/residence-hall-30.jpg" alt="Associated Residence Halls" />
							<button>View</button>
							<div class="callout-content">
								<h3>Associated Residence Halls</h3>
								<p>Associated Residence Halls (ARH) is an active organization whose mission is to serve as an advocate for student residents.</p>
							</div>
						</a>
					</div>
				</div>
				
			</div>
		</div>

		</div>

	</div>

</section>

	
		  <section class="leadership-legacy-section" style="background-image: url(themes/studentlife/images/leadershape.jpg);">
		<div class="wrapper">
			<img src="themes/studentlife/images/leadership-legacy-logo.png" alt="Leadership Legacy">
			<a href="/leadership-legacy/" class="link">Read the Leadership Legacy Newsletter</a>
		</div>
  </section>