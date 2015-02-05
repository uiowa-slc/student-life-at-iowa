<?php
class NewsHolder extends BlogHolder {

	private static $db = array(
		"PhotoGalleryTitleOne" => "Text",
		"PhotoGalleryURLOne" => "Text",

		"PhotoGalleryTitleTwo" => "Text",
		"PhotoGalleryURLTwo" => "Text",

		"PhotoGalleryTitleThree" => "Text",
		"PhotoGalleryURLThree" => "Text",

	);

	private static $has_one = array(
		"PhotoGalleryImageOne" => "Image",
		"PhotoGalleryImageTwo" => "Image",
		"PhotoGalleryImageThree" => "Image",
	);
	private static $belongs_many_many = array (
	);
	private static $has_many = array(
	);

	private static $allowed_children = array(
		'NewsEntry'
	);

	private static $singular_name = 'News Holder';

	private static $plural_name = 'News Holders';

	private static $extensions = array(
       'PageHolderExtension'
    );

    private static $excluded_children = array('NewsEntry');

	public function getCMSFields(){
		$fields = parent::getCMSFields();
		$fields->removeByName("Content");
		$fields->removeByName("Metadata");

		$fields->addFieldToTab("Root.PhotoGallery", new TextField("PhotoGalleryTitleOne", "Title"));
		$fields->addFieldToTab("Root.PhotoGallery", new TextField("PhotoGalleryURLOne", "URL"));
    	$fields->addFieldToTab("Root.PhotoGallery", new UploadField("PhotoGalleryImageOne", "Photo"));

    	$fields->addFieldToTab("Root.PhotoGalleryTwo", new TextField("PhotoGalleryTitleTwo", "Title"));
		$fields->addFieldToTab("Root.PhotoGalleryTwo", new TextField("PhotoGalleryURLTwo", "URL"));
    	$fields->addFieldToTab("Root.PhotoGalleryTwo", new UploadField("PhotoGalleryImageTwo", "Photo"));

    	$fields->addFieldToTab("Root.PhotoGalleryThree", new TextField("PhotoGalleryTitleThree", "Title"));
		$fields->addFieldToTab("Root.PhotoGalleryThree", new TextField("PhotoGalleryURLThree", "URL"));
    	$fields->addFieldToTab("Root.PhotoGalleryThree", new UploadField("PhotoGalleryImageThree", "Photo"));

		return $fields;
	}


}
class NewsHolder_Controller extends BlogHolder_Controller {

	private static $allowed_actions = array(
		'index',
		'tag',
		'rss',
		'date',
		'metaweblog',
		'postblog' => 'BLOGMANAGEMENT',
		'post',
		'BlogEntryForm' => 'BLOGMANAGEMENT',
	);

	public function init() {
		parent::init();

	}

	public function rss(){
		global $project_name;

		$blogName = $this->Title;
		$altBlogName = $project_name . ' blog';
		$filters = array();
		$getVars = $this->request->getVars();

		if(isset($getVars['member'])){
			$memberId = $this->request->getVars()['member'];
			$filters['Member.Email'] = $memberId;
		}

		$entries = $this->Entries(20)->filter($filters);


		if($entries) {
			$rss = new RSSFeed($entries, $this->Link('rss'), ($blogName ? $blogName : $altBlogName), "", "Title", "RSSContent");
			return $rss->outputToBrowser();
		}
	}

	public function PaginatedNewsEntries($pageLength = 12){
		$entries = $this->BlogEntries();
		return $entries->setPageLength($pageLength);
	}

}