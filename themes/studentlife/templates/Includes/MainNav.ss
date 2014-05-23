<!-- Navigation -->
<div class="nav-padding">
	<div class="container">
		<a href="" class="dosl-logo"><img src="{$ThemeDir}/images/dosl-logo.gif" alt="Division of Student Life"></a>
		<nav role="navigation" class="nav-main-wrapper clearfix hide-print">
			<h2 class="nav-title"><a href="/#">Menu <span></span></a></h2>
			<ul class="nav-main clearfix">
				<% loop $Menu(1) %>
					<li>
						<a href="$Link" title="Go to the $Title page" class="$LinkingMode">
							<span>$MenuTitle</span>
						</a>
					</li>
				<% end_loop %>
			</ul>
		</nav>
	</div>
</div>