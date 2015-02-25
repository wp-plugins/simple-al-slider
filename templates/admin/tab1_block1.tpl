<h2>Main Info</h2>
<?php
if (isset($slider['main_info'])&&(!empty($slider['main_info'])))
{
?>
  <form method="POST" id="main_info_frm_<?php echo $slider['main_info']['sldrid']; ?>" class="main_info_frm" action="<?php echo $_SERVER['PHP_SELF']; ?>?page=simpleal_slider_show&active=0&pid=<?php if (isset($_GET['pid']))echo $_GET['pid']; else echo $proj_id; ?><?php echo (isset($_GET['pagesld'])) ? "&pagesld=".$_GET['pagesld'] : ""; ?>&amp;updated=true">
  <?php
  if (function_exists('wp_nonce_field'))
    {
    wp_nonce_field('sp_main_info');
    }
  ?>

<input type="hidden" name="pid" value="<?php echo $slider['main_info']['sldrid']; ?>">
<div class="left_line">    
      <table class="main_info_table">
  <tr>
  <td>
  Name
  </td>
  <td>
  <input name="name" class="notempty_fld" size="50" value="<?php echo $slider['main_info']['sldrname']; ?>">
  </td>
  </tr>
    <tr>
  <td>
  Width
  </td>
  <td>
  <input name="width" class="digits_fld" size="10" value="<?php echo $slider['main_info']['sldrwidth']; ?>">
  </td>
  </tr>
  <tr>
  <td>
  Height
  </td>
  <td>
  <input name="height" class="digits_fld" size="10" value="<?php echo $slider['main_info']['sldrheight']; ?>">
  </td>
  </tr>
  
  <tr>
  <td>
  Duration
  </td>
  <td>
  <input name="duration" class="digits_fld" size="10" value="<?php echo $slider['main_info']['duration']; ?>">
  </td>
  </tr>

  <tr>
  <td>
  Effect Duration
  </td>
  <td>
  <input name="duration_effect" class="digits_fld" size="10" value="<?php echo $slider['main_info']['duration_effect']; ?>">
  </td>
  </tr>

  <tr>
  <td>
  Text Effect Duration
  </td>
  <td>
  <input name="duration_text_effect" class="digits_fld" size="10" value="<?php echo $slider['main_info']['duration_text_effect']; ?>">
  </td>
  </tr>

  <tr>
  <td>
  Effect Direction
  </td>
  <td>
  <select name="effect_direction">
  <?php $directions = array('forward', 'backward');
  if ((isset($slider['main_info']))&&(isset($slider['main_info']['effect_direction']))) { 
  foreach ($directions as $direct)
    {
  ?>
  <?php if ($slider['main_info']['effect_direction'] == $direct) { ?>
    <option value="<?php echo $direct; ?>" selected="selected"><?php echo $direct; ?></option>
    <?php } else { ?>
    <option value="<?php echo $direct; ?>"><?php echo $direct; ?></option>
    <?php } } } ?>
  </select>
  </td>
  </tr>

  <tr>
  <td>
  Effect
  </td>
  <td>
    <select name="effect">
  <?php $main_effects = array("opacity", "width", "height", "incrop_decrop_vert", "incrop_decrop_horiz", "incrop_decrop4x2", 
  "incrop_decrop7x3", "incrop_decrop10x4", "mpopob_vert", "mpopob_horiz", "mpopob4x2", "mpopob10x4", "decrop_vert", "decrop_horiz",
  "decrop4x2", "decrop7x3", "decrop10x4", "size_rotatex4x2", "size_rotatex10x4", "size_rotatey4x2", "size_rotatey10x4",
  "skew4x2", "skew7x3", "translatex4x2", "translatex10x5", "translatey4x2", "translatey10x5"); ?>
  <?php if ((isset($slider['main_info']))&&(isset($slider['main_info']['effect']))) {
  foreach ($main_effects as $me)
  {
   ?>
  <?php if ($slider['main_info']['effect'] == $me) { ?>
    <option value="<?php echo $me; ?>" selected="selected"><?php echo $me; ?></option>
    <?php } else { ?>
    <option value="<?php echo $me; ?>"><?php echo $me; ?></option>
    <?php } } } ?>
  </select>
  </td>
  </tr>

  <tr>
  <td>
  Full Screen
  </td>
  <td>
  <input type="checkbox" name="fullscreen" size="10" value="1" <?php if ($slider['main_info']['fullscreen'] == 1)echo " checked='checked'"; ?>>
  </td>
  </tr>
  
  </table>
  </div>
  <div class="left_line">
  <table>
    <tr>
  <td>
  Apply Classes
  </td>
  <td>
  <textarea name="apply_classes" style='width:400px;height:200px;'>
    <?php if (isset($slider['main_info'])&&(isset($slider['main_info']['apply_classes'])))echo stripslashes($slider['main_info']['apply_classes']); ?>
  </textarea>
  </td>
  </tr>
</table>
  </div>
  <div class="clear_line"></div>
    <input type="submit" value=" Save main info " name="main_info_save_btn">
  </form>
<?php
}
?>