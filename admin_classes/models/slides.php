<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

class Model_Slides extends Model{
private $table;
public function __construct($db)
  {
  parent::__construct($db);
    $this->table = $this->db->wpdb->prefix."simpleal_slides";
  }
public function saveSlideData($source, $id)
  {
  $filter = array(array('name', 'slide_name', '%s'), array('num', 'num', '%d')
            );
  if (!intval(sanitize_text_field($id)))return false;
  
  $idval = array('id' => intval(sanitize_text_field($id)));
  $idtype = array('%d');
  
   return $this->db->saveData($this->table, $source, $filter, 'update', $idval, $idtype);
  }
public function insSlideData($source)
  {
  $source['num'] = 0;
  //file_put_contents("1111.txt", serialize($source));
  $filter = array(array('name', 'slide_name', '%s'), array('num', 'num', '%d'), array('slider_id', 'slider_id', '%d')
            );

   return $this->db->saveData($this->table, $source, $filter, 'insert', null, null);
  }
public function getSlideInfo($id)
  {
    return $this->db->fetchByVal($this->table, "slider_id", $id, '%d');
  }
public function getSlideInfoFirst()
  {
    return $this->db->fetchFirst($this->table);
  }

public function delSlideInfo($id)
  {
    return $this->db->deleteRow($this->table, "id", $id, '%d');
  }
public function massDelSlideData($chk_ids)
  {
    return $this->db->massDeleteRows($this->table, 'id', $chk_ids);
  }

}
?>