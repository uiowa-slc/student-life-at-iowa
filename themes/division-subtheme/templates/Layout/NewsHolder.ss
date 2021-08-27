
$Header

<div class="main-content__container" id="main-content__container">

	$BeforeContent
  <!-- Commenting out Featured News Area -->
<%-- <% if not $PaginatedList.CurrentBool %>
<% if $Action == "index" %>
	<% if $FeaturedNews %>
	<div class="row">
		<div class="featured-news clearfix">
			<div class="featured-news__large-column">
				<% loop $FeaturedNews.limit(1) %>
					<div class="news-card news-card--large news-card--border">
						<% if $FeaturedImage %>
							<div class="news-card__thumb">
								<a href="$Link"><img src="$FeaturedImage.FocusFill(600,400).URL" alt="$Title"></a>
								<% if $Departments %>
									<span class="news-card__dept news-card__dept--wthumb">
										<% loop $Departments.First %><% if not $First && $Last %>, <% end_if %>$Title<% end_loop %>
									</span>
								<% end_if %>
							</div>
							<% else %>
								<div class="news-card__thumb">
								<a href="$Link"><img src="{$ThemeDir}/dist/images/news-placeholder-s.jpg" alt="$Title" class="news-main__img"></a>
								<% if $Departments %>
									<span class="news-card__dept news-card__dept--wthumb">
										<% loop $Departments.First %><% if not $First && $Last %>, <% end_if %>$Title<% end_loop %>
									</span>
								<% end_if %>
							</div>

						<% end_if %>
						<div class="news-card__body text-center">
							<h1 class="news-card__title"><a href="$Link">$Title</a></h1>
							<% if $Summary %>
								<div class="news-card__desc">$Summary</div>
							<% else %>
								<p class="news-card__desc">$Content.LimitCharacters(110)</p>
							<% end_if %>


                                <% include AuthorBylineFull %>


						</div>
					</div>
				<% end_loop %>
			</div>

			<div class="featured-news__medium-column">
				<% loop $FeaturedNews.limit(2, 1) %>
				<div class="news-card">
					<% if $FeaturedImage %>
						<div class="news-card__thumb">
							<a href="$Link"><img src="$FeaturedImage.FocusFill(450,300).URL" alt="$Title"></a>
							<% if $Departments %>
								<span class="news-card__dept news-card__dept--wthumb">
									<% loop $Departments.First %><% if not $First && $Last %>, <% end_if %>$Title<% end_loop %>
								</span>
							<% end_if %>
						</div>
					<% end_if %>
					<div class="news-card__body">
						<% if $Departments && not $FeaturedImage %>
							<span class="news-card__dept">
								<% loop $Departments.First %><% if not $First && $Last %>, <% end_if %>$Title<% end_loop %>
							</span>
						<% end_if %>
						<h2 class="news-card__title news-card__title--small">
							<a href="$Link">$Title</a>
						</h2>
						<% if $Credits %>

                            <% include AuthorBylineFull %>

                        <% end_if %>
					</div>
				</div>
				<% end_loop %>
			</div>
			<div class="featured-news__small-column featured-news__small-column--border">
				<div class="trending">
					<h3 class="trending__heading">Trending</h3>
					<ol class="trending__list">
						<% loop $TrendingPosts.limit(5) %>
						<li class="trending__card">
							<div class="trending__body">
								<h2 class="trending__title">
									<a href="$Link">$Title</a>
								</h2>
							</div>
						</li>
						<% end_loop %>
					</ol>
				</div>
			</div>
		</div>
	</div><!-- end .row -->
	<% end_if %>
    <% end_if %>
<% end_if %> --%>
</div>


<main class="main-content__container" id="main-content__container">

    $BeforeContent

    <div class="row">
        <div role="main" class="main-content main-content--with-padding <% if $Children || $Menu(2) || $SidebarArea.Elements ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
            $BeforeContentConstrained
            <div class="main-content__text">

                $Content

                <% if $ArchiveYear || $CurrentTag || $CurrentCategory %>
                    <h2>
                        <% if $ArchiveYear %>
                            <%t Blog.Archive 'Archive' %>:
                            <% if $ArchiveDay %>
                                $ArchiveDate.Nice
                            <% else_if $ArchiveMonth %>
                                $ArchiveDate.format('F, Y')
                            <% else %>
                                $ArchiveDate.format('Y')
                            <% end_if %>
                        <% else_if $CurrentTag %>
                            <%t Blog.Tag 'Tag' %>: $CurrentTag.Title
                        <% else_if $CurrentCategory %>
                            <%t Blog.Category 'Category' %>: $CurrentCategory.Title
                        <% else %>
                            $Title
                        <% end_if %>
                    </h2>
                <% end_if %>

                <% if $Action == "index" %>
                    <% if $SortAlphabetically %>
                        <% loop $BlogPostsAlpha %>
                            <% include BlogCardHorizontal %>
                        <% end_loop %>
                    <% else_if $PaginatedList.Exists %>
                        <% loop $PaginatedList %>
                            <% include BlogCardHorizontal %>
                        <% end_loop %>
                    <% end_if %>
                <% else %>
                    <% loop $PaginatedList %>
                        <% include BlogCardHorizontal %>
                    <% end_loop %>
                <% end_if %>
                $AfterContentConstrained

                $Form
                $CommentsForm

            </div>
            <% with $PaginatedList %>
                <% include Pagination %>
            <% end_with %>
        </div>


        <aside class="sidebar dp-sticky">
            <% include SideNav %>
                <%-- Begin Listing Departments --%>
                <div class="WidgetHolder BlogCategoriesWidget first last">
                    <h3>Departments</h3>
                    <ul>
                        <% loop DepartmentsWithPosts %>
                        <li><a href="$NewsLink" title=""><span class="text">$Title</span></a></li>
                        <% end_loop %>
                    </ul>
                </div>
                <%-- End Listing Departments --%>
            <% if $SideBarView %>
                $SideBarView
            <% end_if %>
            $SidebarArea
        </aside>
    </div>

    $AfterContent

</main>


<%--     <div class="news-fullwidth">
        <div class="row">
            <div class="iowa-now">
                <div class="line-header">
                    <h2>Student Life In The News</h2>
                </div>
                <ol class="iowa-now__list">
                    <% loop RSSDisplay %>
                    <li class="iowa-now__item">
                        <div class="iowa-now__body">
                            <div class="">
                                <h2 class="iowa-now__title"><a href="$Link">$Title</a></h2>
                                <span class="iowa-now__date"><em>Iowa Now</em> $Date.Format("MMM d, Y")</span>
                            </div>
                        </div>
                    </li>
                    <% end_loop %>
                </ol>
            </div>
        </div>
    </div> --%>
