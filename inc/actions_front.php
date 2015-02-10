<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

           //Add script to front end
    add_action( 'wp_enqueue_scripts', array('\simpleal\Controller_Main', 'add_scripts_fronend' ));

          //Register Widget for front end
    add_action( 'widgets_init', array('\simpleal\Sial_Users', 'register_slider_widget') );
    
?>