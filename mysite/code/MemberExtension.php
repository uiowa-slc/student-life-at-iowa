<?php
/**
 * Adds additional fields to the Member object
 *
 */
class MemberExtension extends DataExtension {

	private static $db = array(

	);

	private static $has_one = array(

	);

	private static $has_many = array(

		"BlogEntries" => "BlogEntry",

	);

	public function forTemplate() {
		return $this->owner->FirstName . ' ' . $this->owner->Surname;
	}

	public function NewsEntries() {
		return $this->owner->BlogEntries()->filter(array("ClassName" => "NewsEntry"));
	}

	public function LeadershipLegacyBlogEntries() {
		return $this->owner->BlogEntries()->filter(array("ClassName" => "LeadershipLegacyBlogEntry"));
	}

}