<?php

use SilverStripe\Assets\Image;
use SilverStripe\Assets\File;
use SilverStripe\Forms\FieldList;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\HeaderField;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
class SlHomePageExtension extends DataExtension {

	private static $db = array(
		"Announcement" => "HTMLText",
		"DepartmentTitle" => "Text",
		"DepartmentContent" => "HTMLText"

	);

	private static $has_one = array(

	);

	private static $belongs_many_many = array(

	);


	public function updateCMSFields(FieldList $fields) {
		$fields->removeByName("ShuffleHomePageFeatures");
		$fields->removeByName("ShowChildrenInDropdown");
		$fields->removeByName("LayoutType");
		$fields->removeByName("NewHomePageHeroFeature");

		$fields->addFieldToTab("Root.Announcement", new HtmlEditorField("Announcement", "Content"));

	}

	//private static $allowed_children = array("");

}
