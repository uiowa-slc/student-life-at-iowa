<?php

	class YearInReviewBlogCategoryExtension extends DataExtension {
		private static $db = array(


		);
		private static $has_one = array(


		);
		private static $belongs_many_many = array(
			'YearInReview' => 'YearInReview'
		);

		public function updateCMSFields(FieldList $fields){

		}


	}