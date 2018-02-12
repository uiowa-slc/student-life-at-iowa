<div class="bg-media bg-media--image" data-interchange="[$BackgroundImage.CroppedFocusedImage(600,400).URL, small], [$BackgroundImage.CroppedFocusedImage(1600,700).URL, medium]">
	<div class="header__screen header__screen--fill-container header__screen--thin"></div>
	$Header("dark-header","overlay")
	<div class="column row">
		<div class="background-image__header">
			<h1 class="background-image__title">$Title</h1>
		</div>
	</div>
</div>

<div class="main-content__container main-content--has-video-bg">
	$Breadcrumbs

	<% if not $BackgroundImage %>
		<div class="column row">
			<div class="main-content__header">
				<h1>$Title</h1>
			</div>
		</div>
	<% end_if %>

	$BlockArea(BeforeContent)



	<div class="row">

		<article role="main" class="main-content main-content--with-padding <% if $Children || $Menu(2) || $SidebarBlocks ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
			$BlockArea(BeforeContentConstrained)
			<% if $MainImage %>
				<img class="main-content__main-img" src="$MainImage.ScaleMaxWidth(500).URL" alt="" role="presentation"/>
			<% end_if %>
			<div class="main-content__text">
				$Content
			</div>
			$BlockArea(AfterContentConstrained)
			$Form
			<% if $ShowChildPages %>
				<% include ChildPages %>
			<% end_if %>
		</article>
		<aside class="sidebar dp-sticky">
			<% include SideNav %>
			<% if $SideBarView %>
				$SideBarView
			<% end_if %>
			$BlockArea(Sidebar)
		</aside>
	</div>

	<!-- begin stats section -->
	<div class="dept-stats">
		<div class="row">
			<div class="column">
				<h2>Key Statistics</h2>
			</div>
		</div>
		<div class="stat-cards">
			<div class="stat-card">
				<h5 class="stat-card__digit">$KeyStat1Num</h5>
				<div class="stat-card__text">$KeyStat1Body</div>
			</div>
			<div class="stat-card">
				<h5 class="stat-card__digit">$KeyStat2Num</h5>
				<div class="stat-card__text">$KeyStat2Body</div>
			</div>
			<div class="stat-card">
				<h5 class="stat-card__digit">$KeyStat3Num</h5>
				<div class="stat-card__text">$KeyStat3Body</div>
			</div>
		</div>
	</div>
	<!-- end stats section -->

	<!-- begin recent news -->
	<% if $NewsEntries %>
	<div class="block_area_aftercontent">
		<section class="content-block__container" aria-labelledby="DeptNewsTitle">
			<div class="content-block row">
				<div class="newsblock">
					<div class="column">
						<h3 id="DeptNewsTitle" class="newsblock-title text-center">Recent News for $Title</h3>
					</div>
					<ul class="medium-up-3 ">
						<% loop $NewsEntries.limit(3) %>
							<li class="column column-block">
								<% include BlogCard %>
							</li>
						<% end_loop %>
					</ul>
				</div>
			</div>
		</section>
	</div>
	<% end_if %>
	<!-- end recent news -->



	$BlockArea(AfterContent)


</div>