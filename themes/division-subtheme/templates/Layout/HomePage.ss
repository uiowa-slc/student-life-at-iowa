
$Header

<main id="main-content__container">
    <div class="hero <% if $SubHeading || $ButtonTextOne %>hero--content<% end_if %> hero--$Position">
        <div class="hero__imgwrap hero__imgwrap--$Size hero__imgwrap--$Background"
            <% if $Background = "image" %>
                <% if $HeroImage %>
                    data-interchange="[$HeroImage.FocusFill(768,400).URL, small], [$HeroImage.FocusFill(1024,400).URL, medium], [$HeroImage.FocusFill(1700,638).URL, large]" style="background-position: {$HeroImage.PercentageX}% {$HeroImage.PercentageY}%"
                <% else %>
                    style="background-image:url({$ThemeDir}/dist/images/hero-placeholder.jpg)"
                <% end_if %>
            <% end_if %>
        >
            <% if $Background = "video" %>
                <button onclick="playPause()" id="play-pause" class="pause" aria-pressed="false" aria-label="pause">
                    <span class="show-for-sr">Pause</span>
                </button>
                <video autoplay muted loop id="hero__video">
                    <source src="$HeroVideo.URL" type="video/mp4">
                </video>
            <% end_if %>

        </div>

        <% if $SubHeading || $ButtonUrlOne || $ButtonUrlTwo || $ButtonUrlThree %>
            <div class="hero__contentwrap grid-container">
                <div class="hero__content">
                    <% if $SubHeading %>
                        <h2>$SubHeading</h2>
                    <% end_if %>
                    <% if $ButtonUrlOne %>
                        <a href="$ButtonUrlOne" class="button">$ButtonTextOne <i class="fas fa-arrow-right"></i></a>
                    <% end_if %>
                    <% if $ButtonUrlTwo %>
                        <a href="$ButtonUrlTwo" class="button">$ButtonTextTwo <i class="fas fa-arrow-right"></i></a>
                    <% end_if %>
                    <% if $ButtonUrlThree %>
                        <a href="$ButtonUrlThree" class="button">$ButtonTextThree <i class="fas fa-arrow-right"></i></a>
                    <% end_if %>
                </div>
            </div>
        <% end_if %>
    </div>

    <% if $Announcement %>
        <div class="home-announcement">
            <div class="grid-container">
                <div class="grid-x grid-margin-x">
                    <div class="cell">$Announcement</div>
                </div>
            </div>
        </div>
    <% end_if %>

    <div class="home-news">
        <div class="grid-container">
            <div class="grid-x grid-margin-x">
                <div class="cell">
                    <div class="card__head margin-top-0">
                        <h2 class="text-center serif text-semibold h1">Latest News</h2>
                        <a href="{$BaseHref}news/" class="button clear">View All News <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="grid-x grid-margin-x">
                <div class="cell medium-6">
                    <div class="news-main">
                        <% with $Page(news) %>
                            <% loop $FeaturedNews.limit(1) %>
                                <a href="$Link" class="news-main__link">
                                    <% if $FeaturedImage %>
                                    <img data-interchange="[$FeaturedImage.FocusFill(700,466).URL, small], [$FeaturedImage.FocusFill(600,700).URL, medium]" alt="<% if $FeaturedImageAltText %>$FeaturedImageAltText<% else %>$Title<% end_if %>" class="news-main__img width-100">
                                    <% else %>
                                        <img data-interchange="[{$ThemeDir}/dist/images/news-placeholder-s.jpg, small], [{$ThemeDir}/dist/images/news-placeholder.jpg, medium]" alt="$Title" class="news-main__img width-100">
                                    <% end_if %>
                                    <div class="news-main__content">
                                        <h3 class="news-main__title margin-0">$Title</h3>
                                        <div class="card__author">
                                            <% include Author %>
                                        </div>
                                    </div>
                                </a>
                            <% end_loop %>
                        <% end_with %>
                    </div>
                </div>
                <div class="cell medium-6">
                    <div class="news-secondary">
                        <% with $Page(news) %>
                            <div class="news-secondary__list">
                                <% loop $FeaturedNews.limit(3, 1) %>
                                    <article class="card card--horizontal">
                                        <% if $FeaturedImage %>
                                            <div class="card__media">
                                                <a href="$Link" class="">
                                                    <img src="$FeaturedImage.FocusFill(500,333).URL" class="card__img" loading="lazy" <% if $FeaturedImageAltText %> alt="$FeaturedImageAltText" <% else %> alt="$Title" role="presentation" <% end_if %>>
                                                </a>
                                            </div>
                                        <% end_if %>

                                        <div class="card__body">
                                            <h3 class="card__title">
                                                <a href="$Link">$Title</a>
                                            </h3>
                                            <div class="card__author">
                                                <% include Author %>
                                            </div>
                                            <% if not $Parent.HideSummaries %>
                                                <% if $Summary %>
                                                    <div class="show-for-large">$Summary</div>
                                                <% else %>
                                                    <p class="show-for-large">$Content.FirstSentence</p>
                                                <% end_if %>
                                            <% end_if %>

                                        </div>
                                    </article>
                                <% end_loop %>
                            </div>
                        <% end_with %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="home-events">
        <div class="grid-container">
            <div class="grid-x grid-margin-x">
                <div class="cell">
                    <div class="card__head margin-top-0">
                        <h2 class="text-center serif text-semibold h1">Upcoming Events</h2>
                        <a href="{$BaseHref}events/" class="button clear margin-bottom-0">View All Events <i class="fas fa-arrow-right"></i></a>
                    </div>

                    <% with $Page(events) %>
                        <% if $EventList %>
                            <div class="card__wrapper margin-0">

                                <% loop $EventList.Limit(3) %>
                                    <div class="card card--row">
                                        <div class="card__body <% if $Up.HideImages %>card__body--noimage<% end_if %>">
                                            <h3 class="card__title">
                                                <a href="$Link">$Title</a>
                                            </h3>

                                            <%-- Dates --%>
                                            <% if $Dates %>
                                                <p class="">
                                                    <img src="{$ThemeDir}/dist/images/calendar-bw.png" alt="calendar icon" width="16">
                                                    <% loop $Dates.Limit(1) %>
                                                        <% include DateTimesList %>
                                                    <% end_loop %>
                                                </p>
                                            <% else %>
                                                    No upcoming dates.
                                            <% end_if %>
                                                <%-- Online event stuff --%>

                                                <% if isOnline %>

                                                <p><i aria-hidden="true" class="fas fa-laptop-house"></i>Online Event</p>
                                                <% end_if %>


                                            <%-- Venue --%>
                                            <% if $Venue %>
                                                <p class="">
                                                    <img src="{$ThemeDir}/dist/images/location-bw.png" alt="location icon" width="16">
                                                    $Venue.Title
                                                </p>
                                            <% end_if %>

                                            <%-- Summary --%>
                                            <p>$Content.FirstParagraph.LimitCharacters(130)</p>

                                        </div><!-- end .card__body -->
                                    </div>
                                <% end_loop %>
                            </div>
                        <% end_if %>
                    <% end_with %>
                </div>
            </div>
        </div>
    </div>

    $BeforeContent

    <!-- Feature Sections -->
    <% if $NewHomePageHeroFeatures %>
        <div class="homefeatures">
        <% loop NewHomePageHeroFeatures %>
                <div class="homefeatures__feature">
                    <div class="grid-container">
                        <div class="grid-x align-middle">
                            <% if $Image %>
                                <% with $Image %>
                                    <div class="cell small-12 medium-7 <% if $Up.Even %>medium-order-2<% end_if %>">
                                        <img src="$FocusFill(800,500).URL" alt="$Title" loading="lazy">
                                    </div>
                                <% end_with %>
                            <% end_if %>
                            <div class="cell small-12 medium-5 <% if $Even %>medium-order-1<% end_if %>">
                                <div class="homefeatures__content">
                                <h3 style="margin-top:0;">$Title </h3>
                                    $Content
                                    <% if $ButtonText %>
                                        <% if $ExternalLink %>
                                            <a href="$ExternalLink" target="_blank" class="button warning">$ButtonText <i class="fas fa-arrow-right"></i></a>
                                        <% else %>
                                            <a href="$AssociatedPage.Link" class="button warning">$ButtonText <i class="fas fa-arrow-right"></i></a>
                                        <% end_if %>
                                    <% end_if  %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        <% end_loop %>
        </div>
    <% end_if %>

    $AfterContent

    <!-- Instagram Feed -->
    <section class="instafeed" aria-labelledby="instagramid">
        <div class="row">
            <div class="columns">
                <h3 id="instagramid">Follow us on Instagram <a href="https://www.instagram.com/uistudentlife/">@uistudentlife</a></h3>
                <!-- SnapWidget -->
                <script src="https://snapwidget.com/js/snapwidget.js"></script>
                <iframe src="https://snapwidget.com/embed/881820" class="snapwidget-widget" allowtransparency="true" frameborder="0" scrolling="no" style="border:none; overflow:hidden;  width:100%; "></iframe>
            </div>
        </div>
    </section>

</main>



