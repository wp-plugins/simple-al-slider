<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

class Model_BgImages extends Model{
private $table;
public function __construct($db)
  {
  parent::__construct($db);
    $this->table = $this->db->wpdb->prefix."simpleal_images";
  }
public function saveBgData($source, $id)
  {
  $filter = array(array('name', 'image_name', '%s'), array('url', 'url', '%s'),
            array('image', 'image', '%s')
            );
  if (!intval(sanitize_text_field($id)))return false;
  
  $idval = array('id' => intval(sanitize_text_field($id)));
  $idtype = array('%d');
  
   return $this->db->saveData($this->table, $source, $filter, 'update', $idval, $idtype);
  }
public function insBgData($source)
  {
  $unq = uniqid();
  $source['slide_name'] = "Slide #".$unq;
    $source['image_name'] = "Image #".$unq;

  $slide_model = new Model_Slides($this->db);
    $slide_id = $slide_model->insSlideData($source);
    
  if ($slide_id === FALSE) return false;
    $source['slide_id'] = $slide_id;
    
  $filter = array(array('name', 'image_name', '%s'), array('url', 'url', '%s'),
            array('image', 'bgimg', '%s'), array('slide_id', 'slide_id', '%d')
            );

   $image_id = $this->db->saveData($this->table, $source, $filter, 'insert', null, null);
   
   return $slide_id."::".$source['slide_name']."::".$image_id."::".$source['image_name'];
  }
public function getBgInfo($id)
  {
    return $this->db->fetchByVal($this->table, "slide_id", $id, '%d');
  }
public function getBgInfoFirst()
  {
    return $this->db->fetchFirst($this->table);
  }

public function delBgInfo($id)
  {
    return $this->db->deleteRow($this->table, "id", $id, '%d');
  }
public function massDelBgData($chk_ids)
  {
    return $this->db->massDeleteRows($this->table, 'id', $chk_ids);
  }

}
?>