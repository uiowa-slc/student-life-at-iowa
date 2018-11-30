<?php

use SilverStripe\Security\Member;
use SilverStripe\Dev\BuildTask;

class MigrateBlogPostClassBuildTask extends BuildTask {

	protected $title = 'Migrate "NewsHolder" and NewsEntry" classes to BlogPost';

	protected $enabled = false;

	function run($request) {

		$blogs = NewsHolder::get();
		$articles = NewsEntry::get();

		foreach ($articles as $article) {

			if (($article->MemberID) && ($article->MemberID != 0)) {
				$articleMember = Member::get_by_id(Member::class, $article->MemberID);
				echo "<li>adding " . $article->Member()->ID . " to " . $article->Title . " as an author</li>";

				//$articleNew = NewsEntry::get_by_id("NewsEntry", $article->ID);
				$article->Authors()->add($articleMember);

			}

			$article->write();

			if ($article->isPublished()) {
				$article->doPublish('Stage', 'Live');
			}

		}

	}

}