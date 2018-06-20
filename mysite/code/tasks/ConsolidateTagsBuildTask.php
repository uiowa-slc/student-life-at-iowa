<?php
use SilverStripe\Dev\BuildTask;
use SilverStripe\Blog\Model\BlogTag;

class ConsolidateTagsBuildTask extends BuildTask {

	protected $title = 'Consolidate and remove duplicate tags';

	protected $enabled = true;

	function run($request) {

		$blogs = NewsHolder::get();
		$articles = NewsEntry::get();
		$tags = BlogTag::get();
		echo '<ul>';
		foreach ($tags as $tag) {
			echo '<li>Working on tag: <strong>'.$tag->Title.'</strong>. Finding duplicates:';
			//find all tags with the same name as the tag we're working on:

			$duplicateTags = BlogTag::get()->filter(array(
				'ID:not' => $tag->ID,
				'Title' => trim($tag->Title)
			));

			if($duplicateTags->Count() > 1){
				$primaryTag = $tag;
				// $duplicateTags->removeByID($primaryTag->ID);

				echo '<br />'.$duplicateTags->Count().' duplicates found. Consolidating the following tags to '.$primaryTag->Title.' ('.$primaryTag->ID.'): <ul>';

				foreach($duplicateTags as $duplicateTag){
					echo '<li>'.$duplicateTag->Title.' ('.$duplicateTag->ID.')</li>';
					$duplicateTagPosts = $duplicateTag->BlogPosts();

					foreach($duplicateTagPosts as $duplicateTagPost){
						$primaryTag->BlogPosts()->add($duplicateTagPost);
						'<br /> Moving '.$duplicateTagPost->Title.'('.$duplicateTagPost->ID.') to tag '.$primaryTag->Title.'('.$primaryTag->ID.')';
						$duplicateTagPost->Tags()->remove($duplicateTag);
						$duplicateTag->delete();
						echo '<strong>removed</strong>';						
					}
				}

				echo '</ul>';
			}else{
				echo '<br />No duplicates found.';
			}

		}

	}

}