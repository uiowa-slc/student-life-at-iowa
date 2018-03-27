<?php
class HomePageExtension extends DataExtension {

	private static $db = array(
		"SpotlightTitle" => "Text",
		"SpotlightContent" => "HTMLText"

	);

	private static $has_one = array(
		"Video" => "Image",
		"VideoPoster" => "Image",
		"SpotlightImage" => "Image",
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
		$fields->addFieldToTab("Root.Main", new TextField("SpotlightTitle", "Spotlight Title"));
		$fields->addFieldToTab("Root.Main", new UploadField("SpotlightImage", "Spotlight Background Image"));
		$fields->addFieldToTab("Root.Main", new HtmlEditorField("SpotlightContent", "Spotlight Content"));

	}

	//private static $allowed_children = array("");

}
