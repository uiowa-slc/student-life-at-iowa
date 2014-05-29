<?php
class Section extends Page {

	private static $db = array(


	);

	private static $has_one = array(

	);
	private static $belongs_many_many = array(
	);



	public function getCMSFields(){
		$f = parent::getCMSFields();
		return $f;
	}

	public function SectionLink(){
		$base = Director::baseURL();
		return $base.'#'.$this->URLSegment;
	}

	public function RenderedSection(){
		$controller = Controller::curr();
		return $controller->renderWith($this->ClassName, "Section");
	}

}
class Section_Controller extends Page_Controller {

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

	public function index(){
		$parent = $this->getParent();
		$url = $parent->Link().'#'.$this->URLSegment;
		$this->redirect($url);
	}
}