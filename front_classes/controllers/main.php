<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

class Controller_Main extends Sial_Controller{
private $model_main;

public function __construct($model_main)
  {
  parent::__construct();
    $this->model_main = $model_main;
  }
public function execute($proj_id)
  {
    return $this->model_main->get_main_results($proj_id);
  }
public function add_scripts_fronend()
  {
  $helper = new Sial_Helper();
  
    $helper->addStyle("simple_al_main", "css/simple_al_main.css");
    $helper->addStyle("classes_to_apply_source", "css/classes_to_apply_source_split_two_elements.css");
    
    $helper->addScryptfront("simple_al_slider_modernizr", "js/simple_al_slider_modernizr.js");
    $helper->addScryptfront("simple_al_slider_common", "js/simple_al_slider_common.min.js");
    
  }
}