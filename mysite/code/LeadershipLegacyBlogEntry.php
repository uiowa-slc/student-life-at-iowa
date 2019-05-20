<?php

use SilverStripe\Assets\Image;
use SilverStripe\Blog\Model\BlogPost;
class LeadershipLegacyBlogEntry extends BlogPost {

	private static $db = array(

	);

	private static $has_one = array(
		"EntryPhoto" => Image::class,
	);
	private static $belongs_many_many = array(
	);
	private static $has_many = array(
	);

	private static $allowed_children = array(

	);
	private static $show_in_sitetree = false;

	private static $singular_name = 'Leadership Legacy Blog Entry';

	private static $plural_name = 'Leadership Legacy Blog Entries';

	public function getCMSFields() {
		$f = parent::getCMSFields();

		$f->renameField("FeaturedImage", "Photo - 1100x700 preferred");

		return $f;
	}

}