
<div class="homepage__header">

    $Header


    <% if $YearInReviewHeroFeatures %>
        <div class="yir-carousel" id="main-content__container">
            <% loop YearInReviewHeroFeatures %>
                <div class="yir-carousel-cell">
                    <% if $Image %>
                        <% with $Image %>
                        <div class="cell-bg" data-flickity-bg-lazyload="$FocusFill(1500,900).URL" <% if $FocusX || $FocusY %>style="background-position: $PercentageX% $PercentageY%;"<% end_if %>>
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
                                <% if $Title %>
                                    <div class="video-title">
                                        $Title
                                    </div>
                                <% end_if %>
                                <video playsinline autoplay muted loop autoplay src="$Video.URL" id="vid-bg" class="ani-vid-fadein" style="opacity: 1;" <% if $VideoPoster %>poster="$VideoPoster.FocusFill(1500,900).URL"<% end_if %>></video>
                            </div>
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

</div>

$BeforeContent

$YirContent

<section class="yir-section yir-stories">
    <header class="featuredpageblock-bg yir-story-intro dp-lazy" data-original="<% if $StoryPhoto %>$StoryPhoto.FocusFill(1400,500).URL<% end_if %>">
        <div class="column row">
            <% if $StoryContent %>$StoryContent<% end_if %>
        </div>
    </header>

    <section class="filter-container">
        <div class="column row">
            <div id="filters" class="button-group">
                <button class="filter is-checked" data-filter="*">Show All</button>
                <button class="filter" data-filter=".excel">Excel</button>
                <button class="filter" data-filter=".stretch">Stretch</button>
                <button class="filter" data-filter=".engage">Engage</button>
                <button class="filter" data-filter=".choose">Choose</button>
                <button class="filter" data-filter=".serve">Serve</button>
            </div>
        </div>
    </section>

    <div class="column row">
        <div class="yir-article-container">

            <% loop $Entries %>
                <% include YearInReviewBlogCard %>
            <% end_loop %>

        </div>
    </div><!-- end row -->

</section>

$AfterContent
<% if $SecondaryContent || $SecondaryContentVideo %>
<section class="yir-section yir-video">

	<% if $SecondaryContentVideo %>
	<div class="row">
		<div class="columns small-12">
			<iframe width="560" height="315" src="https://www.youtube.com/embed/{$SecondaryContentVideo}?rel=0" title="year in review video" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
		</div>
	</div>
	<% end_if %>

	<% if $SecondaryContent %>
	<div class="row">
		<div class="columns small-12">
			$SecondaryContent
		</div>
	</div>
	<% end_if %>
</section>
<% end_if %>
