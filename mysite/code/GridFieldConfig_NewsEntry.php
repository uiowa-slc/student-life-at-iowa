<?php

/**
 * GridField config necessary for managing a SiteTree object.
 *
 * @package silverstripe
 * @subpackage blog
 *
 * @author Michael Strong <mstrong@silverstripe.org>
 **/
class GridFieldConfig_NewsEntry extends GridFieldConfig_Lumberjack {

	public function __construct($itemsPerPage = null) {
		parent::__construct($itemsPerPage);
		$dataColumns = $this->getComponentByType('GridFieldDataColumns');

		$dataColumns->setDisplayFields(array(
			'Title' => 'Title',
			'Link' => 'URL',
			'LastEdited' => 'Changed',
		));

	}

}