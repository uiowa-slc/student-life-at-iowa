<?php
use SilverStripe\Dev\BuildTask;
use SilverStripe\Control\Director;
use SilverStripe\Assets\Image;
use SilverStripe\Blog\Model\BlogTag;

class ImportPostsBuildTask extends BuildTask {

	protected $title = 'Import posts to their respective department (use ?deptId=[DEPTID]&base=[DEPTURL])';
	protected $enabled = true;

	public function run($request) {
		$getVars = $request->getVars();


		if(!isset($getVars['deptId'])){
			echo '<p>Please specify a department ID to import from with ?deptId=[DEPTID]</p>';
			return;
		}
		if(!isset($getVars['base'])){
			echo '<p>Please specify a base URL to import from with ?base=[DEPTURL]</p>';
			return;
		}

		$deptId = $getVars['deptId'];
		$dept = DepartmentPage::get()->byID($deptId);

		if(!$dept){
			echo '<p>Specified department ID not found in Student Life at Iowa, check the department ID number... Exiting...</p>';
			return;
		}
		$base = $getVars['base'];

		$feedURL = $base.'/home/exportPosts';

		echo '<p>Importing from '.$feedURL.'....</p>';

		$strData = file_get_contents($feedURL);
		$postsArray = json_decode($strData,true);

		echo '<ul>';


		foreach($postsArray as $postArray){

			$entry = $this->importEntryFromArray($postArray, $base);
			$entry->OriginalDepartmentID = $deptId;
			

			//See if we've already imported this post:
			$existingPostTest = NewsEntry::get()->filter(array('OriginID' => $entry->OriginID, 'OriginalDepartmentID' => $entry->OriginalDepartmentID))->First();


			if($existingPostTest){
				echo '<li>We\'ve already imported the post <strong>'.$entry->Title.'</strong>, skipping</li>';

			}else{
				echo '<li>Created entry: <strong>'.$entry->Title.'</strong></li>';
				$entry->write();
				$entry->Departments()->add($dept);
				// 

				$entry->publish('Stage', 'Live');				
			}

			//$entry->Authors()->removeAll();

		}

		echo '</ul>';

	}
	private function importEntryFromArray($array, $base){

		$entry = new NewsEntry();


		$parent = NewsHolder::get()->filter(array('URLSegment' => 'news'))->First();

		$entry->Title = $array['Title'];

		$content = $array['Content'];

		$contentFiltered = $this->filterAndImportInlineImages($content, $base);

		$entry->Content = $contentFiltered;
		$entry->ParentID = $parent->ID;
		$entry->OriginID = $array['ID'];

		$authors = implode(', ', $array['Authors']);

		$entry->StoryByEmail = $authors;
		$entry->StoryBy = $array['StoryBy'];
		$entry->StoryByTitle = $array['StoryByTitle'];
		$entry->StoryByDept = $array['StoryByDept'];

		$entry->PublishDate = $array['PublishDate'];

		echo '<ul>';
		if($array['FeaturedImageName'] != ''){

			$imageURL = $array['FeaturedImage'];
			$imageName = $array['FeaturedImageName'];
			$assetsDir = Director::getAbsFile('assets/Uploads/imported/');

			$newImagePath = $assetsDir.$imageName;
			file_put_contents($newImagePath, 
				file_get_contents($imageURL)
			);


			$image = new Image();

			
			$image->Name = $imageName;

			$image->write();
			$image->Filename = 'assets/Uploads/imported/'.$imageName;
			//Need to write the image data object twice in order for the updated Filename to stick for some reason
			$image->write();

			$entry->FeaturedImageID = $image->ID;

			echo '<li>No featured image on this post.</li>';
			

			
		}else{
			echo '<li>No featured image on this post.</li>';
		}
		echo '</ul>';

		//TODO: Tags import

		echo '<ul>';
		if(count($array['Tags']) > 0){
			echo '<li>Found tags: ';
			$newTagCandidates = $array['Tags'];

			foreach($newTagCandidates as $newTagCandidate){
				echo $newTagCandidate.', ';
			}

			foreach($newTagCandidates as $newTagCandidate){
				$newTagCandidate = trim($newTagCandidate);
				echo 'Converting tag <strong>'.$newTagCandidate.'</strong>...';
				$existingTag = BlogTag::get()->filter(array('Title' => $newTagCandidate))->First();


				if($existingTag){
					echo 'Existing tag <strong>'.$existingTag->Title.'</strong> found in database, adding post to this tag. ';

					$entry->Tags()->add($existingTag);
				}else{
					echo 'No equivalent tag found, creating a new tag <strong>'.$newTagCandidate.'</strong>';
					$newTag = BlogTag::create();
					$newTag->Title = $newTagCandidate;
					$newTag->BlogID = $parent->ID;
					$newTag->write();
					
					$entry->Tags()->add($newTag);
				}
			echo '</li>';

			}

			
		}else{
			echo '<li>No tags on this post.</li>';
		}
		echo '</ul>';		



		$entry->PhotosBy = $array['PhotosBy'];
		$entry->PhotosByEmail = $array['PhotosByEmail'];
		$entry->ExternalURL = $array['ExternalURL'];


		return $entry;

	}

	private function filterAndImportInlineImages($content, $importedBase) {

	    $doc = new DOMDocument();
	    $doc->loadHTML('<?xml encoding="utf-8" ?>'.$content);

	    $tags = $doc->getElementsByTagName('img');

	    $baseDir = Director::baseFolder();

	    if(count($tags) > 0)
	    {
	    	foreach($tags as $tag){
	    		$tagSrc = $tag->getAttribute('src');
	    		$tagFileName = basename($tagSrc);
				$newImagePath = $baseDir.'/assets/Uploads/imported/'.$tagFileName;

				$tag->setAttribute('src', 'assets/Uploads/imported/'.$tagFileName);
				$tagSrcWithBase = $importedBase.$tagSrc;
				//print_r($baseDir);
				file_put_contents($newImagePath, 
					file_get_contents($tagSrcWithBase )
				);

				echo '<li>Importing '.$tagSrcWithBase.'</li>';

				$image = new Image();

				
				$image->Name = $tagFileName;

				$image->write();
				$image->Filename = $tagSrc;
				//Need to write the image data object twice in order for the updated Filename to stick for some reason
				$image->write();

	    	}
				$html = $doc->saveHTML();

				return $html;
	       
	    }

	    
	}	
}