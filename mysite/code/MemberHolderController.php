<?php

class MemberHolderController extends Page_Controller {

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
	private static $allowed_actions = array (
		'view',
		'handleAction',
    	'handleIndex',
	);

	public function view( SS_HTTPRequest $request ) {

		$requestedName = Convert::raw2sql( $request->param( 'ID' ) );
		if ( is_numeric( $requestedName ) ) {
			$member = Member::get()->filter( array( "ID" => $requestedName ) )->First();
		}else {
			$member = Member::get()->filter( array( "URLSegment" => $requestedName ) )->First();
		}
		if ( $member ) {
			$Data = array(
				"Title" => $member->getName(),
				"Member" => $member
			);
			return $this->customise( $Data )->renderWith( array( 'MemberPage', 'Page' ) );
		}else {
			return $this->httpError( 404 );
		}
	}

	public function index( SS_HTTPRequest $request ) {
		$members = Member::get();
		$Data = array(
			"Title" => "Authors",
			"Members" => $members
		);
		return $this->customise( $Data )->renderWith( array( 'MemberListPage', 'Page' ) );

	}

	public function init() {
		parent::init();

	}

}