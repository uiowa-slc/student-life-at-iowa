<?php
class DivisionStaffHolderPage extends Page {

	private static $db = array(
		'SortLastName' => 'Boolean',
		'HideLinksToStaffPages' => 'Boolean',
		'PhotoOrientation' => 'Enum(array("Landscape","Portrait"), "Landscape")'
	);

	private static $defaults = array(
		'PhotoOrientation' => 'Landscape'
	);

	private static $has_one = array(

	);

	private static $belongs_many_many = array(
		'Teams' => 'DivisionStaffTeam',
	);
	private static $layout_types = array(
		'MainImage' => 'Big Full Width Image',
		'BackgroundImage' => 'Background Image',
		'ImageSlider' => 'Image Slider',
		'BackgroundVideo' => 'Background Video',
		'StaffTable' => 'Staff Table View'
	);

	private static $allowed_children = array('DivisionStaffPage', 'VirtualPage', 'UserDefinedForm');

	public function getCMSFields(){
		$f = parent::getCMSFields();

		$f->addFieldToTab('Root.Main', new CheckboxSetField('Teams', 'Show the following staff teams on this page:', StaffTeam::get()->map('ID', 'Title')), 'Content');

		$gridFieldConfig = GridFieldConfig_RecordEditor::create();
		$gridFieldConfig->addComponent(new GridFieldSortableRows('SortOrder'));


		$gridField = new GridField('StaffTeam', 'Staff Teams', DivisionStaffTeam::get(), $gridFieldConfig);
		$f->addFieldToTab('Root.Main', $gridField, 'Content'); // add the grid field to a tab in the CMS

		return $f;
	}
	public function getSettingsFields(){
		$f = parent::getSettingsFields();

		$f->addFieldToTab('Root.Settings', new CheckboxField('SortLastName','Sort Staff By Last Name'));
		$f->addFieldToTab('Root.Settings', new CheckboxField('HideLinksToStaffPages','Hide links to individual staff pages?'));
		$f->addFieldToTab('Root.Settings', DropdownField::create( 'PhotoOrientation', 'Photo orientation', singleton('DivisionStaffHolderPage')->dbObject('PhotoOrientation')->enumValues()));

		return $f;
	}
	public function Children(){
		if($this->SortLastName){
			$staffPages = parent::Children()->sort('LastName');
		}else{
			$staffPages = parent::Children();
		}
		
		$this->extend('alterChildren', $staffPages);
		return $staffPages;
	}

	public function DivisionStaffTeams(){
		$teams = DivisionStaffTeam::get();
		return $teams;
	}
}
class DivisionStaffHolderPage_Controller extends Page_Controller {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */
	private static $allowed_actions = array(
		'rss',
		'json',
		//Feeds:
		'departmentListFeed',
		'departmentStaffFeed'
	);
	private static $url_handlers = array(
		'departmentListFeed' => 'departmentListFeed',
		'departmentStaffFeed//$ID/$TeamID' => 'departmentStaffFeed'
	);

	public function departmentListFeed(){
		$depts = DepartmentPage::get();
		$deptArray = array();

		foreach($depts as $dept){
			array_push($deptArray,
				array(
					'ID' => $dept->ID,
					'Title' => $dept->Title
				)
			);
		}
		$this->getResponse()->addHeader("Content-Type", "application/json");
		return json_encode($deptArray);
	}

	public function departmentStaffFeed(){
		$teamArray = array();
		$deptID = $this->getRequest()->param('ID');
		$dept = DepartmentPage::get()->byID($deptID);

		if(!$dept) return;

		$staffPages = $dept->StaffPages();
		$staffTeams = new ArrayList();

		foreach($staffPages as $staffPage){
			$staffPagesTeams = $staffPage->Teams();
			foreach ($staffPagesTeams as $team) {
				$staffTeams->push($team);
			}
		}
		$staffTeams->removeDuplicates();

		$teamCount = $staffTeams->Count();
		
		foreach($staffTeams as $team){
			array_push($teamArray, $team->toStaffFeedArray());
		}
		$this->getResponse()->addHeader("Content-Type", "application/json");


		$feedArray = array(
			'meta' => array(
				'teamCount' => $teamCount
			),
			'staffTeams' => $teamArray
		);

		return json_encode($feedArray);

	}

	public function rss() {
		global $project_name;
		$blogName = $this->Title;
		$altBlogName = $project_name . ' blog';
		$filters = array();
		$getVars = $this->request->getVars();

		if (isset($getVars['member'])) {
			$memberId = $getVars['member'];

			//$filters['Member.Email'] = $memberId;

			$member = Member::get()->filter(array('Email' => $memberId))->First();

			if ($member) {
				$entries = $member->BlogPosts(999);
				if ($entries->First()) {
					$rss = new RSSFeed($entries, $this->Link(), ($blogName ? $blogName : $altBlogName), "", "Title", "RSSContent");
					return $rss->outputToBrowser();
				}
			}
		} else {
			return parent::rss();
		}

	}


}