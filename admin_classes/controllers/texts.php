<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

class Controller_Texts extends Sial_Controller{
private $model_texts;

public function __construct($model_texts)
  {
  parent::__construct();
    $this->model_texts = $model_texts;
  }

public function saveTextData()
  {
   if (isset($_POST['save_text_btn']))
    {
      $this->check('sp_text');
      
      $this->model_texts->saveTextData($_POST, $_POST['text_id']);
      
      return $_POST['text_id'];
    }
   return false; 
  }
public function saveTextData_ajax()
  {
   if (isset($_POST['txt_save_ajax']))
    {
      $this->check_ajax('upd_rec_txt', 'nonce');
      
      $result = $this->model_texts->insTextData($_POST);
      
      echo $result;
    }
   exit(); 
  }
public function getTextData($id)
  {
      return $this->model_texts->getTextInfo($id);
  }
public function delTextData()
  {
  if (isset($_POST['del_text_btn']))
    {
      $this->check('sp_text');
      
      return $this->model_texts->delTextInfo($_POST['text_id']);
    }
   return false;
  }
public function massActTextData()
  {
   if (isset($_POST['mass_execution_btn']))
    {
      $this->check('sp_text_delete_mass');
      
          switch ($_POST['mass_action'])
          {
          case '1' : $this->model_texts->massDelTextData($_POST['chk_now']); break;
          }

      return true;
     }
   return false;
  }
public function execute($pid)
  {
  //Delete text
    $this->delTextData();
        
  //Mass action texts
    $this->massActTextData();
        
  //Save text
    $textid = $this->saveTextData();

  //Load text
    $text_info = '';//$this->getTextData($pid);

  return array($textid, $text_info);
  }
}
?>