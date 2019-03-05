<?php

use SilverStripe\ORM\ArrayList;

class YearInReviewController extends PageController {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */
	private static $allowed_actions = array(
	);

	public function init() {
		parent::init();

	}

	public function Entries(){

		$entries = new ArrayList();

		switch ($this->FilterBy){

			case 'Tag':
				$tags = $this->Tags();
				foreach($tags as $tag){
					$tagEntries = $tag->BlogPosts();
					$entries->merge($tagEntries);
				}
				break;

			case 'Category':
				$cats = $this->Categories();
				foreach($cats as $cat){
					$catEntries = $cat->BlogPosts();
					$entries->merge($catEntries);
				}
				break;
		}

		switch($this->SortBy){
			case 'Random':
				foreach($entries as $entry) {
				    $entry->__Sort = mt_rand();
				}
				$entries = $entries->sort('__Sort');
				break;

			case 'Featured':
				$entries = $entries->sort('IsFeatured, PublishDate DESC');
				break;
			default:
				$entries = $entries->sort('PublishDate DESC');
				break;
		}

		return $entries;
	}
}