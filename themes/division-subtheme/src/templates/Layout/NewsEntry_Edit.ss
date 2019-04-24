$Header
<main class="main-content__container" id="main-content__container">
 $Breadcrumbs

    <div class="column row">
        <div class="main-content__header">
            <h1>$NewsEditorForm.getName()</h1>
        </div>
    </div>
    $BeforeContent

    <div class="row">
        <article role="main" class="main-content main-content--with-padding <% if $Children || $Menu(2) || $SidebarBlocks ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
            <div class="main-content__text">
                <div class="content--right-padding">
                    $NewsEditorForm
                </div>
                   $AfterContentConstrained
            </div>
        </article>
        <aside class="sidebar dp-sticky">
            <% include SideNav %>
            <% if $SideBarView %>
                $SideBarView
            <% end_if %>

            $Sidebar

        </aside>
    </div>
    $AfterContent
</main>





















