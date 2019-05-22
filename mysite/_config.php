<?php

use SilverStripe\Security\PasswordValidator;
use SilverStripe\Security\Member;
use SilverStripe\Control\Director;
use SilverStripe\Forms\HTMLEditor\TinyMCEConfig;
// remove PasswordValidator for SilverStripe 5.0
$validator = new PasswordValidator();

$validator->minLength(8);
$validator->checkHistoricalPasswords(6);
Member::set_password_validator($validator);

if(Director::isLive()) {
	Director::forceSSL();
}

HomePage::add_extension('SlHomePageExtension');



TinyMCEConfig::get('cms')
    ->addButtonsToLine(1, 'styleselect')
    ->setOptions([
        'importcss_append' => true,
         'block_formats'=>'Paragraph=p;Heading 2=h2;Heading 3=h3;Heading 4=h4;Heading 5=h5;Heading 6=h6;Address=address;Pre=pre'
    ]);