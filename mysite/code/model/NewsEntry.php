<?php

use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\TagField\TagField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Security\Member;
use SilverStripe\Blog\Model\BlogPost;
use SilverStripe\Core\Environment;

class NewsEntry extends BlogPost {

	private static $db = array(
		'IsFeatured' => 'Boolean',
		'ExternalURL' => 'Varchar(255)',
		'OriginID' => 'Int',
		'OriginalDepartmentID' => 'Int'
	);

	private static $has_one = array(
		"Photo" => Image::class,
		'ListingPhoto' => Image::class,
	);
	private static $many_many = array(
		'Departments' => 'DepartmentPage'
	);
	private static $has_many = array(
	);

	private static $allowed_children = array(

	);
	private static $default_sort = 'PublishDate DESC';
	private static $singular_name = 'News Entry';

	private static $summary_fields = array(
		'Photo.CMSThumbnail' => 'Photo',
		'Title' => 'Title',
		'OriginalDepartmentName' => 'Original Department Website',
		'PublishDate' => 'Date',
		'ExternalURL' => 'External post URL (if applicable)',
	);
	private static $plural_name = 'News Entries';

	private static $show_in_sitetree = false;

	private static $hide_from_cms_tree = true;

	private static $hide_from_hierarchy = true;

	private static $can_be_root = false;

	private static $icon_class = 'font-icon-p-post';
	public function getCMSFields() {
		$f = parent::getCMSFields();

		
		$urlSegment = $f->dataFieldByName('URLSegment');
		// $tagField = $f->fieldByName('blog-admin-sidebar.Tags');
		// $catField = $f->fieldByName('blog-admin-sidebar.Categories');

		// $f->remove($tagField);
		// $f->remove($catField);
		$f->remove($urlSegment);

		$f->addFieldToTab('Root.Main', $urlSegment, 'Content');
		// $f->addFieldToTab('Root.Main', $catField, 'Content');
		// $f->addFieldToTab('Root.Main', $tagField, 'Content');

		$f->renameField('Tags', 'Tags (add "Featured" to feature posts)');
		$f->addFieldToTab('Root.Main', new TextField('ExternalURL', 'External URL for an external post (http:// required)'), "Content");
		//$f->addFieldToTab("Root.Main", new UploadField("Photo", "Photo"), "Content");

		$f->removeByName('Content');
		$f->removeByName('Metadata');
		$f->removeByName('AuthorNames');
		$f->removeByName('Authors');
		$f->removeByName('LayoutType');
		$f->removeByName('LayoutType');

		$biggerContentField = new HTMLEditorField('Content', 'Content');
		$biggerContentField->setRows(60);
		$biggerContentField->addExtraClass('stacked');

		$f->addFieldToTab('Root.Main', $biggerContentField);

		$deptField = TagField::create(
			'Departments',
			'Departments',
			DepartmentPage::get(),
			$this->Departments()
		)->setShouldLazyLoad(true) // tags should be lazy loaded
		 ->setCanCreate(false);

		$f->addFieldToTab('Root.Main', $deptField, 'Content');


		$authorEmailField = TextareaField::create('StoryByEmail', 'Author email addresses (comma separated)')->setRows(3);
		$member = Member::currentUser();

		$f->addFieldToTab('Root.Main', $authorEmailField, 'Content');

		return $f;
	}

	public function setExternalURL($URL) {
		return $this->setField('ExternalURL', $this->validateURL($URL));
	}

	public function Link($action = NULL) {
		if ($Link = $this->ExternalURL) {
			return $Link;
		} else {
			return parent::Link();
		}
	}

	public function HasTag($tagName){
		return $this->Tags()->filter(array('Title' => $tagName))->First();
	}

	public function getOriginalDepartmentName(){
		
		$originalDeptID = $this->OriginalDepartmentID;

		if($originalDeptID){
			$depts = DepartmentPage::get()->map()->toArray();
			if(isset($depts[$originalDeptID])){
				return $depts[$originalDeptID];
			}
		}
	}

	public function createFromArray($array){

		$entry = $this;


		$parent = NewsHolder::get()->filter(array('URLSegment' => 'news'))->First();

		$entry->Title = $array['Title'];

		$content = $array['Content'];

		$contentFiltered = $this->filterAndImportInlineImages($content);

		$entry->Content = $contentFiltered;
		$entry->ParentID = $parent->ID;
		$entry->OriginID = $array['ID'];

		$authors = implode(', ', $array['Authors']);

		$entry->StoryByEmail = $authors;
		$entry->StoryBy = $array['StoryBy'];
		$entry->StoryByTitle = $array['StoryByTitle'];
		$entry->StoryByDept = $array['StoryByDept'];

		$entry->PublishDate = $array['PublishDate'];
		$entry->FeaturedImageURL = $array['FeaturedImageURL'];


		//TODO: Tags import

		$entry->PhotosBy = $array['PhotosBy'];
		$entry->PhotosByEmail = $array['PhotosByEmail'];
		$entry->ExternalURL = $array['ExternalURL'];


		return $entry;

	}
	public function onBeforeWrite() {
	    // check on first write action, aka 'database row creation' (ID-property is not set)
	    if(!$this->isInDb()) {

	    }

	    $authorEmails = $this->StoryByEmail;
	    $authorEmailsArray = explode(',', $authorEmails);

	    $this->Authors()->removeAll();

	    foreach ($authorEmailsArray as $email){
	    	$email = trim($email);
	    	if (!filter_var($email, FILTER_VALIDATE_EMAIL) === false) {
	  			// echo('$email is a valid email address');
	  			if (Member::get()->filter(array('Email' => $email))->First()){
	  				$author = Member::get()->filter(array('Email' => $email))->First();
	  				$this->Authors()->add($author);
	  			}
	  			else{
	  				$userLookup = $this->lookupUser($email);
					if($userLookup){
						$m = new Member();
						$m->FirstName = $userLookup['firstName'];
						$m->Surname = $userLookup['lastName'];
						$m->Email = $email;
						$m->GUID = $userLookup['guid'];
						$m->write();
						$this->Authors()->add($m);
					}
	  			}
			}

	    }
	    // CAUTION: You are required to call the parent-function, otherwise
	    // SilverStripe will not execute the request.
	    parent::onBeforeWrite();
  }
		private function lookupUser($email){
			set_time_limit(30);
			$ldapserver = 'iowa.uiowa.edu';
			$ldapuser      =  Environment::getEnv('AD_SERVICEID_USER'); 
			$ldappass     = Environment::getEnv('AD_SERVICEID_PASS');
			$ldaptree    = "DC=iowa, DC=uiowa, DC=edu";

			$ldapconn = ldap_connect($ldapserver) or die("Could not connect to LDAP server.");

			if($ldapconn) {
			    // binding to ldap server
			    ldap_set_option( $ldapconn, LDAP_OPT_PROTOCOL_VERSION, 3 );
			    ldap_set_option( $ldapconn, LDAP_OPT_REFERRALS, 0 );
			    $ldapbind = ldap_bind($ldapconn, $ldapuser, $ldappass) or die ("Error trying to bind: ".ldap_error($ldapconn));
			    // verify binding
			    if ($ldapbind) {
			    	//do stuff
						$result = ldap_search($ldapconn,$ldaptree, "uiowaADNotificationAddress=".$email, array("uiowaADNotificationAddress=","sn", "givenName", "objectGUID", "memberOf")) or die ("Error in search query: ".ldap_error($ldapconn));
						
			        	$data = ldap_get_entries($ldapconn, $result);

			        	if($data["count"] == 1){
			        		$memberGuid = $this->GUIDtoStr($data[0]["objectguid"][0]);
			        		$resultArray['guid'] = $memberGuid;
			        		$resultArray['firstName'] = $data[0]["givenname"][0];
			        		$resultArray['lastName'] = $data[0]["sn"][0];
			        		return $resultArray;
			        	}

			    } else {
			        echo "LDAP bind failed...";
			    }
			}
			// all done? clean up
			ldap_close($ldapconn);
		}
	public function GUIDtoStr($binary_guid) {
	  $unpacked = unpack('Va/v2b/n2c/Nd', $binary_guid);
	  return sprintf('%08X-%04X-%04X-%04X-%04X%08X', $unpacked['a'], $unpacked['b1'], $unpacked['b2'], $unpacked['c1'], $unpacked['c2'], $unpacked['d']);
	}
}