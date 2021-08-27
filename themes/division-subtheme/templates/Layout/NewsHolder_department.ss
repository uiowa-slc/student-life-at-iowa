
$Header

<main class="main-content__container" id="main-content__container">

    <div class="column row">
        <div class="main-content__header">
            $Breadcrumbs
            <h1>$Title</h1>
        </div>
    </div>

    $BeforeContent

    <div class="row">
        <div role="main" class="main-content main-content--with-padding <% if $Children || $Menu(2) || $SidebarArea.Elements ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
            $BeforeContentConstrained
            <div class="main-content__text">

                $Content

                <% if $CurrentDepartment %>
                    <h2>
                        Posted in: $CurrentDepartment.Title
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
            <div class="WidgetHolder BlogCategoriesWidget first last">
                <h3>Departments</h3>
                <ul>
                    <% loop DepartmentsWithPosts %>
                    <li><a href="$NewsLink" title=""><span class="text">$Title</span></a></li>
                    <% end_loop %>
                </ul>
            </div>
            <% if $SideBarView %>
                $SideBarView
            <% end_if %>
            $SidebarArea
        </aside>
    </div>

    $AfterContent

</main>
