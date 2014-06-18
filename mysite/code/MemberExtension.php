<?php
/**
 * Adds additional fields to the Member object
 *
 */
class MemberExtension extends DataExtension {

	private static $db = array(
		"URLSegment" => "Varchar(255)",
		"Bio" => "HTMLText",


	);

	private static $has_one = array(
		"Photo" => "Image"
	);

	private static $has_many = array(

		"BlogEntries" => "BlogEntry"

	);

	
	public function updateCMSFields(FieldList $fields) {
		$baseLink = Director::absoluteBaseURL();

		$fields->removeByName("URLSegment");

		$urlsegment = new SiteTreeURLSegmentField("URLSegment", $this->owner->fieldLabel('URLSegment'));
	    $urlsegment->setURLPrefix($baseLink.'authors/view/');

		$fields->addFieldToTab("Root.Main", $urlsegment, "Password");
		
		
	}

	public function NewsEntries(){
		return $this->owner->BlogEntries()->filter(array("ClassName" => "NewsEntry"));
	}

	public function LeadershipLegacyBlogEntries(){
		return $this->owner->BlogEntries()->filter(array("ClassName" => "LeadershipLegacyBlogEntry"));
	}

	public function Link(){
		$base = "authors/view/";
		if($this->owner->URLSegment){
			return $base.$this->owner->URLSegment;
		}else{
			return $base.$this->owner->ID;
		}

	}
	public function onBeforeWrite(){
		$owner = $this->owner;

		if(!$owner->URLSegment){
			$filter = URLSegmentFilter::create();
    		$filteredName = $filter->filter($owner->getName());

    		$owner->URLSegment = $filteredName;
    		$owner->write();
		}

		parent::onBeforeWrite();

	}

}