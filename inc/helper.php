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

            wp_register_script($handle, $currScryptUrl, array('jquery'), '1.0', true);
              wp_localize_script($handle, 'simple_al_WPURLS', array( 'pluginurl' => trailingslashit( plugin_dir_url( __FILE__ ) ) ));
            wp_print_scripts($handle);
        }

  }
public function registerStylefront($handle, $path)
  {
  $currStyleFile = plugin_dir_path( __FILE__ )."/../".$path;
  $currStyleUrl = plugins_url("/../".$path, __FILE__);

        if ( file_exists($currStyleFile) ) {
            wp_register_style($handle, $currStyleUrl);
        }
  }

public function registerScryptfront($handle, $path)
  {
  $currScryptFile = plugin_dir_path( __FILE__ )."/../".$path;
    $currScryptUrl = plugins_url("/../".$path, __FILE__);

        if ( file_exists($currScryptFile) ) {

            wp_register_script($handle, $currScryptUrl, array('jquery'), '1.0', true);
            
        }

  }
public function printStylefront($handle, $path)
  {
  $currStyleFile = plugin_dir_path( __FILE__ )."/../".$path;
  $currStyleUrl = plugins_url("/../".$path, __FILE__);

        if ( file_exists($currStyleFile) ) {
            wp_enqueue_style($handle);
        }
  }

public function printScryptfront($handle, $path)
  {
  $currScryptFile = plugin_dir_path( __FILE__ )."/../".$path;
    $currScryptUrl = plugins_url("/../".$path, __FILE__);

        if ( file_exists($currScryptFile) ) {

              if ( ! function_exists( 'get_plugins' ) ) {
                require_once ABSPATH . 'wp-admin/includes/plugin.php';
              }
              
              $all_plugins = get_plugins();
              
              wp_localize_script($handle, 'simple_al_WPURLS', array( 'pluginurl' => trailingslashit( plugin_dir_url( __FILE__ ) ), 'pluginname' => $all_plugins["simple-al-slider/simple-al-slider.php"]['Name'] ));
              
            wp_print_scripts($handle);
        }

  }
}
?>