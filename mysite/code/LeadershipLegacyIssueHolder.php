<?php
use SilverStripe\Blog\Model\Blog;
class LeadershipLegacyIssueHolder extends Blog {

	private static $db = array(

	);

	private static $has_one = array(

	);
	private static $belongs_many_many = array(
	);
	private static $has_many = array(
	);

	private static $allowed_children = array(
		'LeadershipLegacyBlogEntry',
	);

	private static $singular_name = 'Leadership Legacy Issue Holder';

	private static $plural_name = 'Leadership Legacy Issue Holders';
	private static $icon = 'themes/studentlife/images/blogholder-file.png';
	public function getCMSFields() {
		$f = parent::getCMSFields();

		return $f;
	}

}