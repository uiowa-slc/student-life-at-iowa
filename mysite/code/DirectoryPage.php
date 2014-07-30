<?php
class DirectoryPage extends Page {

	private static $db = array(


	);

	private static $has_one = array(

	);
	private static $belongs_many_many = array (
	);
	private static $has_many = array(
		"DirectoryEntries" => "DirectoryEntry"
	);

	private static $allowed_children = array(
	);

	public function getCMSFields(){
		$f = parent::getCMSFields();

		$gridFieldConfig = GridFieldConfig_RelationEditor::create();
		$gridFieldConfig->addComponent(new GridFieldSortableRows('SortOrder'));
		$gridField = new GridField('DirectoryEntries', 'Directory Organizations', $this->DirectoryEntries(), $gridFieldConfig);

		$f->addFieldToTab("Root.Main", $gridField, "Content");
		return $f;
	}


}
class DirectoryPage_Controller extends Page_Controller {

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

	public function Sections(){
		$sections = Section::get();

		return $sections;
	}

}