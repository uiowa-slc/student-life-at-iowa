<?php
use SilverStripe\Dev\BuildTask;
use SilverStripe\Security\Member;

class MigrateBlogEntryMembersToAuthorsBuildTask extends BuildTask {

	protected $title = 'Migrate the old blog entry member relationship to the new Blog 2.0 Authors';

	protected $enabled = false;

	function run($request) {

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