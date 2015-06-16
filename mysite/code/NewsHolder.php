<?php
class NewsHolder extends Blog {

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
	private static $belongs_many_many = array(
	);
	private static $has_many = array(
	);

	private static $allowed_children = array(
		'NewsEntry',
	);

	private static $singular_name = 'News Holder';

	private static $plural_name = 'News Holders';

	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeByName("Content");
		//$fields->removeByName("Metadata");

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
class NewsHolder_Controller extends Blog_Controller {

	private static $allowed_actions = array(
		'profilerss',
		'rss',
	);
	private static $url_handlers = array(
		'profile/$URLSegment!/rss' => 'profilerss',
	);

	public function rss() {
		global $project_name;
		$blogName = $this->Title;
		$altBlogName = $project_name . ' blog';
		$filters = array();
		$getVars = $this->request->getVars();

		if (isset($getVars['member'])) {
			$memberId = $getVars['member'];

			//$filters['Member.Email'] = $memberId;

			$member = Member::get()->filter(array('Email' => $memberId))->First();

			if ($member) {
				$entries = $member->BlogPosts(999);
				if ($entries->First()) {
					$rss = new RSSFeed($entries, $this->Link(), ($blogName ? $blogName : $altBlogName), "", "Title", "RSSContent");
					return $rss->outputToBrowser();
				}
			}
		} else {
			return parent::rss();
		}

	}

	public function profilerss() {
		$urlSegment = $this->request->param('URLSegment');

		if (filter_var($urlSegment, FILTER_VALIDATE_EMAIL)) {
			$profile = Member::get()->filter('Email', $urlSegment)->first();
		} else {
			$profile = $this->getCurrentProfile();
		}

		if ($profile) {
			$rss = new RSSFeed($profile->BlogPosts(), $this->Link(), $this->MetaTitle, $this->MetaDescription);
			return $rss->outputToBrowser();
		}

	}

	public function PaginatedNewsEntries($pageLength = 12) {
		$entries = $this->BlogEntries();
		return $entries->setPageLength($pageLength);
	}

}