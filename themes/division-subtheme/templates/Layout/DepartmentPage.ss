$Header
<main class="main-content__container" id="main-content__container">

    <!-- Background Image Feature -->
    <% if $BackgroundImage %>
        <% include FeaturedImage %>
    <% end_if %>

    <% if not $BackgroundImage %>
        <div class="column row">
            <div class="main-content__header">
                $Breadcrumbs
                <h1>$Title</h1>
            </div>
        </div>
    <% end_if %>

    $BeforeContent

    <div class="<% if $Children || $Menu(2) || $SidebarArea.Elements ||  $SidebarView.Widgets %><% else %>column<% end_if %> row">

        <div class="main-content main-content--with-padding <% if $SiteConfig.ShowExitButton %>main-content--with-exit-button-padding<% end_if %> <% if $Children || $Menu(2) || $SidebarArea.Elements ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
            $BeforeContentConstrained
            <% if $MainImage %>
                <img class="main-content__main-img" src="$MainImage.ScaleMaxWidth(500).URL" alt="" role="presentation"/>
            <% end_if %>
            <div class="main-content__text">
                $Content
                <% if $WebsiteURL %>
                    <p>
                        <a class="button large hollow black" href="$WebsiteURL" target="_blank" rel="noopener">Visit Website <i class="fa fa-external-link-alt" aria-hidden="true"></i></a>
                    </p>
                <% end_if %>
                $AfterContentConstrained
                $Form
            </div>

            <% if $ShowChildPages %>
                <% include ChildPages %>
            <% end_if %>

        </div>
        <aside class="sidebar dp-sticky">
            <% include SideNav %>
            <% if $SideBarView %>
                $SideBarView
            <% end_if %>
            $SidebarArea
        </aside>
    </div>


    <!-- begin stats section -->
    <div class="dept-stats">
        <div class="row">
            <div class="column">
                <h2><% if $KeyStatTitle %>$KeyStatTitle<% else %>Key Statistics<% end_if %></h2>
            </div>
        </div>
        <div class="stat-cards">
            <div class="stat-card">
                <div class="stat-card__digit">$KeyStat1Num</div>
                <div class="stat-card__text">$KeyStat1Body</div>
            </div>
            <div class="stat-card">
                <div class="stat-card__digit">$KeyStat2Num</div>
                <div class="stat-card__text">$KeyStat2Body</div>
            </div>
            <div class="stat-card">
                <div class="stat-card__digit">$KeyStat3Num</div>
                <div class="stat-card__text">$KeyStat3Body</div>
            </div>
        </div>
    </div>
    <!-- end stats section -->


    $AfterContent

    <!-- begin recent news -->
    <% if $NewsEntries %>
        <section class="content-block__container" aria-labelledby="Block$ID">
            <div class="grid-container">
                <div class="card__head">
                    <h2 class="text-center serif text-semibold h1" id="Block$ID">
                        <% if $Title && $ShowTitle %>$Title<% else %>Recent News<% end_if %>
                    </h2>
                    <!-- Link to all news button -->
                    <% if $NewsLink %>
                        <a href="$NewsLink" class="button clear">View All News <i class="fas fa-arrow-right"></i></a>
                    <% end_if %>
                </div>

                <div class="card__wrapper <% if $ShowStacked %>flex-dir-column<% end_if %>">
                    <% loop $NewsEntries.Limit(3) %>
                        <div class="card
                            <% if $Up.ShowStacked %> card--horizontal<% else %> card--row<% end_if %>
                            <% if $Up.Enclosed %> card--enclosed<% end_if %> ">
                            <% if not $Up.HideImages %>
                                <div class="card__media">
                                    <% if $FeaturedImage %>
                                        <a href="$Link" class="">
                                            <img src="$FeaturedImage.FocusFill(500,280).URL" class="card__img" loading="lazy" <% if $FeaturedImageAltText %> alt="$FeaturedImageAltText" <% else %> alt="$Title" role="presentation" <% end_if %>>
                                        </a>
                                    <% else_if $BackgroundImage %>
                                        <a href="$Link" class="">
                                            <img src="$FeaturedImage.FocusFill(500,280).URL" loading="lazy" alt="$Title" class="card__img">
                                        </a>
                                    <% end_if %>
                                </div>
                            <% end_if %>

                        <div class="card__body <% if $Up.HideImages %>card__body--noimage<% end_if %>">
                                <h3 class="card__title">
                                    <a href="$Link">$Title</a>
                                </h3>

                                <% if not $Parent.HideDatesAndAuthors %>
                                    <% include Author %>
                                <% end_if %>

                                <% if not $Parent.HideSummaries %>
                                    <% if $Summary %>
                                        <div>$Summary</div>
                                    <% else %>
                                        <p>$Content.FirstParagraph.LimitCharacters(140)</p>
                                        <a href="$Link" class="button hollow" aria-label="Continue reading about $Title">Continue Reading <i class="fas fa-arrow-right"></i></a>
                                    <% end_if %>
                                <% end_if %>

                            </div><!-- end .card__body -->
                        </div><!-- end .card -->

                    <% end_loop %>
                </div><!-- end .card__wrapper -->

            </div>
        </section>

    <% end_if %>
    <!-- end recent news -->


</main>

