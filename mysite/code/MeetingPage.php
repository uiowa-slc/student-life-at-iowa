<?php
class MeetingPage extends Page {

	private static $db = array(
		"Title" => "Varchar(255)",
		"Date" => "Date",
		"Time" => "Text",
		"Type" => "Text",
		"Notes" => "HTMLText",
		"Location" => "Text"
	
	);
	private static $defaults = array(
		"Location" => "University Capitol Centre 2520D"
	);
	
	private static $has_one = array (
		"Agenda" => "File",
		"MeetingNotes" => "File",
		"Legislation1" => "File",
		"Legislation2" => "File"
	
	);

	public function getCMSFields()	{
	
		$fields = parent::getCMSFields();
		$fields->removeFieldFromTab('Root.Main', 'Content');
		$date_field = new DateField("Date");
		$date_field->setConfig("showcalendar", true);
	
		$meetingTypes = array ("General Senate Meeting" => "General Senate Meeting", "Committee Meeting" => "Committee Meeting");
		$fields->addFieldToTab("Root.Main", $date_field);
		$fields->addFieldToTab("Root.Main", new TextField("Time","Time of the Meeting"));
		$fields->addFieldToTab("Root.Main", new TextField("Location","Location of the Meeting"));
		/*$fields->addFieldToTab("Root.Content.Main", new DropdownField("Type","Type of the Meeting", $meetingTypes)); */
		$fields->addFieldToTab("Root.Main", new UploadField("Agenda","Upload Agenda Document"));
		$fields->addFieldToTab("Root.Main", new UploadField("MeetingNotes","Upload Meeting Notes/Minutes Document"));
		$fields->addFieldToTab("Root.Main", new UploadField("Legislation1","Upload Legislation 1 Document"));
		$fields->addFieldToTab("Root.Main", new UploadField("Legislation2","Upload Legislation 2 Document"));
		
		$fields->addFieldToTab("Root.Main", new HTMLEditorField("Notes", "Additional Meeting Notes (optional)"));
		
		return $fields;

	}

	/*function getCMSFields() {
		$fields = parent::getCMSFields();
		
		$fields->addFieldToTab('Root.Content.Main', new ImageField('Image','Group Shot (800x300)'));


		return $fields;
	}*/
		

}

class MeetingPage_Controller extends Page_Controller {
	

   public function init() { 
      parent::init(); 
   }    
    
}
