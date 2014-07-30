<?php
class DirectoryEntry extends DataObject {

	private static $db = array(
		"Title" => "Varchar(155)",
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
		$f = parent::getCMSFields();
		$f->removeByName("FacebookEmbed");
		$f->renameField("TwitterUsername", "Twitter Username (without @ symbol)");
		$f->addFieldToTab("Root.Main", new TextField("FacebookEmbed"), "Content");
		return $f;
	}


}
