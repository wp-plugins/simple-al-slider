<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

class Controller_MainInfo extends Sial_Controller{
private $model_maininfo;
  private $main_masks_path;

public function __construct($model_maininfo)
  {
  parent::__construct();
    $this->model_maininfo = $model_maininfo;
              $this->main_masks_path = plugin_dir_path( __FILE__ )."../../templates/front_masks/";
  }

public function check_mask_files($dir)
  {
  $res = array("none");

          $tmpls = glob($dir . '*');
          foreach ($tmpls as $tmpl)
          {
            if (is_file($tmpl))
            $res[] = basename($tmpl);
          }
    return $res;
  }

public function getAllMaskFiles()
  {
    $main_files = $this->check_mask_files($this->main_masks_path);
    
    return $main_files;
  }

public function saveMainData()
  {
   if (isset($_POST['main_info_save_btn']))
    {
      $this->check('sp_main_info');
      
      $this->model_maininfo->saveMainData($_POST, $_POST['pid']);
      
      return $_POST['pid'];
    }
   return false; 
  }

public function saveSettingsButtons()
  {
   if (isset($_POST['settings_buttons_save_btn']))
    {
      $this->check('settings_buttons');
      
      $this->model_maininfo->saveSettingsButtons($_POST, $_POST['pid']);
      
      return $_POST['pid'];
    }
   return false; 
  }

public function saveSettingsIndicators()
  {
   if (isset($_POST['settings_indicators_save_btn']))
    {
      $this->check('settings_indicators');
      
      $this->model_maininfo->saveSettingsIndicators($_POST, $_POST['pid']);
      
      return $_POST['pid'];
    }
   return false; 
  }

public function createProject()
  {
   if (isset($_POST['new_project_btn']))
    {
      $this->check('sp_project_name');
      
      $pid = $this->model_maininfo->createProject($_POST['new_project_name']);

      return $pid;
    }
   return false; 
  }
public function getProjects()
  {
      return $this->model_maininfo->getProjects();
  }
public function filterInputData($data)
  {
  $main = array();

    foreach ($data as $dt)
      {
      $fl = false;
      $fl2 = false;
      $fl3 = false;
          foreach ($dt as $key=>$val)
            {
              if ($key == 'delim1')$fl = true;
              if ($key == 'delim2'){$fl2 = true; $fl=false;}
              if ($key == 'delim3'){$fl3 = true;$fl2 = false; $fl=false;}

              if (isset($val))
              if ($fl)
                {
                  $main['slides_info'][$dt->sldsid][$key] = $val;
                }
                elseif (($fl2)&&(isset($dt->imgid)))
                {
                  $main['slides_info'][$dt->sldsid]['imgs'][$dt->imgid][$key] = $val;
                }
                elseif (($fl3)&&(isset($dt->txtid)))
                {
                  $main['slides_info'][$dt->sldsid]['texts'][$dt->txtid][$key] = $val;
                }
                else
                {
                  $main['main_info'][$key] = $val;
                }
            }
      }
   return $main;
  }
public function getMainInfo($id)
  {
      return $this->filterInputData($this->model_maininfo->getMainInfo($id));
  }
public function delProject()
  {
  if (isset($_POST['del_proj_btn']))
    {
      $this->check('sp_project_del');
      
      $this->model_maininfo->delMainInfo($_POST['proj_id']);
      return true;
    }
   return false;
  }
public function swapBgDataWithThumbsData($main_data)
  {
  if (is_array($main_data))
  foreach ($main_data['slides_info'] as $msi_key=>$main_si)
    {
  if (is_array($main_si['imgs']))
    foreach ($main_si['imgs'] as $msii_key=>$main_sii)
      {
        if ($main_sii['image_wp_id'] == 0)
        {
          $main_data['slides_info'][$msi_key]['imgs'][$msii_key]['image_wp_id'] = $this->pn_get_attachment_id_from_url($main_sii['imgimage']);
          $main_data['slides_info'][$msi_key]['imgs'][$msii_key]['image_thumb'] = wp_get_attachment_image( $main_data['slides_info'][$msi_key]['imgs'][$msii_key]['image_wp_id'], 'thumbnail' );
        }
        else
        {
          $main_data['slides_info'][$msi_key]['imgs'][$msii_key]['image_thumb'] = wp_get_attachment_image( $main_sii['image_wp_id'], 'thumbnail' );
        }
      }
    }
    
  if (is_array($main_data))
  foreach ($main_data['slides_info'] as $msi_key=>$main_si)
    {
  if (is_array($main_si['texts']))
    foreach ($main_si['texts'] as $msii_key=>$main_sii)
      {
        if ($main_sii['image_elem_wp_id'] == 0)
        {
          $main_data['slides_info'][$msi_key]['texts'][$msii_key]['image_elem_wp_id'] = $this->pn_get_attachment_id_from_url($main_sii['txtimage']);
           $main_data['slides_info'][$msi_key]['texts'][$msii_key]['txtimage_thumb'] = wp_get_attachment_image( $main_data['slides_info'][$msi_key]['texts'][$msii_key]['image_elem_wp_id'], 'thumbnail' );
        }
        else
        {
          $main_data['slides_info'][$msi_key]['texts'][$msii_key]['txtimage_thumb'] = wp_get_attachment_image( $main_sii['image_elem_wp_id'], 'thumbnail' );
        }
      }
    }
  return $main_data;
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

public function execute($pid)
  {
  //Load Mask files
  $masks = $this->getAllMaskFiles();

    //Delete project
    if ($this->delProject())
                  $pid = null;
    
    //Add new project
    $swp_id = $this->createProject();
  
    if (!$swp_id)$proj_id = $pid;
      else
      $proj_id = $swp_id;

   //Save buttons settings
    $proj_id2 = $this->saveSettingsButtons();

   //Save indicators settings
    $proj_id2 = $this->saveSettingsIndicators();
    
  //Add new main record - action
    $swp2_id = $this->saveMainData();

    if ((!isset($proj_id))&&(isset($swp2_id)))$proj_id = $swp2_id;
    
  //get first project data
    $all_projects = $this->getProjects();

  //Load main - action
    if ((!isset($proj_id))||(!$proj_id))$proj_id = $all_projects[0]->id;
    $slider = $this->getMainInfo($proj_id);
  
  //Swap images with their thumbnails
    $slider = $this->swapBgDataWithThumbsData($slider);
  
    return array($proj_id, $all_projects, $slider, $masks);
  }
}
?>