<?php

use SilverStripe\Blog\Model\BlogTag;
use SilverStripe\Blog\Model\BlogCategory;
use SilverStripe\Dev\BuildTask;

class CleanOutTagsTask extends BuildTask {

	protected $title = 'Clean out most tags and categories except a few';

	protected $enabled = true;

	private $allowedTags = array(398, 412, 447);
	private $allowedCategories = array();



	function run($request) {
		$tags = BlogTag::get();
		echo "<h2>Cleaning up tags</h2>";
		echo "<ul>";
		foreach($tags as $tag){
			echo "<li>working on ".$tag->Title;
			if(!in_array($tag->ID, $this->allowedTags)) {
			    echo " <strong>(ID found, tag removed)</strong>";
			    $tag->delete();
			}
			echo "</li>";
		}
		echo "</ul>";
		$categories = BlogCategory::get();
		echo "<h2>Cleaning up categories</h2>";
		echo "<ul>";
		foreach($categories as $category){
			echo "<li>working on ".$category->Title;
			if(!in_array($category->ID, $this->allowedCategories)) {
			    echo " <strong>(ID found, category removed)</strong>";
			    $category->delete();
			}
			echo "</li>";
		}
		echo "</ul>";
	}

}