<?php

class StaffTeamExtension extends DataExtension {

	static $db = array(
    
	);

  static $has_one = array(
    'GroupImage' => 'Image',
  );

}