<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

class Controller_BgImages extends Sial_Controller{
private $model_bgimages;

public function __construct($model_bgimages)
  {
  parent::__construct();
    $this->model_bgimages = $model_bgimages;
  }
function pn_get_attachment_id_from_url( $attachment_url = '' ) {
 
 global $wpdb;
 $attachment_id = false;
 
 // If there is no url, return.
 if ( '' == $attachment_url )
  return;
 
 // Get the upload directory paths
 $upload_dir_paths = wp_upload_dir();
 
 // Make sure the upload path base directory exists in the attachment URL, to verify that we're working with a media library image
 if ( false !== strpos( $attachment_url, $upload_dir_paths['baseurl'] ) ) {
 
  // If this is the URL of an auto-generated thumbnail, get the URL of the original image
  $attachment_url = preg_replace( '/-\d+x\d+(?=\.(jpg|jpeg|png|gif)$)/i', '', $attachment_url );
 
  // Remove the upload path base directory from the attachment URL
  $attachment_url = str_replace( $upload_dir_paths['baseurl'] . '/', '', $attachment_url );
 
  // Finally, run a custom database query to get the attachment ID from the modified attachment URL
  $attachment_id = $wpdb->get_var( $wpdb->prepare( "SELECT wposts.ID FROM $wpdb->posts wposts, $wpdb->postmeta wpostmeta WHERE wposts.ID = wpostmeta.post_id AND wpostmeta.meta_key = '_wp_attached_file' AND wpostmeta.meta_value = '%s' AND wposts.post_type = 'attachment'", $attachment_url ) );
 
 }
  return $attachment_id;
}
public function saveBgData()
  {
   if (isset($_POST['save_all_bgimages_btn']))
    {
      $this->check('sp_all_bgimages');
      
      foreach ($_POST['image'] as $key=>$img)
       {
          $_POST['image_wp_id'][$key] = $this->pn_get_attachment_id_from_url( $img );
       }
      $this->model_bgimages->saveBgData($_POST);
      
      return true;
    }
   elseif (isset($_POST['save_image_btn']))
    {
      $this->check('sp_bg_image');
      
      $this->model_bgimages->saveBgData($_POST);
      
      return true;
    }
   return false; 
  }
public function saveBgData_ajax()
  {
   if (isset($_POST['bg_save_ajax']))
    {
      $this->check_ajax('upd_rec_img', 'nonce');
      
      $result = $this->model_bgimages->insBgData($_POST);
      
      echo $result;
    }
   exit(); 
  }
public function getBgData($id)
  {
      return $this->model_bgimages->getBgInfo($id);
  }
public function delBgData()
  {
  if (isset($_POST['del_image_btn']))
    {
      $this->check('sp_bg_image');
      
      return $this->model_bgimages->delBgInfo($_POST['image_id'][0]);
    }
   return false;
  }
public function massActBgData()
  {
   if (isset($_POST['mass_execution_btn']))
    {
      $this->check('sp_bg_image_delete_mass');
      
          switch ($_POST['mass_action'])
          {
          case '1' : $this->model_bgimages->massDelBgData($_POST['chk_now']); break;
          }

      return true;
     }
   return false;
  }
public function execute($pid)
  {
  //Ajax request
    //add_action("wp_ajax_saveBgData_ajax", array($this, "saveBgData_ajax"));
    
  //Delete background image
    $this->delBgData();
        
  //Mass action bg images
    $this->massActBgData();
        
  //Save background image
    $bgid = $this->saveBgData();

  //Load backgrounds
    $bg_info = '';//$this->getBgData($pid);

  return array($bgid, $bg_info);
  }
}
?>