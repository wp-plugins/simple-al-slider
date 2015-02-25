<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

class Sial_Admin_Common extends Sial_Base{
public $file;
public static $wpdb;

public static function setWpdb()
  {
  global $wpdb;
    self::$wpdb = $wpdb;
  }

public function __construct($file)
  {
  $this->file = $file;
  if (method_exists(get_parent_class(), '__construct'))
      parent::__construct();
      
  }

public function addAdminScryptesAndStyles()
  {
  $helper = new Sial_Helper();
    $helper->addStyle("jquery-ui-css", "css/jquery-ui.css");
    $helper->addStyle("main-css", "css/main.css");
    $helper->addStyle("colorpicker-css", "css/jquery.minicolors.css");

    $helper->addScrypt("bg-file-js", "js/upload_media_bg_files.js");
    $helper->addScrypt("colorpicker-js", "js/jquery.minicolors.min.js");

   if(function_exists( 'wp_enqueue_media' )){
    wp_enqueue_media();
    }else{
    wp_enqueue_style('thickbox');
    wp_enqueue_script('media-upload');
    wp_enqueue_script('thickbox');
    }
  }
public function addMenu()
  {
    $main_page = add_menu_page('Simple AL Slider', 'Simple AL Slider', 'manage_options', 'simpleal_show_about', array('\simpleal\Sial_Admin_Common', 'simpleal_show_about'), plugins_url('images/menu_pict.png', $this->file));
       	
    $submenu = add_submenu_page('simpleal_show_about', 'Simple AL Slider Setup', 'Simple AL Slider Setup', 'manage_options', 'simpleal_slider_show', array('\simpleal\Sial_Admin_Common', 'execute'));
    $submenu2 = add_submenu_page('simpleal_show_about', 'Simple Slider Info', 'Simple Slider Info', 'manage_options', 'simpleal_slider_show_info', array('\simpleal\Sial_Admin_Common', 'show_info'));
    $submenu3 = add_submenu_page('simpleal_show_about', 'Other Products', 'Other Products', 'manage_options', 'simpleal_slider_show_products', array('\simpleal\Sial_Admin_Common', 'simpleal_show_products'));

       	add_action('admin_print_styles-' . $submenu, array('\simpleal\Sial_Admin_Common', 'addAdminScryptesAndStyles'));
       	add_action('admin_print_styles-' . $submenu2, array('\simpleal\Sial_Admin_Common', 'addAdminScryptesAndStyles'));
       	add_action('admin_print_styles-' . $submenu3, array('\simpleal\Sial_Admin_Common', 'addAdminScryptesAndStyles'));
       	add_action('admin_print_styles-' . $main_page, array('\simpleal\Sial_Admin_Common', 'addAdminScryptesAndStyles'));

  }
public function init()
  {
    add_action('admin_menu', array($this, 'addMenu'));
  }
public static function onActivate($file)
  {
  register_activation_hook($file, array( '\simpleal\Sial_Admin_Common', 'sial_install'));
    register_deactivation_hook($file, array( '\simpleal\Sial_Admin_Common', 'sial_uninstall'));
  }
  
public static function sial_install()
  {
  self::setWpdb();
  $wpdb = self::$wpdb;

  $table_slider = $wpdb->prefix.'simpleal_slider';
  $table_slides = $wpdb->prefix.'simpleal_slides';
  $table_images = $wpdb->prefix.'simpleal_images';
  $table_texts = $wpdb->prefix.'simpleal_texts';

//slider
  $sql1 = "CREATE TABLE IF NOT EXISTS `".$table_slider."` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `width` int(5) DEFAULT 0,
  `height` int(5) DEFAULT 0,
  `duration` int(8) DEFAULT 1000,
  `duration_effect` int(8) DEFAULT 100,
  `duration_text_effect` int(8) DEFAULT 200,
  `effect_direction` varchar(100) DEFAULT 'forward',
  `effect` varchar(100) DEFAULT 'default',
  `fullscreen` int(2) DEFAULT 0,
  `apply_classes` text DEFAULT '',
  `settings_buttons` int(3) DEFAULT 1,
  `settings_buttons_top` int(7) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDb  DEFAULT CHARSET=utf8 ;
";


//slides
  $sql2 = "CREATE TABLE IF NOT EXISTS `".$table_slides."` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `slider_id` int(11) unsigned NOT NULL,
  `num` int(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (slider_id) REFERENCES ".$table_slider."(id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDb  DEFAULT CHARSET=utf8 ;
";

//images
  $sql3 = "CREATE TABLE IF NOT EXISTS `".$table_images."` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `image` varchar(250) NOT NULL DEFAULT '',
  `slide_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (slide_id) REFERENCES ".$table_slides."(id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDb  DEFAULT CHARSET=utf8 ;
";

//texts
  $sql4 = "CREATE TABLE IF NOT EXISTS `".$table_texts."` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `text` text NOT NULL DEFAULT '',
  `width` int(5) NOT NULL DEFAULT 0,
  `height` int(5) NOT NULL DEFAULT 0,
  `offsetleft` int(5) NOT NULL DEFAULT 0,
  `offsettop` int(5) NOT NULL DEFAULT 0,
  `color` varchar(50) DEFAULT '#000000',
  `bgcolor` varchar(50) DEFAULT '#ffffff',
  `style` text DEFAULT '',
  `classes` text DEFAULT '',
  `size` int(5) DEFAULT 10,
  `slide_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (slide_id) REFERENCES ".$table_slides."(id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDb  DEFAULT CHARSET=utf8 ;
";

    $wpdb->query($sql1);
    $wpdb->query($sql2);
    $wpdb->query($sql3);
    $wpdb->query($sql4);

  }

public static function sial_uninstall()
  {
  self::setWpdb();
  $wpdb = self::$wpdb;
  
  $table_slider = $wpdb->prefix.'simpleal_slider';
  $table_slides = $wpdb->prefix.'simpleal_slides';
  $table_images = $wpdb->prefix.'simpleal_images';
  $table_texts = $wpdb->prefix.'simpleal_texts';
  
  $sql1 = "DROP TABLE ".$table_slider.";";
  $sql2 = "DROP TABLE ".$table_slides.";";
  $sql3 = "DROP TABLE ".$table_images.";";
  $sql4 = "DROP TABLE ".$table_texts.";";
  
    $wpdb->query($sql4);
    $wpdb->query($sql3);
    $wpdb->query($sql2);
    $wpdb->query($sql1);
  }

public function execute()
  {
  $pid = null;
  if (isset($_GET['pid']))
    $pid_get = $_GET['pid'];
  if (isset($_POST['pid']))
    $pid_post = $_POST['pid'];
  
    if (isset($pid_get))$pid = $pid_get;
    if (isset($pid_post))$pid = $pid_post;
    
    $data = array();
    $data['proj_id'] = $pid;
    
    $db = new Sial_Db();

    $slideController = new Controller_Slides(new Model_Slides($db));
      list($data['slide_id'], $data['slinfo']) = $slideController->execute($data['proj_id']);

    $imageController = new Controller_BgImages(new Model_BgImages($db));
      list($data['image_id'], $data['iminfo']) = $imageController->execute($data['proj_id']);

    $textController = new Controller_Texts(new Model_Texts($db));
      list($data['text_id'], $data['txinfo']) = $textController->execute($data['proj_id']);

    $mainInfoController = new Controller_MainInfo(new Model_MainInfo($db));
      list($data['proj_id'], $data['all_projects'], $data['slider']) = $mainInfoController->execute($data['proj_id']);
      list($data['slider']['slides_info'], $data['slds_pagination'], $data['slides_caption']) = $slideController->makePagination($data['slider']['slides_info']);
    
    $views = new Sial_View(array('admin/header', 
                           array('admin/tab1_header', array('admin/tab1_block1'), 'admin/tab1_footer'),
                           array('admin/tab2_header', array('admin/tab2_block1', 'admin/tab2_block2'), 'admin/tab2_footer'),
                           array('admin/tab3_header', array('admin/tab3_block1', 'admin/tab3_block2'), 'admin/tab3_footer'),
                           array('admin/tab4_header', array('admin/tab4_block1', 'admin/tab4_block2'), 'admin/tab4_footer'),
                           array('admin/tab5_header', array('admin/tab5_block1'), 'admin/tab5_footer'),
                           array('admin/tab6_header', array('admin/tab6_block1'), 'admin/tab6_footer'),
                          'admin/footer'));
    $views->setData($data);
    echo $views->viewTemplates();
  }
public function simpleal_show_about()
  {
    $data = array();

    $views = new Sial_View(array('simple_al_about/header', 
                           array('simple_al_about/page1_header', array('simple_al_about/page1_block1', 'simple_al_about/page1_block2'), 'simple_al_about/page1_footer'),
                          'simple_al_about/footer'));
    $views->setData($data);
    echo $views->viewTemplates();
  }

public function show_info()
  {
    $data = array();

    $views = new Sial_View(array('slider_info/header', 
                           array('slider_info/page1_header', array('slider_info/page1_block1', 'slider_info/page1_block2'), 'slider_info/page1_footer'),
                          'slider_info/footer'));
    $views->setData($data);
    echo $views->viewTemplates();
  }
public function simpleal_show_products()
  {
    $data = array();

    $views = new Sial_View(array('other_products/header', 
                           array('other_products/page1_header', array('other_products/page1_block1'), 'other_products/page1_footer'),
                          'other_products/footer'));
    $views->setData($data);
    echo $views->viewTemplates();
  }

}
?>