<?php

use SilverStripe\Blog\Model\BlogTag;
use SilverStripe\Blog\Model\BlogCategory;
use SilverStripe\Dev\BuildTask;

class ConvertTagsToCategoriesTask extends BuildTask {

	protected $title = 'Convert tags to categories';

	protected $enabled = true;

	function run($request) {

		$blogs = NewsHolder::get();
		$categories = BlogCategory::get();
		$tags = BlogTag::get();
		//$departments = DepartmentPage::get()->toArray();


		echo '<ul>';
		foreach ($tags as $tag) {
			echo '<li>Creating a new category based on tag: '.$tag->Title;

			$newCategory = BlogCategory::create();
			$newCategory->BlogID = 4;
			$newCategory->Title = $tag->Title;
			$newCategory->write();

			$tagPosts = $tag->BlogPosts();

			foreach($tagPosts as $tagPost){
				$newCategory->BlogPosts()->add($tagPost);
			}

			$tag->delete();
			echo '</li>';
		}
		echo '</ul>';
	}



}