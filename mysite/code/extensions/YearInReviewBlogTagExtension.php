<?php

class YearInReviewBlogTagExtension extends DataExtension {

	private static $db = array(

	);

	private static $has_one = array(

	);

	private static $belongs_many_many = array(
		'YearInReview' => 'YearInReview'
	);

	private static $summary_fields = array(

	);

}
