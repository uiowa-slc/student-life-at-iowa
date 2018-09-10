
$Header

<main class="main-content__container" id="main-content__container">

	$BlockArea(BeforeContent)

	<div class="row">
		<div role="main" class="main-content main-content--with-padding <% if $Children || $Menu(2) || $SidebarBlocks ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">

			$BlockArea(BeforeContentConstrained)

			<div class="main-content__text">

				<% loop Teams %>
					<h3>$Title</h3>
					<% loop StaffPages %>
						<li>$FirstName $LastName</li>
					<% end_loop %>
				<% end_loop %>

				<br /><br />

				$BlockArea(AfterContentConstrained)
				$Form
				$CommentsForm
			</div>
		</div>

		<aside class="sidebar dp-sticky">
				<%-- Begin Listing Departments --%>
				<div class="WidgetHolder BlogCategoriesWidget first last">
					<h3>Departments</h3>
					<ul>
						<% loop DepartmentsWithPosts %>
						<li><a href="$Link" title=""><span class="text">$Title</span></a></li>
						<% end_loop %>
					</ul>
				</div>
				<%-- End Listing Departments --%>
			<% if $SideBarView %>
				$SideBarView
			<% end_if %>

			$BlockArea(Sidebar)

		</aside>
	</div>


	$BlockArea(AfterContent)

</main>
