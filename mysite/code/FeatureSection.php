<?php
class FeatureSection extends Section {

	private static $db = array(
	);

	private static $has_one = array(

	);
	private static $belongs_many_many = array(
	);

	private static $has_many = array(
		"Features" => "SectionFeature"
	);


	public function getCMSFields(){
		$f = parent::getCMSFields();
		$gridFieldConfig = GridFieldConfig_RelationEditor::create();
		$gridFieldConfig->addComponent(new GridFieldSortableRows('SortOrder'));
		$gridField = new GridField('Features', 'Features', $this->Features(), $gridFieldConfig);
		$f->addFieldToTab("Root.Main", $gridField, "Content");
		return $f;
	}


}
class FeatureSection_Controller extends Section_Controller {

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
	private static $allowed_actions = array (
	);

	public function init() {
		parent::init();

	}




}