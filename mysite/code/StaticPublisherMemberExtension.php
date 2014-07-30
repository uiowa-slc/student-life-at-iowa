<?php
/**
 * Adds additional fields to the Member object
 *
 */
class StaticPublisherMemberExtension extends DataExtension implements StaticallyPublishable {

	public function urlsToCache() {
		return array("authors/" => 0);
	}

}