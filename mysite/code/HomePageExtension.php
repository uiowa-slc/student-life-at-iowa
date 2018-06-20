<?php
use SilverStripe\ORM\DataExtension;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\FieldList;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\HeaderField;
use SilverStripe\Forms\TextField;

class HomePageExtension extends DataExtension {

	private static $db = array(
		"WhatWeDoTitle" => "Text",
		"WhatWeDoContent" => "HTMLText",
		"SpotlightTitle" => "Text",
		"SpotlightContent" => "HTMLText",
		"DepartmentTitle" => "Text",
		"DepartmentContent" => "HTMLText"

	);

	private static $has_one = array(
		"Video" => Image::class,
		"VideoPoster" => Image::class,
		"SpotlightImage" => Image::class,
	);

	private static $belongs_many_many = array(

	);


	public function updateCMSFields(FieldList $fields) {
		$fields->removeByName("ShuffleHomePageFeatures");
		$fields->removeByName("ShowChildrenInDropdown");
		$fields->removeByName("LayoutType");
		$fields->removeByName("NewHomePageHeroFeature");

		$fields->addFieldToTab("Root.Main", new UploadField("Video", "Video"));
		$fields->addFieldToTab("Root.Main", new UploadField("VideoPoster", "Poster image for video"));

		$fields->addFieldToTab("Root.Main", new HeaderField( '<br /><br /><br />', '1', true ) );
		$fields->addFieldToTab("Root.Main", new TextField("WhatWeDoTitle", "What We Do Title"));
		$fields->addFieldToTab("Root.Main", new HtmlEditorField("WhatWeDoContent", "What We Do Content"));

		$fields->addFieldToTab("Root.Main", new HeaderField( '<br /><br /><br />', '1', true ) );
		$fields->addFieldToTab("Root.Main", new TextField("SpotlightTitle", "Spotlight Title"));
		$fields->addFieldToTab("Root.Main", new UploadField("SpotlightImage", "Spotlight Background Image"));
		$fields->addFieldToTab("Root.Main", new HtmlEditorField("SpotlightContent", "Spotlight Content"));

		$fields->addFieldToTab("Root.Main", new HeaderField( '<br /><br /><br />', '1', true ) );
		$fields->addFieldToTab("Root.Main", new TextField("DepartmentTitle", "Departments Title"));
		$fields->addFieldToTab("Root.Main", new HtmlEditorField("DepartmentContent", "Departments Content"));

	}

	//private static $allowed_children = array("");

}
