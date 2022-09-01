<?php

use SilverStripe\Assets\Image;
use SilverStripe\Blog\Model\BlogCategory;
use SilverStripe\Blog\Model\BlogTag;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\ArrayList;
use SilverStripe\Security\Member;

class DepartmentPage extends Page {

	private static $db = array(
		"KeyStatTitle" => "Text",
		"KeyStat1Num" => "Text",
		"KeyStat1Body" => "HTMLText",
		"KeyStat2Num" => "Text",
		"KeyStat2Body" => "HTMLText",
		"KeyStat3Num" => "Text",
		"KeyStat3Body" => "HTMLText",
		"WebsiteURL" => "Text",
		"StaffPageURL" => "Text"
	);

	private static $has_one = array(
		"Photo" => Image::class,
	);

	private static $belongs_many_many = array(
		'NewsEntries' => 'NewsEntry',
	);


	public function getCMSFields() {
		$fields = parent::getCMSFields();

		$fields->addFieldToTab("Root.Main", TextField::create("WebsiteURL", "Visit Website URL")->setDescription('Please include https://'));
		$fields->addFieldToTab("Root.Main", TextField::create("StaffPageURL", "Website staff page URL")->setDescription('Please include https://'));

		$fields->addFieldToTab("Root.Main", new TextField("KeyStatTitle", "Key Title"));
		$fields->addFieldToTab("Root.Main", new TextField("KeyStat1Num", "Key Stat 1 - Number"));
		$fields->addFieldToTab("Root.Main", HtmlEditorField::create("KeyStat1Body", "Key Stat 1 - Content")->setRows(4));

		$fields->addFieldToTab("Root.Main", new TextField("KeyStat2Num", "Key Stat 2 - Number"));
		$fields->addFieldToTab("Root.Main", HtmlEditorField::create("KeyStat2Body", "Key Stat 2 - Content")->setRows(4));

		$fields->addFieldToTab("Root.Main", new TextField("KeyStat3Num", "Key Stat 3 - Number"));
		$fields->addFieldToTab("Root.Main", HtmlEditorField::create("KeyStat3Body", "Key Stat 3 - Content")->setRows(4));

		return $fields;

	}

	public function NewsLink() {
		$newsHolder = NewsHolder::get()->First();
		$link = $newsHolder->Link('department/' . $this->URLSegment);
		return $link;
	}

	public function NewsEntriesByTag($tagTitle) {

		if (is_numeric($tagTitle)) {
			$tag = BlogTag::get()->filter(array('ID' => $tagTitle))->First();
		} else {
			$tag = BlogTag::get()->filter(array('URLSegment' => $tagTitle))->First();
		}

		if ($tag) {

			$tagEntries = $tag->BlogPosts()->toArray();
			$deptEntries = $this->NewsEntries()->toArray();

			$intersectEntries = array_intersect($tagEntries, $deptEntries);

			$list = new ArrayList($intersectEntries);

			return $list;

		}

	}
	public function NewsEntriesByCat($catTitle) {

		// print_r($catTitle);
		if (is_numeric($catTitle)) {
			$cat = BlogCategory::get()->filter(array('ID' => $catTitle))->First();
		} else {
			$cat = BlogCategory::get()->filter(array('URLSegment' => $catTitle))->First();
		}

		if ($cat) {

			$catEntries = $cat->BlogPosts()->toArray();
			$deptEntries = $this->NewsEntries()->toArray();

			$intersectEntries = array_intersect($catEntries, $deptEntries);

			$list = new ArrayList($intersectEntries);

			return $list;

		}

	}

	public function NewsEntriesByAuthor($authorID) {
		$author = Member::get()->filter(array('ID' => $authorID))->First();

		if ($author) {
			$authorEntries = $author->BlogPosts();
			return $authorEntries;
		}

		return null;
	}

	//private static $allowed_children = array("");

}
