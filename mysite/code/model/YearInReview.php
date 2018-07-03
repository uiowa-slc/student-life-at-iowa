<?php
class YearInReview extends Page {

	private static $db = array(

	);

	private static $has_one = array(

	);

	private static $has_many = array(
		'YearInReviewHeroFeatures' => 'YearInReviewHeroFeature',
	);

	private static $defaults = array(

	);

	private static $belongs_many_many = array(

	);

	public function getCMSFields() {

		$fields = parent::getCMSFields();

		$gridFieldConfig = GridFieldConfig_RelationEditor::create()->addComponents();
		$gridFieldConfig->addComponent(new GridFieldSortableRows('SortOrder'));
		$gridField = new GridField("YearInReviewHeroFeatures", "Hero Feature:", $this->YearInReviewHeroFeatures(), $gridFieldConfig);
		$fields->addFieldToTab("Root.Main", $gridField);

		return $fields;

	}


}
class YearInReview_Controller extends Page_Controller {

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