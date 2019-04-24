<?php

use SilverStripe\ORM\ArrayList;
use SilverStripe\Blog\Model\BlogPostController;
use SilverStripe\Admin\LeftAndMain;
use SilverStripe\Admin\CMSMenu;
use SilverStripe\Core\Injector\Injector;
use SilverStripe\Control\Director;
use SilverStripe\Admin\AdminRootController;
use SilverStripe\Security\SecurityToken;
use SilverStripe\Core\Convert;
use SilverStripe\View\Requirements;
use SilverStripe\Forms\HTMLEditor\TinyMCEConfig;
use SilverStripe\Security\Member;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\ListboxField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\FormAction;
use SilverStripe\Forms\Form;
use SilverStripe\Versioned\Versioned;
use Silverstripe\Core\Manifest\ModuleLoader;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\FileField;
use SilverStripe\Control\RequestHandler;
use SilverStripe\Control\HTTPRequest;

class NewsEntryController extends BlogPostController {

	private static $url_handlers = array(
		'edit//' => 'newsEditor'
	);

	private static $allowed_actions = array(
		'edit',
		'newsEditor',
		'NewsEditorForm'
	);

	public function newsEditor() {
		$Data = array();
		return $this->owner->customise($Data)->renderWith(array("NewsEntry_Edit", "Page"));
	}

	/**
     * Gets the combined configuration of all LeftAndMain subclasses required by the client app.
     *
     * @return string
     *
     * WARNING: Experimental API
     */
    public function getCombinedClientConfig()
    {
        $combinedClientConfig = ['sections' => []];
        $cmsClassNames = CMSMenu::get_cms_classes(LeftAndMain::class, true, CMSMenu::URL_PRIORITY);
        // append LeftAndMain to the list as well
        $cmsClassNames[] = LeftAndMain::class;
        foreach ($cmsClassNames as $className) {
            $combinedClientConfig['sections'][] = Injector::inst()->get($className)->getClientConfig();
        }
        // Pass in base url (absolute and relative)
        $combinedClientConfig['baseUrl'] = Director::baseURL();
        $combinedClientConfig['absoluteBaseUrl'] = Director::absoluteBaseURL();
        $combinedClientConfig['adminUrl'] = AdminRootController::admin_url();
        // Get "global" CSRF token for use in JavaScript
        $token = SecurityToken::inst();
        $combinedClientConfig[$token->getName()] = $token->getValue();
        // Set env
        $combinedClientConfig['environment'] = Director::get_environment_type();
        $combinedClientConfig['debugging'] = LeftAndMain::config()->uninherited('client_debugging');
        return Convert::raw2json($combinedClientConfig);
    }

	public function NewsEditorForm() {

		Requirements::javascript('silverstripe/admin: thirdparty/jquery/jquery.js');
		Requirements::javascript('silverstripe/admin:thirdparty/jquery-entwine/dist/jquery.entwine-dist.js');
		Requirements::javascript('silverstripe/admin: client/dist/js/vendor.js');
		Requirements::javascript('silverstripe/admin: client/dist/js/bundle.js');

		$clientConfig = '{
  			"sections": []}';
        Requirements::customScript("
            window.ss = window.ss || {};
            window.ss.config = " . $this->getCombinedClientConfig() . ";
        ");

		TinyMCEConfig::get('default')
	    ->setOptions([
	        'friendly_name' => 'Default CMS',
	        'priority' => '50',
	        'skin' => 'silverstripe',
	        'body_class' => 'typography',
	        'contextmenu' => "sslink ssmedia ssembed inserttable | cell row column deletetable",
	        'use_native_selects' => false,
	        'valid_elements' => "@[id|class|style|title],a[id|rel|rev|dir|tabindex|accesskey|type|name|href|target|title"
	            . "|class],-strong/-b[class],-em/-i[class],-strike[class],-u[class],#p[id|dir|class|align|style],-ol[class],"
	            . "-ul[class],-li[class],br,img[id|dir|longdesc|usemap|class|src|border|alt=|title|width|height|align|data*],"
	            . "-sub[class],-sup[class],-blockquote[dir|class],-cite[dir|class|id|title],"
	            . "-table[cellspacing|cellpadding|width|height|class|align|summary|dir|id|style],"
	            . "-tr[id|dir|class|rowspan|width|height|align|valign|bgcolor|background|bordercolor|style],"
	            . "tbody[id|class|style],thead[id|class|style],tfoot[id|class|style],"
	            . "#td[id|dir|class|colspan|rowspan|width|height|align|valign|scope|style],"
	            . "-th[id|dir|class|colspan|rowspan|width|height|align|valign|scope|style],caption[id|dir|class],"
	            . "-div[id|dir|class|align|style],-span[class|align|style],-pre[class|align],address[class|align],"
	            . "-h1[id|dir|class|align|style],-h2[id|dir|class|align|style],-h3[id|dir|class|align|style],"
	            . "-h4[id|dir|class|align|style],-h5[id|dir|class|align|style],-h6[id|dir|class|align|style],hr[class],"
	            . "dd[id|class|title|dir],dl[id|class|title|dir],dt[id|class|title|dir]",
	        'extended_valid_elements' => "img[class|src|alt|title|hspace|vspace|width|height|align|name"
	            . "|usemap|data*],iframe[src|name|width|height|align|frameborder|marginwidth|marginheight|scrolling],"
	            . "object[width|height|data|type],param[name|value],map[class|name|id],area[shape|coords|href|target|alt]"
	    ]);

	    $module = ModuleLoader::inst()->getManifest()->getModule('silverstripe/admin');
		TinyMCEConfig::get('default')
		    ->enablePlugins([
		        'contextmenu' => null,
		        'image' => $module->getResource('thirdparty/tinymce/plugins/image/plugin.js'),
		        'link' => $module->getResource('thirdparty/tinymce/plugins/link/plugin.js'),
		        // 'sslinkexternal' => $module->getResource('client/dist/js/TinyMCE_sslink-external.js'),
		        // 'sslinkemail' => $module->getResource('client/dist/js/TinyMCE_sslink-email.js'),
		    ])
		    ->setOption('contextmenu', 'link image ssembed inserttable | cell row column deletetable');
		TinyMCEConfig::get('default')->addButtonsToLine(2, 'image');
		
		$Member = Member::CurrentUser();

		if ($Member) {

			$fields = new FieldList(
				new TextField('Title', 'Title'),
				new Textfield('URLSegment','URLSegment'),
				new TextField("ExternalURL", "External URL"),
				new FileField('FeaturedImage', 'Featured Image'),
				new TextareaField('StoryByEmail', 'Author email addresses (comma separated)'),
				new ListboxField('Departments', 'Departments', DepartmentPage::get()),
				new HTMLEditorField('Content', 'Content')
			);
			
			$saveAction = new FormAction('SaveNewsEditor', 'Save');
			$saveAction->addExtraClass('radius');

			$actions = new FieldList($saveAction);

			$Form = new Form($this, 'NewsEditorForm', $fields, $actions);
			// $NewsEntry = NewsEntry::get()->filter(array('ID' => $NewsEntryID))->first();
			$Form->loadDataFrom($this->data());
			$f = $Form->Fields()->dataFieldByName('StoryByEmail')->Value();
			// print_r($Form->Fields()->dataFieldByName('URLSegment')->Value());
			$new = $this->getRequest()->getVar('new');
			if($f == NULL && $new==1){
				$Form->Fields()->dataFieldByName('StoryByEmail')->setValue($Member->Email);
			}

			$Form->setName('News Editor Form');
			$Form->setMessage('Custom form message');

			//Return the form
			return $Form;
		}
		
	}

	public function SaveNewsEditor($data, $form) {

		$NewsEntry = NewsEntry::get()->filter(array('ID' => $this->ID))->first();
		// print_r($NewsEntry->toArray());

		// Save into the News dataobject.
		$formData = $form->getData();

		$form->saveInto($NewsEntry);

		/*Preserve this code, for it works the magic of SilverStripe 3 publishing: */
		$NewsEntry->writeToStage('Stage');
		$NewsEntry->publish("Stage", "Live");
		Versioned::set_stage('Live');
		$NewsEntry->write();

		return $this->owner->redirect($this->owner->Link('?saved=1'));
	}

	public function RelatedNewsEntries() {
		$holder = NewsHolder::get()->First();
		$tags = $this->TagsCollection()->sort("RAND()")->limit(6);
		$entries = new ArrayList();

		foreach ($tags as $tag) {
			$taggedEntries = $holder->Entries(5, $tag->Tag)->exclude(array("ID" => $this->ID))->sort("RAND()")->First();
			if ($taggedEntries) {
				foreach ($taggedEntries as $taggedEntry) {
					if ($taggedEntry->ID) {
						$entries->push($taggedEntry);
					}
				}
			}

		}

		if ($entries->count() > 1) {
			$entries->removeDuplicates();
		}
		return $entries;
	}

	public function init() {
		parent::init();

	}

}