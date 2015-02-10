<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

class Sial_Helper{
public $plugin_dir;

public function __construct()
  {
  //$this->plugin_dir = "/simple_al_slider/";
  }
public function addStyle($handle, $path)
  {
  $currStyleFile = plugin_dir_path( __FILE__ )."/../".$path;
  $currStyleUrl = plugins_url("/../".$path, __FILE__);

        if ( file_exists($currStyleFile) ) {
            wp_register_style($handle, $currStyleUrl);
            wp_enqueue_style($handle);
        }
  }
public function addScrypt($handle, $path)
  {
  $currScryptFile = plugin_dir_path( __FILE__ )."/../".$path;
    $currScryptUrl = plugins_url("/../".$path, __FILE__);

        if ( file_exists($currScryptFile) ) {

            wp_register_script($handle, $currScryptUrl, array('jquery', 'jquery-ui-core', 'jquery-ui-accordion', 'jquery-ui-tabs', 'jquery-ui-button', 'jquery-ui-dialog'), '1.0', true);
              wp_localize_script($handle, 'simple_al_WPURLS', array( 'pluginurl' => trailingslashit( plugin_dir_url( __FILE__ ) ) ));
            wp_print_scripts($handle);
        }

  }
}
?>