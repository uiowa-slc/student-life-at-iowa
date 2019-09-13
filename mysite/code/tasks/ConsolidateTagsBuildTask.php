<?php

use SilverStripe\Blog\Model\BlogTag;
use SilverStripe\Dev\BuildTask;

class ConsolidateTagsBuildTask extends BuildTask {

	protected $title = 'Consolidate and remove duplicate tags';

	protected $enabled = true;

	function run($request) {

		$blogs = NewsHolder::get();
		$articles = NewsEntry::get();
		$tags = BlogTag::get()->toArray();

		$dupTagIds = array();

		echo '<ul>';
		foreach ($tags as $tag) {

			if(!in_array($tag->ID, $dupTagIds)){


			echo '<li>Working on tag: <strong>'.$tag->Title.' ('.$tag->ID.').'.'</strong>. Finding duplicates:';
			//find all tags with the same name as the tag we're working on:

			$duplicateTags = BlogTag::get()->filter(array(
				'ID:not' => $tag->ID,
				'Title' => $tag->Title
			));

			if($duplicateTags->Count() > 0){
			
				

				echo '<br />'.$duplicateTags->Count().' duplicates found. Consolidating the following tags to '.$tag->Title.' ('.$tag->ID.'): <ul>';

				foreach($duplicateTags as $duplicateTag){
					$dupTagIds[] = $duplicateTag->ID;
					echo '<li>'.$duplicateTag->Title.' ('.$duplicateTag->ID.')</li>';
					$duplicateTagPosts = $duplicateTag->BlogPosts();
					$duplicateTag->delete();
					foreach($duplicateTagPosts as $duplicateTagPost){
						$tag->BlogPosts()->add($duplicateTagPost);
						'<br /> Moving '.$duplicateTagPost->Title.'('.$duplicateTagPost->ID.') to tag '.$tag->Title.'('.$tag->ID.')';
						$duplicateTagPost->Tags()->remove($duplicateTag);
						
						// $duplicateTagPost->write();

						// if($duplicateTagPost->isPublished){
						// 	$duplicateTagPost->publish('Stage','Live');
						// }
						//
						//print_r($duplicateTag);
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

}