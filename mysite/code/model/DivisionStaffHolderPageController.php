<?php

use SilverStripe\ORM\ArrayList;
use SilverStripe\Security\Member;
use SilverStripe\Control\RSS\RSSFeed;
class DivisionStaffHolderPageController extends PageController {

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
		'departmentStaffFeed',
		'departmentStaffPage'
	);
	private static $url_handlers = array(
		'departmentListFeed' => 'departmentListFeed',
		'departmentStaffFeed//$ID/$TeamID' => 'departmentStaffFeed',
		'departmentStaffPage//$ID' => 'departmentStaffPage'
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

	public function departmentStaffPage(){
		$id = $this->getRequest()->param('ID');
		$post =DivisionStaffPage::get()->filter(array('URLSegment' => $id))->First();

		if($post){
			$postArray = $post->toFeedArray();
			$this->getResponse()->addHeader("Content-Type", "application/json");
			return json_encode($postArray);	
		}else{
			$this->httpError(404);
		}

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