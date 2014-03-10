<?php
class Page extends SiteTree {

	private static $db = array(
		
	);

	private static $has_one = array(
	);


	private static $many_many = array (
	);

    private static $many_many_extraFields=array(
      );

    private static $plural_name = "Pages";

	private static $defaults = array ();


	public function getCMSFields(){
		$f = parent::getCMSFields();
		
		return $f;
	}

	
}
class Page_Controller extends ContentController {

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
	private static $allowed_actions = array ( 'ContactForm'
	);

	public function init() {
		parent::init();

		// Note: you should use SS template require tags inside your templates
		// instead of putting Requirements calls here.  However these are
		// included so that our older themes still work
	}


	public function ContactForm() {
	  return ContactForm::create("ContactForm","uisg@uiowa.edu","You've received a new contact form!")
	            ->addFields(
	                TextField::create("Name","What is your name?"),
	                EmailField::create("Email", "What is your email?")
	            )
	            // You can add fields as strings, too.
	            ->addField("Your message//Textarea")
	            ->setSuccessMessage("Thanks for submitting the form!")
	            ->setSuccessURL('thanks/')
	            ->setOnBeforeSend(function($data, $form) {
	                  // Do stuff here. Return false to refuse the form.
	            })
	            ->setEmailTemplate("ContactPageEmail")
	            ->addOmittedField("SomeField")
	            ->setIntroText("Someone submitted a form. Here's the data.")
	            ->addSpamProtector(
	                HoneyPotSpamProtector::create()
	            )
	            ->render();
	}
	
}