<?php

use SilverStripe\Blog\Model\Blog;
use SilverStripe\Assets\Image;
use SilverStripe\Blog\Model\BlogTag;
use SilverStripe\Blog\Model\BlogCategory;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use UndefinedOffset\SortableGridField\Forms\GridFieldSortableRows;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\ListboxField;
use EdgarIndustries\YouTubeField\YouTubeField;

class YearInReview extends Page {

	private static $db = array(
		"StoryTitle" => "Text",
		"StoryContent" => "HTMLText",
		'FilterBy' => 'Enum(array("Tag","Category")',
		'SortBy' => "Enum('Recent,Random,Featured')",
		"Year" => 'Int',
		'SecondaryContentVideo' => 'Varchar(11)',
		'SecondaryContent' => 'HTMLText'
	);

	private static $has_one = array(
		'Blog' => Blog::class,
		'StoryPhoto' => Image::class
	);

	private static $has_many = array(
		'YearInReviewHeroFeatures' => 'YearInReviewHeroFeature',

	);

	private static $many_many = array(
		'Tags' => BlogTag::class,
		'Categories' => BlogCategory::class
	);

	private static $defaults = array(
		// 'Limit' => 3,
		// 'SortBy' => 'Recent'
	);

	private static $icon_class ='font-icon-back-in-time';

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
		$fields->addFieldToTab("Root.Main", new UploadField("StoryPhoto", "Photo for Stories Header"));
		$fields->addFieldToTab("Root.Main", new HTMLEditorField("StoryContent", "Content for Stories Header"));

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
				),

				$catField = ListboxField::create(
					'Categories',
					'Show entries tagged with ANY of the following categories:',
					$cats->map()->toArray()
				),

				$blogField = DropdownField::create('BlogID', 'Choose a blog to retrieve posts from', Blog::get()->map())->setEmptyString('(Any blog on this site)'),

				// $deptField = NewsDeptDropdownField::create('StudentLifeNewsDeptID', 'Department')
			)
		);

		$tagField->displayIf('FilterBy')->isEqualTo('Tag');
		$catField->displayIf('FilterBy')->isEqualTo('Category');

		$fields->addFieldToTab('Root.Main', new TextField('Year','Last year this review covers (used internally on the backend)'));

		$fields->addFieldToTab('Root.Main', new YouTubeField('SecondaryContentVideo', 'Video below the big list of stories'));
		$fields->addFieldToTab('Root.Main', HTMLEditorField::create('SecondaryContent', 'Content below the big list of stories')->addExtraClass('stacked'));

		return $fields;

	}


}