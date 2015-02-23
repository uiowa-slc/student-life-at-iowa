<?php
class ExternalNewsEntry extends NewsEntry {

	private static $db = array(
		'ExternalUrl' => 'Varchar(50)'
	);

	private static $has_one = array(
	);
	private static $belongs_many_many = array(
	);
	private static $has_many = array(
	);
	private static $allowed_children = array(
	);
	
	private static $default_sort = 'Date DESC';
	private static $singular_name = 'External News Entry';

	private static $summary_fields = array(

	);
	private static $plural_name = 'External News Entries';

	public function getCMSFields() {
		$f = parent::getCMSFields();
		
		$f->addFieldToTab("Root.Main", new TextField("ExternalUrl", "External URL", "Must begin with http://"), "Content");
		$f->addFieldToTab("Root.Main", new UploadField("Photo", "Photo"), "Content");
		$f->addFieldToTab("Root.Main", new UploadField("ListingPhoto", "Alternate Photo for Facebook, Twitter, and news listing pages (takes precedence over the Photo field)"), "Content");
		$f->addFieldToTab('Root.Main', new CheckboxField('IsFeatured', 'Feature this Article? (Yes)'), "Content");
		$f->removeByName('Content');
		$f->removeByName('Metadata');

		return $f;
	}
	
	// override link function so template renders the inputted externalurl. 
	public function Link($Action = null) {
		return $this->ExternalUrl;
	}

}
class ExternalNewsEntry_Controller extends NewsEntry_Controller {

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

	public function Link($Action = null) {
		return $this->ExternalUrl;
	}

	public function init() {
		parent::init();

	}

}