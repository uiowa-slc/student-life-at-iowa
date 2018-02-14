<?php
class DepartmentPage extends Page {

	private static $db = array(
		"Phone"          => "Text",
		"DepartmentURL"  => "Text",

	);

	private static $has_one = array(
		"Photo" => "Image",
	);

	private static $belongs_many_many = array(
		'NewsEntries' => 'NewsEntry'
	);

	private static $icon = 'mysite/cms_icons/department.png';

	public function getCMSFields() {
		$fields = parent::getCMSFields();

		$fields->addFieldToTab("Root.Main", new TextField("Phone", "Phone (XXX-XXX-XXXX)"));
		$fields->addFieldToTab("Root.Main", new TextField("DepartmentURL", "Department or Website URL (optional)"));
		$fields->addFieldToTab("Root.Main", new UploadField("Photo", "Photo"), "Content");

		return $fields;

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