<?php

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
			$entry = new NewsEntry();

			$entry->createFromArray($postArray);

			echo '<li>Created entry: <strong>'.$entry->Title.'</strong></li>';
			$entry->write();
			$entry->Departments()->add($dept);
			// 

			$entry->publish('Stage', 'Live');
			
			//$entry->Authors()->removeAll();

		}

		echo '</ul>';

	}

}