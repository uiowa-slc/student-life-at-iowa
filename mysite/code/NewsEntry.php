<?php
class NewsEntry extends BlogEntry {

	private static $db = array(

		'IsFeatured' => 'Boolean',
		'ExternalURL' => 'Varchar(255)',
	);

	private static $has_one = array(
		"Photo" => "Image",
		'ListingPhoto' => 'Image',
	);
	private static $belongs_many_many = array(
	);
	private static $has_many = array(
	);

	private static $allowed_children = array(

	);
	private static $default_sort = 'Date DESC';
	private static $singular_name = 'News Entry';

	private static $summary_fields = array(
		'Photo.CMSThumbnail' => 'Photo',
		'Title' => 'Title',
		'Date.NiceUS' => 'Date',
		'Member' => 'Associated Author',
		'Author' => 'Guest Author Name',
		'ExternalURL' => 'External post URL (if applicable)',
	);
	private static $plural_name = 'News Entries';

	public function getCMSFields() {
		$f = parent::getCMSFields();

		$f->addFieldToTab('Root.Main', new TextField('ExternalURL', 'External URL for an external post (Tumblr, etc) - no content needed if filled out.'), "Content");
		$f->addFieldToTab("Root.Main", new UploadField("Photo", "Photo"), "Content");
		$f->addFieldToTab("Root.Main", new UploadField("ListingPhoto", "Alternate Photo for Facebook, Twitter, and news listing pages (takes precedence over the Photo field)"), "Content");
		$f->addFieldToTab('Root.Main', new CheckboxField('IsFeatured', 'Feature this Article? (Yes)'), "Content");
		$f->removeByName('Content');
		$f->removeByName('Metadata');
		$biggerContentField = new HTMLEditorField('Content', 'Content');
		$biggerContentField->setRows(60);

		$f->addFieldToTab('Root.Main', $biggerContentField);
		return $f;
	}

	function setExternalURL($URL) {
		return $this->setField('ExternalURL', $this->validateURL($URL));
	}

	public function Link() {
		if ($Link = $this->ExternalURL) {
			return $Link;
		} else {
			return parent::Link();
		}
	}

}
class NewsEntry_Controller extends BlogEntry_Controller {

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

	public function RelatedNewsEntries() {
		$holder = NewsHolder::get()->First();
		$tags = $this->TagsCollection()->sort("RAND()")->limit(6);
		$entries = new ArrayList();

		foreach ($tags as $tag) {
			$taggedEntries = $holder->Entries(5, $tag->Tag)->exclude(array("ID" => $this->ID))->sort("RAND()")->First();
			if ($taggedEntries) {
				foreach ($taggedEntries as $taggedEntry) {
					if ($taggedEntry->ID) {
						$entries->push($taggedEntry);
					}
				}
			}

		}

		if ($entries->count() > 1) {
			$entries->removeDuplicates();
		}
		return $entries;
	}

	public function init() {
		parent::init();

	}

}