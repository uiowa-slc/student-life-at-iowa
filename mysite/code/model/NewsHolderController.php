<?php

use SilverStripe\Blog\Model\BlogController;
use SilverStripe\Control\Email\Email;
use SilverStripe\Control\RSS\RSSFeed;
use SilverStripe\ORM\ArrayList;
use SilverStripe\ORM\PaginatedList;
use SilverStripe\Security\Member;
use SilverStripe\View\ArrayData;

class NewsHolderController extends BlogController {

	private static $allowed_actions = array(
		'profilerss',
		'rss',
		'json',
		'department',
		//Feeds:
		'feed',
		'index',
		'departmentListFeed',
		'departmentNewsFeed',
		'departmentNewsPost',
		'departmentNewsFeedByCat',
		'departmentNewsFeedByTag',
		'departmentNewsFeedByAuthor',
		'authorInfo',
	);
	private static $url_handlers = array(
		'profile/$URLSegment!/rss' => 'profilerss',
		'feed//' => 'feed',
		'department//$ID' => 'department',
		'departmentListFeed' => 'departmentListFeed',
		'departmentNewsFeed//$ID' => 'departmentNewsFeed',
		'departmentNewsFeedByTag//$ID/$Tag' => 'departmentNewsFeedByTag',
		'departmentNewsFeedByCat//$ID/$Cat' => 'departmentNewsFeedByCat',
		'departmentNewsFeedByAuthor//$ID/$AuthorID' => 'departmentNewsFeedByAuthor',
		'departmentNewsPost//$ID' => 'departmentNewsPost',
		'authorInfo//$ID' => 'authorInfo',
	);

	/**
	 * Renders the blog posts for a given dept.
	 *
	 * @return null|SS_HTTPResponse
	 */
	public function department() {
		$deptID = $this->getRequest()->param('ID');
		$dept = DepartmentPage::get()->filter(array('URLSegment' => $deptID))->First();

		if ($dept) {
			$posts = new PaginatedList($dept->NewsEntries(), $this->getRequest());
			$posts->setPageLength(10);

			$this->blogPosts = $posts;

			$data = new ArrayData(array(
				'CurrentDepartment' => $dept,
				'PaginatedList' => $posts,
			));

			//print_r($dept->Title);

			return $this->customise($data)->renderWith(array('NewsHolder_department', 'Page'));
		}

		$this->httpError(404, 'Not Found');

		return null;
	}

	public function authorInfo() {
		$authorID = $this->getRequest()->param('ID');
		$author = Member::get()->byID($authorID);

		if ($author) {
			$authorArray = array(
				'Name' => $author->Name,
				'ID' => $author->ID,
				'Email' => $author->Email,
			);
			$this->getResponse()->addHeader("Content-Type", "application/json");
			return json_encode($authorArray);
		}

		return $this->httpError(404);
	}
	public function departmentListFeed() {
		$depts = DepartmentPage::get();
		$deptArray = array();

		foreach ($depts as $dept) {
			array_push($deptArray,
				array(
					'ID' => $dept->ID,
					'Title' => $dept->Title,
				)
			);
		}
		$this->getResponse()->addHeader("Content-Type", "application/json");
		return json_encode($deptArray);
	}

	public function feed() {
		$postArray = array();
		$dataRecord = $this->dataRecord;
		$allPosts = $dataRecord->getBlogPosts();
		$postCount = $allPosts->Count();
		$posts = new PaginatedList($allPosts, $this->getRequest());

		$posts->setPageLength(10);

		foreach ($posts as $post) {
			array_push($postArray, $post->toFeedArray());
		}
		$this->getResponse()->addHeader("Content-Type", "application/json");

		$feedArray = array(
			'meta' => array(
				'postCount' => $postCount,
			),
			'posts' => $postArray,
		);

		return json_encode($feedArray);
	}

	public function departmentNewsFeed() {
		$postArray = array();
		$deptID = $this->getRequest()->param('ID');
		$dept = DepartmentPage::get()->byID($deptID);
		//if no dept found, just return all posts
		if ((!$dept) || ($deptID == 0)) {
			$dataRecord = $this->dataRecord;
			$allPosts = $dataRecord->getBlogPosts();
			$postCount = $allPosts->Count();
			$posts = new PaginatedList($allPosts, $this->getRequest());
		} else {

			$postCount = $dept->NewsEntries()->Count();
			$posts = new PaginatedList($dept->NewsEntries(), $this->getRequest());

		}
		$posts->setPageLength(10);

		foreach ($posts as $post) {
			array_push($postArray, $post->toFeedArray());
		}
		$this->getResponse()->addHeader("Content-Type", "application/json");

		$feedArray = array(
			'meta' => array(
				'postCount' => $postCount,
			),
			'posts' => $postArray,
		);

		return json_encode($feedArray);

	}

	//Only works with category ID right now, TODO: match NewsFeedByTag with tag string
	public function departmentNewsFeedByCat() {
		$postArray = array();
		$deptID = $this->getRequest()->param('ID');

		$catQuery = $this->getRequest()->param('Cat');
		$catQuery = urldecode($catQuery);

		if ($deptID != 0) {
			$dept = DepartmentPage::get()->byID($deptID);
			if (!$dept) {
				$this->httpError(404);
			}

			if ($dept->NewsEntriesByCat($catQuery)) {

				$postCount = $dept->NewsEntriesByCat($catQuery)->Count();
				$posts = new PaginatedList($dept->NewsEntriesByCat($catQuery), $this->getRequest());
			} else {
				$posts = new ArrayList();
				$postCount = 0;
			}

			//If the department passed along via the URL is 0, we get all posts from a cat in this blog.
		} else {
			$cat = $this->cats()->filter(array('Title' => $catQuery))->First();
			if (!$cat) {
				$this->httpError(404);
			}

			$postCount = $cat->BlogPosts()->Count();
			$posts = new PaginatedList($cat->BlogPosts(), $this->getRequest());
		}

		foreach ($posts as $post) {
			array_push($postArray, $post->toFeedArray());
		}
		$this->getResponse()->addHeader("Content-Type", "application/json");

		$feedArray = array(
			'meta' => array(
				'postCount' => $postCount,
			),
			'posts' => $postArray,
		);

		return json_encode($feedArray);

	}
	public function departmentNewsFeedByTag() {
		$postArray = array();
		$deptID = $this->getRequest()->param('ID');

		$tagQuery = $this->getRequest()->param('Tag');
		$tagQuery = urldecode($tagQuery);

		if ($deptID != 0) {
			$dept = DepartmentPage::get()->byID($deptID);
			if (!$dept) {
				$this->httpError(404);
			}

			if ($dept->NewsEntriesByTag($tagQuery)) {
				$postCount = $dept->NewsEntriesByTag($tagQuery)->Count();
				$posts = new PaginatedList($dept->NewsEntriesByTag($tagQuery), $this->getRequest());
			} else {
				$posts = new ArrayList();
				$postCount = 0;
			}

			//If the department passed along via the URL is 0, we get all posts from a tag in this blog.
		} else {
			$tag = $this->Tags()->filter(array('Title' => $tagQuery))->First();
			if (!$tag) {
				$this->httpError(404);
			}

			$postCount = $tag->BlogPosts()->Count();
			$posts = new PaginatedList($tag->BlogPosts(), $this->getRequest());
		}

		foreach ($posts as $post) {
			array_push($postArray, $post->toFeedArray());
		}
		$this->getResponse()->addHeader("Content-Type", "application/json");

		$feedArray = array(
			'meta' => array(
				'postCount' => $postCount,
			),
			'posts' => $postArray,
		);

		return json_encode($feedArray);

	}
	public function departmentNewsFeedByAuthor() {
		$postArray = array();
		$deptID = $this->getRequest()->param('ID');
		$dept = DepartmentPage::get()->byID($deptID);
		$authorID = $this->getRequest()->param('AuthorID');

		if (!$dept) {
			$this->httpError(404);
		}

		if (!Member::get()->byID($authorID)) {
			$this->httpError(404);
		}

		$postCount = $dept->NewsEntriesByAuthor($authorID)->Count();

		$posts = new PaginatedList($dept->NewsEntriesByAuthor($authorID), $this->getRequest());
		$posts->setPageLength(10);

		foreach ($posts as $post) {
			array_push($postArray, $post->toFeedArray());
		}
		$this->getResponse()->addHeader("Content-Type", "application/json");

		$feedArray = array(
			'meta' => array(
				'postCount' => $postCount,
			),
			'posts' => $postArray,
		);

		return json_encode($feedArray);

	}
	public function departmentNewsPost() {
		$id = $this->getRequest()->param('ID');
		$post = NewsEntry::get()->filter(array('URLSegment' => $id))->First();

		if ($post) {
			$postArray = $post->toFeedArray();

			$this->getResponse()->addHeader("Content-Type", "application/json");
			return json_encode($postArray);
		} else {
			$this->httpError(404);
		}

	}
	public function rss() {
		global $project_name;
		$blogName = $this->Title;
		$altBlogName = $project_name . ' blog';
		$filters = array();
		$getVars = $this->request->getVars();

		if (isset($getVars['member'])) {
			$memberId = $getVars['member'];

			//$filters['Member.Email'] = $memberId;

			$member = Member::get()->filter(array('Email' => $memberId))->First();

			if ($member) {
				$entries = $member->BlogPosts(999);
				if ($entries->First()) {
					$rss = new RSSFeed($entries, $this->Link(), ($blogName ? $blogName : $altBlogName), "", "Title", "RSSContent");
					return $rss->outputToBrowser();
				}
			}
		} else {
			return parent::rss();
		}

	}

	public function profilerss() {
		$urlSegment = $this->request->param('URLSegment');

		if (filter_var($urlSegment, FILTER_VALIDATE_EMAIL)) {
			$profile = Member::get()->filter(Email::class, $urlSegment)->first();
		} else {
			$profile = $this->getCurrentProfile();
		}

		if ($profile) {
			$rss = new RSSFeed($profile->BlogPosts(), $this->Link(), $this->MetaTitle, $this->MetaDescription);
			return $rss->outputToBrowser();
		}

	}

	public function PaginatedNewsEntries($pageLength = 12) {
		$entries = $this->BlogEntries();
		return $entries->setPageLength($pageLength);
	}

}
