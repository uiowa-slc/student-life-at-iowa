<?php

/**
 * Class Lumberjack
 *
 * Add this classes to SiteTree classes which children should be hidden.
 *
 * @package silverstripe
 * @subpackage lumberjack
 *
 * @author Michael Strong <mstrong@silverstripe.org>
 */
class NewsEntryLumberjack extends Lumberjack {

	/**
	 * This is responsible for adding the child pages tab and gridfield.
	 *
	 * @param FieldList $fields
	 */
	public function getCMSFields(FieldList $fields) {
		$excluded = $this->owner->getExcludedSiteTreeClassNames();
		if (!empty($excluded)) {
			$pages = SiteTree::get()->filter(array(
				'ParentID' => $this->owner->ID,
				'ClassName' => $excluded,
			));
			$gridField = new GridField(
				"BlogPosts",
				$this->getLumberjackTitle(),
				$pages,
				$this->getLumberjackGridFieldConfig()
			);

			$tab = new Tab('BlogPosts', $this->getLumberjackTitle(), $gridField);
			$fields->insertAfter($tab, 'Main');
		}
	}

}
