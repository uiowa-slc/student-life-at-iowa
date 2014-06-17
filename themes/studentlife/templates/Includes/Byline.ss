<% if $Member %>
	<% with $Member %>
		Posted by <a href="$Link" class="byline-author" rel="author">$FirstName $Surname</a>
	<% end_with %>
<% else_if $Author %>
	By $Author
<% end_if %>