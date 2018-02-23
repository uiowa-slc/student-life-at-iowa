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
	private static $icon = 'themes/studentlife/images/blogholder-file.png';

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
		'json',
		'department',
		//Feeds:
		'departmentListFeed',
		'departmentNewsFeed',
		'departmentNewsPost',
		'departmentNewsFeedByCat',
		'departmentNewsFeedByTag'
	);
	private static $url_handlers = array(
		'profile/$URLSegment!/rss' => 'profilerss',
		'department//$ID' => 'department',
		'departmentListFeed' => 'departmentListFeed',
		'departmentNewsFeed//$ID' => 'departmentNewsFeed',
		'departmentNewsFeedByTag//$ID/$TagID' => 'departmentNewsFeedByTag',
		'departmentNewsFeedByCat//$ID/$CatID' => 'departmentNewsFeedByCat',
		'departmentNewsPost//$ID' => 'departmentNewsPost'
	);

	public function department(){
		
	}
	public function departmentListFeed(){
		$depts = DepartmentPage::get();
		$deptArray = array();

		foreach($depts as $dept){
			array_push($deptArray,
				array(
					'ID' => $dept->ID,
					'Title' => $dept->Title
				)
			);
		}
		$this->getResponse()->addHeader("Content-Type", "application/json");
		return json_encode($deptArray);
	}

	public function departmentNewsFeed(){
		$postArray = array();
		$deptID = $this->getRequest()->param('ID');
		$dept = DepartmentPage::get()->byID($deptID);

		if(!$dept) return;

		$postCount = $dept->NewsEntries()->Count();
		

		$posts = new PaginatedList($dept->NewsEntries(), $this->getRequest());
		$posts->setPageLength(10);

		foreach($posts as $post){
			array_push($postArray, $post->toFeedArray());
		}
		$this->getResponse()->addHeader("Content-Type", "application/json");


		$feedArray = array(
			'meta' => array(
				'postCount' => $postCount
			),
			'posts' => $postArray
		);

		return json_encode($feedArray);

	}
	public function departmentNewsFeedByCat(){
		$postArray = array();
		$deptID = $this->getRequest()->param('ID');
		$dept = DepartmentPage::get()->byID($deptID);
		$cat = $this->getRequest()->param('CatID');

		if(!$dept) return;

		$postCount = $dept->NewsEntriesByCat($cat)->Count();
		
		$posts = new PaginatedList($dept->NewsEntriesByCat($cat), $this->getRequest());
		$posts->setPageLength(10);

		foreach($posts as $post){
			array_push($postArray, $post->toFeedArray());
		}
		$this->getResponse()->addHeader("Content-Type", "application/json");


		$feedArray = array(
			'meta' => array(
				'postCount' => $postCount
			),
			'posts' => $postArray
		);

		return json_encode($feedArray);

	}
	public function departmentNewsFeedByTag(){
		$postArray = array();
		$deptID = $this->getRequest()->param('ID');
		$dept = DepartmentPage::get()->byID($deptID);
		$tag = $this->getRequest()->param('TagID');

		if(!$dept) return;

		$postCount = $dept->NewsEntriesByTag($tag)->Count();
		

		$posts = new PaginatedList($dept->NewsEntriesByTag($tag), $this->getRequest());
		$posts->setPageLength(10);

		foreach($posts as $post){
			array_push($postArray, $post->toFeedArray());
		}
		$this->getResponse()->addHeader("Content-Type", "application/json");


		$feedArray = array(
			'meta' => array(
				'postCount' => $postCount
			),
			'posts' => $postArray
		);

		return json_encode($feedArray);

	}
	public function departmentNewsPost(){
		$id = $this->getRequest()->param('ID');
		$post = NewsEntry::get()->filter(array('URLSegment' => $id))->First();

		if($post){
			$postArray = $post->toFeedArray();

			$this->getResponse()->addHeader("Content-Type", "application/json");
			return json_encode($postArray);			
		}else{
			return;
		}

	}
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