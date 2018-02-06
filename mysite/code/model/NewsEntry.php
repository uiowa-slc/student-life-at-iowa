<?php
class NewsEntry extends BlogPost {

	private static $db = array(
		'IsFeatured' => 'Boolean',
		'ExternalURL' => 'Varchar(255)',
	);

	private static $has_one = array(
		"Photo" => "Image",
		'ListingPhoto' => 'Image',
	);
	private static $many_many = array(
		'Departments' => 'DepartmentPage'
	);
	private static $has_many = array(
	);

	private static $allowed_children = array(

	);
	private static $default_sort = 'PublishDate DESC';
	private static $singular_name = 'News Entry';

	private static $summary_fields = array(
		'Photo.CMSThumbnail' => 'Photo',
		'Title' => 'Title',
		'PublishDate.NiceUS' => 'Date',
		'Member' => 'Associated Author',
		'Author' => 'Guest Author Name',
		'ExternalURL' => 'External post URL (if applicable)',
	);
	private static $plural_name = 'News Entries';

	public function getCMSFields() {
		$f = parent::getCMSFields();

		$f->addFieldToTab('Root.Main', new TextField('ExternalURL', 'External URL for an external post (Tumblr, etc) - no content needed if filled out.'), "Content");
		//$f->addFieldToTab("Root.Main", new UploadField("Photo", "Photo"), "Content");

		$f->removeByName('Content');
		$f->removeByName('Metadata');

		$biggerContentField = new HTMLEditorField('Content', 'Content');
		$biggerContentField->setRows(60);
		$f->addFieldToTab('Root.Main', $biggerContentField);

		$tagField = TagField::create(
			'Departments',
			'Departments',
			DepartmentPage::get(),
			$this->Departments()
		)->setShouldLazyLoad(true) // tags should be lazy loaded
		 ->setCanCreate(false); 

		$f->addFieldToTab('Root.Main', $tagField, 'Content');
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
	public function toFeedArray(){
		$post = $this;
		$postsArray = array();

		$postArrayTags = array();
		$postTags = $post->Tags();

		$postAuthors = $post->Authors();
		$postAuthorsArray = array();

		foreach($postTags as $postTag){
			array_push($postArrayTags, trim($postTag->Title));
		}
		foreach($postAuthors as $postAuthor){
			array_push($postAuthorsArray, trim($postAuthor->Email));
		}

		$postArrayTagsFiltered = array_unique($postArrayTags);

		$postArrayItem = array(
				'Title' => $post->Title,
				'Content' => $post->Content,
				'Authors' => $postAuthorsArray,
				'PublishDate' => $post->PublishDate,
				'FeaturedImage' => $post->obj('FeaturedImage')->AbsoluteURL,
				'Tags' => $postArrayTagsFiltered,
				'StoryBy' => $post->StoryBy,
				'StoryByEmail' => $post->StoryByEmail,
				'StoryByTitle' => $post->StoryByTitle,
				'StoryByDept' => $post->StoryByDept,
				'PhotosBy' => $post->PhotosBy,
				'PhotosByEmail' => $post->PhotosByEmail,
				'ExternalURL' => $post->ExternalURL
			);

		return $postArrayItem;
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