<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

class Controller_Slides extends Sial_Controller{
private $model_slides;

public function __construct($model_slides)
  {
  parent::__construct();
    $this->model_slides = $model_slides;
  }

public function saveSlideData()
  {
   if (isset($_POST['save_slide_btn']))
    {
      $this->check('sp_slide');
      
      $this->model_slides->saveSlideData($_POST, $_POST['slide_id']);
      
      return $_POST['slide_id'];
    }
   return false; 
  }
public function saveSlideData_ajax()
  {
   if (isset($_POST['slide_save_ajax']))
    {
      $this->check_ajax('upd_rec', 'nonce');
      
      $id = $this->model_slides->insSlideData($_POST);
      
      echo $id;
    }
   exit(); 
  }
public function getSlideData($id)
  {
      return $this->model_slides->getSlideInfo($id);
  }
public function delSlideData()
  {
  if (isset($_POST['del_slide_btn']))
    {
      $this->check('sp_slide');
      
      return $this->model_slides->delSlideInfo($_POST['slide_id']);
    }
   return false;
  }
public function massActSlideData()
  {
   if (isset($_POST['slide_mass_execution_btn']))
    {
      $this->check('sp_slide_delete_mass');
      
          switch ($_POST['slide_mass_action'])
          {
          case '1' : $this->model_slides->massDelSlideData($_POST['slides_chk_now']); break;
          }

      return true;
     }
   return false;
  }
public function execute($pid)
  {
  //Delete background image
    $this->delSlideData();
        
  //Mass action slide images
    $this->massActSlideData();
        
  //Save background image
    $slideid = $this->saveSlideData();

  //Load backgrounds
    $slide_info = '';//$this->getSlideData($pid);

  return array($slideid, $slide_info);
  }
}
?>