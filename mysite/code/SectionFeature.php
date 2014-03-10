<?php

class SectionFeature extends DataObject {
	private static $db = array(
		"Title" => "Varchar(155)",
		"Content" => "Text",
		"Link" => "Text",
		"SortOrder" => "Int"
	);
	private static $has_one = array (
		"Image" => "Image",
		"Section" => "FeatureSection"
	);

	private static $default_sort = "SortOrder";

	private static $plural_name = "Features";

}