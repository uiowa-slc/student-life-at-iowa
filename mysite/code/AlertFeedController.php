<?php
use Silverstripe\SiteConfig\SiteConfig;
use SilverStripe\CMS\Controllers\ContentController;

class AlertFeedController extends ContentController
{

    public function index()
    {


        $config = SiteConfig::current_site_config(); 



        $textArray = array();

        $this->getResponse()->addHeader("Content-Type", "application/json");

        $text = $config->AlertText;


        if($text != ''){
            $textArray[] = $text;
        }

        

        return json_encode($textArray);
    }
}