<?php
class StaffPageExtension extends DataExtension {

    private static $db = array(
        
    );
	
    private static $has_one = array(
        
    );

    private static $many_many = array(
        'Departments' => 'DepartmentPage'
    );

    public function updateCMSFields(FieldList $fields)
    {
      $fields->addFieldToTab('Root.Main', TagField::create('Departments', 'Departments', DepartmentPage::get(), $this->owner->Departments())->setShouldLazyLoad(true) , 'Photo');
    }


}
