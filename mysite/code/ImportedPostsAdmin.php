<?php

use SilverStripe\Admin\ModelAdmin;

class ImportedPostsAdmin extends ModelAdmin {

    private static $managed_models = array(
        'NewsEntry'
    );

    private static $url_segment = 'imported-posts';

    private static $menu_title = 'Imported Posts';

    public function getList() {
        $list = parent::getList();

        // Always limit by model class, in case you're managing multiple
        if($this->modelClass == 'NewsEntry') {
            $list = $list->exclude('OriginalDepartmentID', '0');
        }

        return $list;
    }
}