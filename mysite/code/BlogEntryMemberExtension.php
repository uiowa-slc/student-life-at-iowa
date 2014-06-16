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
		$memberDropdown = new DropdownField( "MemberID", "Author (overrides above)", Member::get()->map( "ID", "getName" ) );
		$memberDropdown->setEmptyString("None");

		$fields->addFieldToTab( "Root.Main", $memberDropdown, "Tags" );		
	}

	
}