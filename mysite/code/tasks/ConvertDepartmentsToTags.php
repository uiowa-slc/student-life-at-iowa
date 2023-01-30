<?php

use SilverStripe\Blog\Model\BlogTag;
use SilverStripe\Dev\BuildTask;

class ConvertDepartmentsToTags extends BuildTask {

	protected $title = 'Convert departments to tags';

	protected $enabled = true;

	function run($request) {

		$blogs = NewsHolder::get();
		$articles = NewsEntry::get();
		//$departments = DepartmentPage::get()->toArray();


		echo '<ul>';
		foreach ($articles as $article) {
			echo '<li> Working on article: '.$article->Title;
			$articleDepts = $article->Departments();

			if($articleDepts->First()){

				$dept = $articleDepts->First();
				echo '<ul><li>Article has department <strong>"'.$dept->Title.'</strong>", Searching for existing matching tag for dept...';
				//has a dept, create or add to the corresponding tag:
				$deptTag = $this->getOrCreateDeptTag($dept->Title);
				$deptTag->BlogPosts()->add($article);
				echo '</li></ul>';

			}
			echo '</li>';
		}
	}

	private function getOrCreateDeptTag($title){
		$tagTest = BlogTag::get()->filter(array('Title' => $title))->First();
		// tag already exists, return it
		if($tagTest){
			echo 'Existing tag <strong>'.$tagTest->Title.'</strong> found.';
			return $tagTest;
		}
		// tag doesn't exist, create it:
		$newTag = BlogTag::create();
		$newTag->BlogID = 4;
		$newTag->Title = $title;
		$newTag->write();
		echo 'Existing tag not found... Creating new tag <strong>'.$newTag->Title.'</strong> and adding post to tag.';
		return $newTag;
	}


}