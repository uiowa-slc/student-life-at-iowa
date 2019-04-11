<?php

use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Blog\Model\Blog;


class Page extends SiteTree {

	private static $db = array(

	);

	private static $has_one = array(
	);

	private static $many_many = array(
	);

	private static $many_many_extraFields = array(
	);

	private static $plural_name = "Pages";

	private static $defaults = array();

	public function getCMSFields() {
		$f = parent::getCMSFields();

		return $f;
	}

	public function AllBlogPosts() {
		$newsHolder = Blog::get()->filter(array('URLSegment' => 'news'))->First();
		$entries = $newsHolder->blogPosts;

		return $entries;
	}


	public function DepartmentsWithPosts(){
		$depts = DepartmentPage::get()->filter(array('ShowInMenus' => 1))->filterByCallback(function($item, $list) {
		    return ($item->NewsEntries()->Count() > 0);
		});
		return $depts;
	}

	public function AllDepartments(){
		return DepartmentPage::get()->filter(array('ShowInMenus' => 1));
	}
	function validateURL($URL) {
		if (!$URL || !trim($URL)) {
			return $URL;
		}

		if (!preg_match('/^https?:\/\//i', $URL)) {
			$URL = 'http://' . $URL;
		}

		return $URL;
	}
}
