<% if $Member %>
	<% with $Member %>
		By <em><a href="$Link">$FirstName $Surname</em></a>
	<% end_with %>
<% else_if $Author %>
	By $Author
<% end_if %>