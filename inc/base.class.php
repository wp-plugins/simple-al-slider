<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

class Sial_Base{
public $plugin_folder;
protected $trace;

public function __construct()
  {
      $this->plugin_folder = "simple_al_slider";
      $this->trace = true;
  }
public function trace()
  {
    if ($this->trace)
          debug_print_backtrace();
  }
  
public function throwError($message, $code=0)
  {
    throw new Exception($message, $code);
  }
public function microtime_float()
{
    list($usec, $sec) = explode(" ", microtime());
    return ((float)$usec + (float)$sec);
}
public function register_slider_widget()
  {
    register_widget( '\simpleal\Slider_Widget' );
  }

}
?>