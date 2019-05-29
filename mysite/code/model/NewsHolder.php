<?php

use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Blog\Model\BlogTag;
use SilverStripe\Blog\Model\Blog;
use SilverStripe\Lumberjack\Model\Lumberjack;
use SilverStripe\Core\Config\Config;
use SilverStripe\ORM\ArrayList;
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
		"PhotoGalleryImageOne" => Image::class,
		"PhotoGalleryImageTwo" => Image::class,
		"PhotoGalleryImageThree" => Image::class,
	);
	private static $belongs_many_many = array(
	);
	private static $has_many = array(
	);

	private static $allowed_children = array(
		'NewsEntry'
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

	public function FeaturedNews(){

		$tag = BlogTag::get()->filter(array('Title' => 'Featured'))->First();
		//If Featured tag doesn't exist, just return standard chronological posts
		if(!$tag){
			return NewsEntry::get()->filter(array("ParentID" => $this->ID))->Limit(10);
		}

		$posts = $tag->BlogPosts()->filter(array("ParentID" => $this->ID));

		if($posts->Count() > 0){
			return $posts;
		}else{
			return NewsEntry::get()->filter(array("ParentID" => $this->ID))->Limit(10);
		}

	}

}