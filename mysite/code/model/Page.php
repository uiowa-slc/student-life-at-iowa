<?php
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
		$depts = DepartmentPage::get()->filterByCallback(function($item, $list) {
		    return ($item->NewsEntries()->Count() > 0);
		});
		return $depts;
	}

	public function AllDepartments(){
		return DepartmentPage::get();
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
class Page_Controller extends ContentController {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */

	public function TrendingPosts(){

		$timeLimit = date('Y-m-d', strtotime("-6 months"));

		$posts = NewsEntry::get()->filter(array(
			'PublishDate:GreaterThan' => $timeLimit
		))->sort('RAND()');

		return $posts;
	}
	public function init() {
		parent::init();
		// Note: you should use SS template require tags inside your templates
		// instead of putting Requirements calls here.  However these are
		// included so that our older themes still work
	}

}