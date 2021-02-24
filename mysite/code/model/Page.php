<?php

use SilverStripe\Blog\Model\Blog;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Control\Director;
use SilverStripe\StaticPublishQueue\Contract\StaticallyPublishable;

class Page extends SiteTree implements StaticallyPublishable {

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

	public function DepartmentsWithPosts() {
		$depts = DepartmentPage::get()->filter(array('ShowInMenus' => 1))->filterByCallback(function ($item, $list) {
			return ($item->NewsEntries()->Count() > 0);
		});
		return $depts;
	}

	public function AllDepartments() {
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
	/**
	 * The only URL belonging to this object is it's own URL.
	 */
	public function urlsToCache() {
		$disallowedClasses = array(
			'SilverStripe\CMS\Model\RedirectorPage',
			'SilverStripe\UserForms\Model\UserDefinedForm',
			'YearInReview',
			'LeadershipLegacy',
			'LeadershipLegacyBlogEntry',
			'LeadershipLegacyIssueHolder',
			'NewsEntry',
			'BlogPost',
		);

		$urls = array();

		//Only cache this year's previous blogs so the caching process doesn't go through the entire archive
		if ($this->ClassName == 'NewsEntry') {
			$currentYear = date("Y");
			$blogYear = $this->obj('Created')->Format('y');

			if ($blogYear == $currentYear) {
				$urls[Director::absoluteURL($this->getOwner()->Link())] = 0;
			}
		}

		if (!array_search($this->ClassName, $disallowedClasses)) {
			$urls[Director::absoluteURL($this->getOwner()->Link())] = 0;
		}

		return $urls;

	}
}
