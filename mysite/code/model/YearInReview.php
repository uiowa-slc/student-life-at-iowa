<?php
class YearInReview extends Page {

	private static $db = array(
		"StoryTitle" => "Text",
		'FilterBy' => 'Enum(array("Tag","Category")',
		'SortBy' => "Enum('Recent,Random,Featured')"
	);

	private static $has_one = array(
		'Blog' => 'Blog'
	);

	private static $has_many = array(
		'YearInReviewHeroFeatures' => 'YearInReviewHeroFeature',

	);

	private static $many_many = array(
		'Tags' => 'BlogTag',
		'Categories' => 'BlogCategory'
	);

	private static $defaults = array(
		// 'Limit' => 3,
		// 'SortBy' => 'Recent'
	);

	private static $belongs_many_many = array(

	);

	public function getCMSFields() {

		$fields = parent::getCMSFields();

		$fields->removeByName('SortBy');
		$fields->removeByName('FilterTagMethod');
		$fields->removeByName('Tags');
		$fields->removeByName('Categories');


		// Hero Features
		$gridFieldConfig = GridFieldConfig_RelationEditor::create()->addComponents();
		$gridFieldConfig->addComponent(new GridFieldSortableRows('SortOrder'));
		$gridField = new GridField("YearInReviewHeroFeatures", "Hero Feature:", $this->YearInReviewHeroFeatures(), $gridFieldConfig);
		$fields->addFieldToTab("Root.Main", $gridField);


		// Stories
		$fields->addFieldToTab("Root.Main", new TextField("StoryTitle", "Title for Stories"));

		$tags = BlogTag::get();
		$cats = BlogCategory::get();

		$fields->addFieldsToTab('Root.Main',
			array(
				$filterBy = DropdownField::create(
				  'FilterBy',
				  'Filter Posts By:',
				  singleton('YearInReview')->dbObject('FilterBy')->enumValues()
				),

				$tagField = ListboxField::create(
					'Tags',
					'Show entries tagged with ANY of the following tags:',
					$tags->map()->toArray()
				)->setMultiple(true),

				$catField = ListboxField::create(
					'Categories',
					'Show entries tagged with ANY of the following categories:',
					$cats->map()->toArray()
				)->setMultiple(true),

				$blogField = DropdownField::create('BlogID', 'Choose a blog to retrieve posts from', Blog::get()->map())->setEmptyString('(Any blog on this site)'),

				// $deptField = NewsDeptDropdownField::create('StudentLifeNewsDeptID', 'Department')
			)
		);

		$tagField->displayIf('FilterBy')->isEqualTo('Tag');
		$catField->displayIf('FilterBy')->isEqualTo('Category');


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

	public function Entries(){

		$entries = new ArrayList();

		switch ($this->FilterBy){

			case 'Tag':
				$tags = $this->Tags();
				foreach($tags as $tag){
					$tagEntries = $tag->BlogPosts();
					$entries->merge($tagEntries);
				}
				break;

			case 'Category':
				$cats = $this->Categories();
				foreach($cats as $cat){
					$catEntries = $cat->BlogPosts();
					$entries->merge($catEntries);
				}
				break;
		}

		switch($this->SortBy){
			case 'Random':
				foreach($entries as $entry) {
				    $entry->__Sort = mt_rand();
				}
				$entries = $entries->sort('__Sort');
				break;

			case 'Featured':
				$entries = $entries->sort('IsFeatured, PublishDate DESC');
				break;
			default:
				$entries = $entries->sort('PublishDate DESC');
				break;
		}

		return $entries;
	}
}