<?php
class LeadershipLegacyIssueHolder extends BlogHolder {

	private static $db = array(


	);

	private static $has_one = array(

	);
	private static $belongs_many_many = array (
	);
	private static $has_many = array(
	);

	private static $allowed_children = array(
		'LeadershipLegacyBlogEntry'
	);

	private static $singular_name = 'Leadership Legacy Issue Holder';

	private static $plural_name = 'Leadership Legacy Issue Holders';

	public function getCMSFields(){
		$f = parent::getCMSFields();

		return $f;
	}


}
class LeadershipLegacyIssueHolder_Controller extends BlogHolder_Controller {

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
	);

	public function init() {
		parent::init();

	}

}