<?php
class InitiativeHolder extends Page {

	private static $db = array();
	private static $has_one = array();
	private static $allowed_children = array('InitiativePage');
	
}
	
class InitiativeHolder_Controller extends Page_Controller {

	//public static $allowed_actions = array ( "legislation" );
	
	public function init() {
		parent::init();
	}
}

?>