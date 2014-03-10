<?php

class HomePageExtension extends DataExtension {

	public function updateCMSFields(FieldList $f) {
		$f->removeByName("HomePageFeature");

	}

}