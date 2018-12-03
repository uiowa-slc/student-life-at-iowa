<?php
use SilverStripe\Core\Config\Config;
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\ORM\ArrayList;
use SilverStripe\View\ArrayData;
use SilverStripe\ORM\FieldType\DBDate;
use SilverStripe\ORM\FieldType\DBText;
use SilverStripe\ORM\FieldType\DBHTMLText;

class PageController extends ContentController {

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

	public function TrendingPosts(){

		$timeLimit = date('Y-m-d', strtotime("-6 months"));

		$posts = NewsEntry::get()->filter(array(
			'PublishDate:GreaterThan' => $timeLimit
		))->sort('RAND()');

		return $posts;
	}
	protected function init() {
		parent::init();
		// Note: you should use SS template require tags inside your templates
		// instead of putting Requirements calls here.  However these are
		// included so that our older themes still work
	}

	public function RSSDisplay($numItems = 5, $feedURL = "https://now.uiowa.edu/taxonomy/term/18914/feed") {
		$output = new ArrayList();
		include_once 'simplepie.mini.php';
		$t1 = microtime(true);
		$feed = new SimplePie();
		$feed->set_feed_url($feedURL);
		$feed->enable_cache(false);
		$feed->init();
		if ($items = $feed->get_items(0, $numItems)) {
			foreach ($items as $item) {
				// Cast the Title
				$title = new DBText('Title');
				$title->setValue(html_entity_decode($item->get_title()));
				// Cast the Date
				$date = new DBDate('Date');
				$date->setValue($item->get_date('Y-m-d'));

				$author = new DBText('Author');
				$item_author = $item->get_author();

				if (isset($item_author)) {
					$author->setValue($item_author->get_name());}
				// Cast the description and strip
				$desc = new DBHTMLText('Description');
				$desc->setValue(strip_tags($item->get_description()));

				if ($thumbnail_enclosure = $item->get_enclosure()) {
					$thumbnail_url = new DBText('ThumbnailURL');
					$thumbnail_url->setValue($thumbnail_enclosure->get_thumbnail());

					//legacy enclosure stuff for older sites like CSIL:
					$thumbnail_alt_url = new DBText('ThumbnailAltURL');
					$thumbnail_alt_url->setValue($thumbnail_enclosure->link);
				} else {
					$thumbnail_url = null;
				}

				$output->push(new ArrayData(array(
					'Title' => $title,
					'MenuTitle' => $title,
					'Author' => $author,
					'Date' => $date,
					'Link' => $item->get_link(),
					'Description' => $desc,
					'ThumbnailURL' => $thumbnail_url,
					'ThumbnailAltURL' => $thumbnail_alt_url,
				)));
			}
			return $output;
		}
	}


}
