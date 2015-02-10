<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

class Sial_Users extends Sial_Base{

public function simple_al_slider($atts)
  {
  $front = new Sial_Users_Common();
    return $front->execute($atts['id']);
  }

}
?>