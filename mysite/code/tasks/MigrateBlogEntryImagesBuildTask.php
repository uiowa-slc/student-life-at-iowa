<?php

use SilverStripe\Dev\BuildTask;

class MigrateBlogEntryImagesBuildTask extends BuildTask {

	protected $title = 'Migrate the old blog entry image relationships';

	protected $enabled = false;

	function run($request) {

		echo "<h2>Converting News Entries</h2>";
		$articles = NewsEntry::get();
		foreach ($articles as $article) {
			echo "<li>converting " . $article->Title . "'s images to the new format .</li>";
			$article->FeaturedImageID = $article->PhotoID;

			$article->write();

			if ($article->isPublished()) {
				$article->doPublish('Stage', 'Live');
			}

		}

		echo "<h2>Converting Leadership Legacy Entries</h2>";
		$articles = LeadershipLegacyBlogEntry::get();
		foreach ($articles as $article) {
			echo "<li>converting " . $article->Title . "'s images to the new format .</li>";
			$article->FeaturedImageID = $article->EntryPhotoID;

			$article->write();

			if ($article->isPublished()) {
				$article->doPublish('Stage', 'Live');
			}

		}

		echo "<h2>Done</h2>";

	}

}