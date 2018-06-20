<?php

use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Blog\Model\Blog;


class Page extends SiteTree
{
    private static $db = [];

    private static $has_one = [];

	public function AllBlogPosts() {
		$newsHolder = Blog::get()->filter(array('URLSegment' => 'news'))->First();
		$entries = $newsHolder->blogPosts;

		return $entries;
	}


	public function DepartmentsWithPosts(){
		$depts = DepartmentPage::get()->filterByCallback(function($item, $list) {
		    return ($item->NewsEntries()->Count() > 0);
		});
		return $depts;
	}

	public function AllDepartments(){
		return DepartmentPage::get();
	}
	
	public function TrendingPosts(){

		$timeLimit = date('Y-m-d', strtotime("-6 months"));

		$posts = NewsEntry::get()->filter(array(
			'PublishDate:GreaterThan' => $timeLimit
		))->sort('RAND()');

		return $posts;
	}

	public function validateURL($URL) {
		if (!$URL || !trim($URL)) {
			return $URL;
		}

		if (!preg_match('/^https?:\/\//i', $URL)) {
			$URL = 'http://' . $URL;
		}

		return $URL;
	}
}
