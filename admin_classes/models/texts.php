<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

class Model_Texts extends Model{
private $table;
public function __construct($db)
  {
  parent::__construct($db);
    $this->table = $this->db->wpdb->prefix."simpleal_texts";
  }
public function saveTextData($source, $id)
  {
  $filter = array(array('name', 'name', '%s'), array('url', 'url', '%s'),
            array('text', 'text', '%s'), array('slide_id', 'slide_id', '%d'),
            array('width', 'width', '%d'), array('height', 'height', '%d'),
            array('offsetleft', 'offsetleft', '%d'), array('offsettop', 'offsettop', '%d'),
            array('color', 'color', '%s'), array('bgcolor', 'bgcolor', '%s'),
            array('style', 'style', '%s'), array('size', 'size', '%d'),
            array('classes', 'classes', '%s')
            );
            
  if (!intval(sanitize_text_field($id)))return false;
  
  $idval = array('id' => intval(sanitize_text_field($id)));
  $idtype = array('%d');
  
   return $this->db->saveData($this->table, $source, $filter, 'update', $idval, $idtype);
  }
public function insTextData($source)
  {
  $source['name'] = "Text #".uniqid();
  $filter = array(array('name', 'name', '%s'), array('url', 'url', '%s'),
            array('text', 'text', '%s'), array('slide_id', 'slide_id', '%d'),
            array('width', 'width', '%d'), array('height', 'height', '%d'),
            array('style', 'style', '%s')
            );

   $text_id = $this->db->saveData($this->table, $source, $filter, 'insert', null, null);
   
   return $text_id."::".$source['name'];
  }
public function getTextInfo($id)
  {
    return $this->db->fetchByVal($this->table, "slide_id", $id, '%d');
  }
public function getTextInfoFirst()
  {
    return $this->db->fetchFirst($this->table);
  }

public function delTextInfo($id)
  {
    return $this->db->deleteRow($this->table, "id", $id, '%d');
  }
public function massDelTextData($chk_ids)
  {
    return $this->db->massDeleteRows($this->table, 'id', $chk_ids);
  }

}
?>