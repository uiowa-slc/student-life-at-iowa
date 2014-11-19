<?php
/**
 * Adds additional fields to the Member object
 *
 */
class BlogEntryMemberExtension extends DataExtension {

	private static $db = array(



	);

	private static $has_one = array(
		"Member" => "Member"
	);

	private static $has_many = array(

	);

	
	public function updateCMSFields(FieldList $fields) {
		$memberDropdown = new DropdownField( "MemberID", "Author (overrides any guest author name)", Member::get()->map( "ID", "getName" ) );
		$fields->renameField("Author", "Guest Author Name");
		$memberDropdown->setEmptyString("None");

		$fields->addFieldToTab( "Root.Main", $memberDropdown, "Tags" );		
	}

	
}