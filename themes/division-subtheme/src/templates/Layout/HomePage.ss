<section class="home-feature">
	<div class="home-feature__header">
		$Header("dark-header","overlay")
	</div>

	<div class="home-feature__media">
		<div class="home-feature__herotext">
			<h1 class="title">One Division,<br /> One Mission: Student Success</h1>
		</div>
	</div>

	<div class="home-feature__content-wrap">
		<div class="home-feature__content">
		test
		</div>
	</div>
</section>

<!-- What We Do -->
<section class="whatwedo">
	<div class="row">
		<div class="columns large-10 large-offset-1">
			<h2 class="whatwedo__title">What We Do</h2>
			<p class="whatwedo__text">Vestibulum id ligula porta felis euismod semper. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
		</div>
	</div>




		<% loop $DepartmentsWithPosts %>
			$Title
		<% end_loop %>




	<ul class="infosection">

		<li class="infosection__item">
			<a href="#" class="infosection__link">
				<img src="{$ThemeDir}/dist/images/csil-feature.jpg" alt="" class="infosection__img">
				<div class="infosection__body">
					<h3 class="infosection__title">Culture and Entertainment</h3>
					<p class="infosection__reveal"><span>Learn More</span></p>
				</div>
			</a>
		</li>
		<li class="infosection__item">
			<a href="#" class="infosection__link">
				<img src="{$ThemeDir}/dist/images/csil-feature.jpg" alt="" class="infosection__img">
				<div class="infosection__body">
					<h3 class="infosection__title">Health and Safety</h3>
					<p class="infosection__reveal"><span>Learn More</span></p>
				</div>
			</a>
		</li>
		<li class="infosection__item">
			<a href="#" class="infosection__link">
				<img src="{$ThemeDir}/dist/images/csil-feature.jpg" alt="" class="infosection__img">
				<div class="infosection__body">
					<h3 class="infosection__title">Leadership Development</h3>
					<p class="infosection__reveal"><span>Learn More</span></p>
				</div>
			</a>
		</li>
		<li class="infosection__item">
			<a href="#" class="infosection__link">
				<img src="{$ThemeDir}/dist/images/csil-feature.jpg" alt="" class="infosection__img">
				<div class="infosection__body">
					<h3 class="infosection__title">Recreation and Wellness</h3>
					<p class="infosection__reveal"><span>Learn More</span></p>
				</div>
			</a>
		</li>
		<li class="infosection__item">
			<a href="#" class="infosection__link">
				<img src="{$ThemeDir}/dist/images/csil-feature.jpg" alt="" class="infosection__img">
				<div class="infosection__body">
					<h3 class="infosection__title">Residence Life</h3>
					<p class="infosection__reveal"><span>Learn More</span></p>
				</div>
			</a>
		</li>
		<li class="infosection__item">
			<a href="#" class="infosection__link">
				<img src="{$ThemeDir}/dist/images/csil-feature.jpg" alt="" class="infosection__img">
				<div class="infosection__body">
					<h3 class="infosection__title">Student Activities</h3>
					<p class="infosection__reveal"><span>Learn More</span></p>
				</div>
			</a>
		</li>
		<li class="infosection__item">
			<a href="#" class="infosection__link">
				<img src="{$ThemeDir}/dist/images/csil-feature.jpg" alt="" class="infosection__img">
				<div class="infosection__body">
					<h3 class="infosection__title">Iowa Challenge</h3>
					<p class="infosection__reveal"><span>Learn More</span></p>
				</div>
			</a>
		</li>
	</ul>
</section>
<!-- End What We Do -->


<!-- Newsletter Sign Up -->
<section class="homepage-signup">
	<div class="row">
		<div class="columns large-8 large-offset-2">
			<p class="homepage-signup__text">Sign up to receive emails on the latest information on upcoming events and news about Student Life.</p>

			<!-- Begin MailChimp Signup Form -->
			<link href="//cdn-images.mailchimp.com/embedcode/horizontal-slim-10_7.css" rel="stylesheet" type="text/css">
			<style type="text/css">
				#mc_embed_signup{background:#fff; clear:left; font:14px Helvetica,Arial,sans-serif; width:100%;}
			</style>
			<div id="mc_embed_signup">
				<form action="https://uiowa.us2.list-manage.com/subscribe/post?u=c61b1cddac92babd42d7d628e&amp;id=8e3635391c" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
					<div id="mc_embed_signup_scroll">
						<label for="mce-EMAIL">Subscribe to our mailing list</label>
						<input type="email" value="" name="EMAIL" class="email" id="mce-EMAIL" placeholder="email address" required>
						<!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
						<div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_c61b1cddac92babd42d7d628e_8e3635391c" tabindex="-1" value=""></div>
						<div class="clear"><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button"></div>
					</div>
				</form>
			</div>
			<!--End mc_embed_signup-->
		</div>
	</div>
</section>
<!-- End Newsletter Signup


<!-- Spotlight Feature -->
<section class="spotlight">
	<div class="column row">
		<div class="spotlight__container">
			<h3 class="spotlight__title">Iowa Challenge</h3>
			<div class="spotlight__text">
				<p>Etiam porta sem malesuada magna mollis euismod. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Donec id elit non mi porta gravida at eget metus. Donec sed odio dui.</p>
			</div>
			<ul class="spotlight__list">
				<li class="spotlight__list-item"><a href="#">Purus Sollicitudin Consectetur Cursus Mollis Sollicitudin Vestibulum Ridiculus</a></li>
				<li class="spotlight__list-item"><a href="#">Cursus Mollis Sollicitudin</a></li>
				<li class="spotlight__list-item"><a href="#">Sem Vestibulum Ridiculus</a></li>
			</ul>
		</div>
	</div>
</section>
<!-- End Spotlight Feature -->


<!-- Departments -->
<section class="dept-slider">
	<div class="">
		<div class="dept-slider__mast">

		</div>
		<div class="dept-slider__gallery">

		</div>
	</div>
</section>
<!-- End Departments -->


<!-- Instagram Feed -->
<section class="instafeed">
	<div class="row">
		<div class="columns">
			<h3>Follow us on Instagram <a href="https://www.instagram.com/uiowaimu/">@uiowaimu</a></h3>
			<!-- LightWidget WIDGET - lightwidget.com --><script src="//lightwidget.com/widgets/lightwidget.js"></script><iframe src="//lightwidget.com/widgets/d42f1547dd2c56fb8ad082838075f620.html" scrolling="no" allowtransparency="true" class="lightwidget-widget" style="width: 100%; border: 0; overflow: hidden;"></iframe>
		</div>
	</div>
</section>





