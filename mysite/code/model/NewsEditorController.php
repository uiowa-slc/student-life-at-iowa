<?php

use SilverStripe\ORM\PaginatedList;
use SilverStripe\View\ArrayData;
use SilverStripe\Security\Member;
use SilverStripe\Control\RSS\RSSFeed;
use SilverStripe\Control\Email\Email;
use SilverStripe\Blog\Model\BlogController;
use SilverStripe\Forms\HTMLEditor\TinyMCEConfig;
use SilverStripe\View\Requirements;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\TagField\TagField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\FormAction;
use SilverStripe\Forms\Form;
use SilverStripe\Versioned\Versioned;
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Admin\LeftAndMain;
use SilverStripe\Admin\CMSMenu;
use SilverStripe\Core\Injector\Injector;
use SilverStripe\Control\Director;
use SilverStripe\Admin\AdminRootController;
use SilverStripe\Security\SecurityToken;
use SilverStripe\Core\Convert;
use Silverstripe\Core\Manifest\ModuleLoader;
use Silverstripe\Forms\DropdownField;

class NewsEditorController extends PageController {

	private static $allowed_actions = array(
		'newsEditor'
	);
	private static $url_handlers = array(
		'add//$action' => 'newsEditor'
	);

	public function init(){
		parent::init();
	}

	public function newsEditor() {
		$action = $this->getRequest()->param('action');
		if (isset($action)) {
			$response = $this->getResponse();
			return $response;
		}

		$NewsEntry = NewsEntry::create();
		$NewsEntry->parent = NewsHolder::get()->first();
		$NewsEntry->write();

		//redirect to $NewsEntry->Link('edit/');
		return $this->redirect('news/'.$NewsEntry->URLSegment.'/edit?stage=Stage&new=1');
	}

}