<?php
class DepartmentPage extends Page {

	private static $db = array(
		"KeyStatTitle" => "Text",
		"KeyStat1Num" => "Text",
		"KeyStat1Body" => "HTMLText",
		"KeyStat2Num" => "Text",
		"KeyStat2Body" => "HTMLText",
		"KeyStat3Num" => "Text",
		"KeyStat3Body" => "HTMLText"

	);

	private static $has_one = array(
		"Photo" => "Image",
	);
	
	private static $belongs_many_many = array(
		'NewsEntries' => 'NewsEntry',
		"StaffPages" => "DivisionStaffPage"
	);

	private static $icon = 'mysite/cms_icons/department.png';

	public function getCMSFields() {
		$fields = parent::getCMSFields();

		$fields->addFieldToTab("Root.Main", new UploadField("Photo", "Photo"), "Content");

		$fields->addFieldToTab("Root.Main", new TextField("KeyStatTitle", "Key Title"));
		$fields->addFieldToTab("Root.Main", new TextField("KeyStat1Num", "Key Stat 1 - Number"));
		$fields->addFieldToTab("Root.Main", HtmlEditorField::create("KeyStat1Body", "Key Stat 1 - Content")->setRows(4));

		$fields->addFieldToTab("Root.Main", new TextField("KeyStat2Num", "Key Stat 2 - Number"));
		$fields->addFieldToTab("Root.Main", HtmlEditorField::create("KeyStat2Body", "Key Stat 2 - Content")->setRows(4));

		$fields->addFieldToTab("Root.Main", new TextField("KeyStat3Num", "Key Stat 3 - Number"));
		$fields->addFieldToTab("Root.Main", HtmlEditorField::create("KeyStat3Body", "Key Stat 3 - Content")->setRows(4));

		return $fields;

	}

	public function NewsEntriesByTag($tagTitle){

		// print_r($tagTitle);
		$tag = BlogTag::get()->filter(array('URLSegment' => $tagTitle))->First();

		if(!$tag){
			return false;
		}
		$tagEntries = $tag->BlogPosts()->map()->keys();
		$deptEntries = $this->NewsEntries()->map()->keys();


		//print_r($tagEntries);
		//print_r($deptEntries);

		$intersectEntries = array_intersect($tagEntries,$deptEntries);

		//print_r($intersectEntries);
		$list = NewsEntry::get()->byIds($intersectEntries);

		//print_r($intersectEntries);
		return $list;



	}

	public function NewsLink(){
		$newsHolder = NewsHolder::get()->First();
		$link = $newsHolder->Link('department/'.$this->URLSegment);
		return $link;
	}

	public function NewsEntriesByCat($catTitle){
		$tag = BlogCategory::get()->filter(array('Title' => $catTitle))->First();


		$catEntries = $cat->BlogPosts()->toArray();
		$deptEntries = $this->NewsEntries()->toArray();

		$intersectEntries = array_intersect($tagEntries,$deptEntries);

		$list = new ArrayList($intersectEntries);

		return $list;



	}

	public function NewsEntriesByAuthor($authorID){
		$author = Member::get()->filter(array('ID' => $authorID))->First();

		if($author){
			$authorEntries = $author->BlogPosts();
			return $authorEntries;
		}

		return null;
	}

	//private static $allowed_children = array("");

}
class DepartmentPage_Controller extends Page_Controller {

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
	private static $allowed_actions = array(
	);

	public function init() {
		parent::init();

	}
	// public function NewsPosts() {

	// 	$memberId = $this->EmailAddress;

	// 	if (isset($memberId)) {
	// 		$url = 'http://studentlife.uiowa.edu/news/rss?member='.$memberId;
	// 		return $this->RSSDisplay(20, $url);
	// 	} else {
	// 		return false;
	// 	}

	// }
}