<?php

use SilverStripe\Control\Director;
use SilverStripe\Security\Member;
use SilverStripe\Security\PasswordValidator;

// remove PasswordValidator for SilverStripe 5.0
$validator = new PasswordValidator();

$validator->minLength(8);
$validator->checkHistoricalPasswords(6);
Member::set_password_validator($validator);

if (Director::isLive()) {
	Director::forceSSL();
}

// URLSegmentFilter->setReplacements([
// 	'/&amp;/u' => '-and-',
// 	'/&/u' => '-and-',
// 	'/\s|\+/u' => '-', // remove whitespace/plus
// 	'/[_.]+/u' => '-', // underscores and dots to dashes
// 	'/[^A-Za-z0-9\-]+/u' => '', // remove non-ASCII chars, only allow alphanumeric and dashes
// 	'/[\/\?=#:]+/u' => '-', // remove forward slashes, question marks, equal signs, hashes and colons in case multibyte is allowed (and non-ASCII chars aren't removed)
// 	'/[\-]{2,}/u' => '-', // remove duplicate dashes
// 	'/^[\-]+/u' => '', // Remove all leading dashes
// 	'/[\-]+$/u' => '', // Remove all trailing dashes
// ]);

HomePage::add_extension('SlHomePageExtension');

// TinyMCEConfig::get('cms')
//     ->addButtonsToLine(1, 'styleselect')
//     ->setOptions([
//         'importcss_append' => true,
//          'block_formats'=>'Paragraph=p;Heading 2=h2;Heading 3=h3;Heading 4=h4;Heading 5=h5;Heading 6=h6;Address=address;Pre=pre'
//     ]);
