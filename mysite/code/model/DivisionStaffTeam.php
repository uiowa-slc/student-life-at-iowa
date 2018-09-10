<?php
class DivisionStaffTeam extends DataObject {

	private static $db = array(
		'Name' => 'Text',
		'SortOrder' => 'Int'
	);

	private static $many_many = array(
		'StaffPages' => 'DivisionStaffPage',
		'StaffHolderPages' => 'DivisionStaffHolderPage'
	);
		
	private static $summary_fields = array( 
		'Name' => 'Name',
	);

	private static $default_sort = array(
		'SortOrder'
	);

	public function getCMSFields() {
		$f = parent::getCMSFields();
		
		$f->addFieldToTab('Root.Main', new CheckboxSetField('StaffPages', 'Team <a href="admin/pages/edit/show/14" target="_blank">(Manage Teams)</a>', DivisionStaffPage::get()->map('ID', 'Title')));
		return $f;
		
	}

	public function SortedStaffPages(){
		$staffPages = $this->DivisionStaffPages()->sort('Sort');
		$this->extend('alterSortedStaffPages', $staffPages);
		return $staffPages;

	}

	public function toStaffFeedArray(){
		$team = $this->owner;
		$teamArray = array();

		$teamStaff = $team->StaffPages();
		$teamStaffArray = array();

		foreach($teamStaff as $staff){
			$postAuthorSingleArray = array(
				'ID' => $staff->ID,
				'Name' => $staff->Name,
				'Email' => $staff->Email,
				'ImageURL' => $staff->BlogProfileImage()->AbsoluteURL,
			);
			array_push($teamStaffArray, $teamStaffSingleArray);
		}

		$staffArrayItem = array(
				'StudentLifeID' => $team->ID,
				'Title' => $team->Title,
				'ID' => $team->ID,
				'Content' => $team->Content,
				'URLSegment' => $team->URLSegment,
				'Staff' => $teamStaffArray,
				'PublishDate' => $team->PublishDate,
				'ExternalURL' => $team->ExternalURL
		);

		return $staffArrayItem;
	}

}
