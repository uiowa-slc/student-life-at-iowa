<?php
class DirectoryEntry extends DataObject {

	private static $db = array(
		"Title" => "Varchar(155)",
		"WebsiteLink" => "Text",
		"FacebookEmbed" => "HTMLText",
		"TwitterUsername" => "Text",
		"InstagramLink" => "Text",
		"SortOrder" => "Int"
	);

	private static $has_one = array(
		"DirectoryPages" => "DirectoryPage"
	);
	private static $belongs_many_many = array (
		
	);
	private static $has_many = array(
		
	);

	private static $singular_name = "Organization";

	private static $allowed_children = array(
	);

	public function getCMSFields(){
		$f = new FieldList();
		$f->push(new TextField("Title"));
		$f->push(new TextField("WebsiteLink"));
		$f->push(new TextField("FacebookEmbed", "Full Facebook Iframe Embed Code"));
		$f->push(new TextField("TwitterUsername", "Twitter Username (without @ symbol)"));
		$f->push(new TextField("InstagramLink", "Instagram Link"));
		return $f;
	}


}
