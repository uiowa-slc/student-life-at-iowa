<?php
use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
class AlertSiteConfigExtension extends DataExtension {

	private static $db = array(
		'AlertText' => 'HTMLText'
	);

	private static $has_one = array(

	);

	private static $defaults = array(

	);

	public function updateCMSFields(FieldList $fields) {


		$fields->addFieldToTab("Root.Alert", new HtmlEditorField( 'AlertText') );


		return $fields;
	}

}