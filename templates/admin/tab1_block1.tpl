<div class="panel panel-primary">
<div class="panel-heading">
        <h3 class="panel-title">Main Info</h3>
      </div>
<div class="panel-body">
  <div>
Background Images &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button class="set_backgrounds">Upload</button>
  </div>

<?php
if (isset($slider['main_info'])&&(!empty($slider['main_info'])))
{
?>
  <form method="POST" id="main_info_frm_<?php echo $slider['main_info']['sldrid']; ?>" class="form-inline main_info_frm" action="<?php echo $_SERVER['PHP_SELF']; ?>?page=simpleal_slider_show&active=0&pid=<?php if (isset($_GET['pid']))echo $_GET['pid']; else echo $proj_id; ?><?php echo (isset($_GET['pagesld'])) ? "&pagesld=".$_GET['pagesld'] : ""; ?>&amp;updated=true">
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
  <input name="name" class="form-control notempty_fld" size="50" value="<?php echo $slider['main_info']['sldrname']; ?>">
  </td>
  </tr>
    <tr>
  <td>
  Width
  </td>
  <td>
  <input name="width" class="form-control digits_fld" size="10" value="<?php echo $slider['main_info']['sldrwidth']; ?>">
  </td>
  </tr>
  <tr>
  <td>
  Height
  </td>
  <td>
  <input name="height" class="form-control digits_fld" size="10" value="<?php echo $slider['main_info']['sldrheight']; ?>">
  </td>
  </tr>
  
  <tr>
  <td>
  Duration
  </td>
  <td>
  <input name="duration" class="form-control digits_fld" size="10" value="<?php echo $slider['main_info']['duration']; ?>">
  </td>
  </tr>

  <tr>
  <td>
  Effect Duration
  </td>
  <td>
  <input name="duration_effect" class="form-control digits_fld" size="10" value="<?php echo $slider['main_info']['duration_effect']; ?>">
  </td>
  </tr>

  <tr>
  <td>
  Elements Effect Duration
  </td>
  <td>
  <input name="duration_text_effect" class="form-control digits_fld" size="10" value="<?php echo $slider['main_info']['duration_text_effect']; ?>">
  </td>
  </tr>

  <tr>
  <td>
  Effect Direction
  </td>
  <td>
  <select name="effect_direction" class="form-control">
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
    <select name="effect" class="form-control">
  <?php
   $main_effects = array("opacity", "width", "height", "incrop_decrop_vert", "incrop_decrop_horiz", "incrop_decrop4x2", 
  "incrop_decrop7x3", "incrop_decrop10x4", "mpopob_vert", "mpopob_horiz", "mpopob4x2", "mpopob10x4", "decrop_vert", "decrop_horiz",
  "decrop4x2", "decrop7x3", "decrop10x4", "size_rotatex4x2", "size_rotatex10x4", "size_rotatey4x2", "size_rotatey10x4",
  "skew4x2", "skew7x3", "translatex4x2", "translatex10x5", "translatey4x2", "translatey10x5",
  "rotatex_vert_10x1_back", "rotatex_vert_10x1_forw","rotatex_vert_10x1_hide_back", "rotatex_vert_10x1_hide_forw",
  "left_top_corner_superposition", "left_second_superposition", "left_top_line_superposition", "mixed_top_superposition", 
  "top_horiz_superposition", "left_vert_superposition", "right_vert_superposition", "bottom_horiz_superposition", 
  "center_horiz_superposition", "right_bottom_corner_superposition", "left_second_superposition_one_way", 
  "center_horiz_superposition_one_way", "left_vert_superposition_one_way",
  "traditional_horiz_move_2_parts", "traditional_horiz_move_8_parts", "traditional_vert_move_8_parts",
  "traditional_horiz_move_vert_2_parts", "traditional_vert_move_horiz_2_parts",
  "sequence_horiz_up", "sequence_horiz_up_back", "sequence_horiz_up_down_10x1_forw", "sequence_horiz_up_down_10x1_back",
  "sequence_horiz_down", "sequence_horiz_down_back", "sequence_horiz_right_down", "sequence_horiz_right_down_back",
  "sequence_horiz_right_up", "sequence_horiz_right_up_back", "sequence_opacity_forw_move", "sequence_opacity_back_move",
  "sequence_opacity_forw", "sequence_opacity_back", "sequence_horiz_opacity_forw_move", "sequence_horiz_opacity_back_move",
  "sequence_horiz_opacity_forw", "sequence_horiz_opacity_back", "sequence_horiz_opacity_forw_last_move",
  "sequence_opacity_forw_horiz_lines", "sequence_opacity_back_horiz_lines",
  "double_rotatex_vert_10x1", "double_rotatex_vert_10x1_hide", "double_corner_superposition",
  "double_horiz_superposition", "double_vert_superposition", "double_sequence_horiz",
  "double_sequence_horiz_up_down", "double_sequence_horiz_down", "double_sequence_horiz_right_down",
  "double_sequence_horiz_right_up", "double_sequence_opacity_move", "double_sequence_opacity",
  "double_sequence_horiz_opacity_move", "double_sequence_horiz_opacity", "double_sequence_opacity_horiz_lines"
  ); 
  ?>
  <?php if ((isset($slider['main_info']))&&(isset($slider['main_info']['effect']))) {
  foreach ($main_effects as $me)
  {
   ?>
    <option value="<?php echo $me; ?>"><?php echo $me; ?></option>
    <?php } } ?>
  </select>
  <button name="apply_effect_name">apply effect</button>
  <div class="applied_effects">
  <?php if ((isset($slider['main_info']))&&(isset($slider['main_info']['effect']))) {
  $applied_effects = explode("***", $slider['main_info']['effect']);
  foreach ($applied_effects as $ae)
  {
   ?>
  <?php if (in_array($ae, $main_effects)) { ?>
    <div class='effect_element' style='line-height:30px;'><img src='<?php echo plugins_url("../../images/close.png", __FILE__); ?>' class='close_effect_elem' style='cursor:pointer;'>&nbsp;&nbsp;&nbsp;<?php echo $ae; ?><input type='hidden' name='effects_names[]' value='<?php echo $ae; ?>'></div>
    <?php } 
    }
  } ?>
  
  </div>
  </td>
  </tr>
<?php
  $full_srcw = array(0 => "Default", 1 => "Full Screen", 2 => "Full Width");
  foreach ($full_srcw as $key=>$full)
    {
?>
  <tr>
  <td>
  <?php echo $full; ?>
  </td>
  <td>
  <input type="radio" class="form-control" name="fullscreen" size="10" value="<?php echo $key; ?>" <?php if ($slider['main_info']['fullscreen'] == $key)echo " checked='checked'"; ?>>
  </td>
  </tr>
  <?php
    }
  ?>
  </table>
  </div>
  <div class="left_line">
  <table>
  
      <tr>
      <td>
      Mask
      </td>
      <td>
      <select name="mask_file" class="form-control">
      <?php
      if ((isset($masks))&&(isset($slider['main_info']['mask_file'])))
      foreach ($masks as $mask)
        {
          if ($mask == $slider['main_info']['mask_file'])
            echo "<option value='".sanitize_text_field($mask)."' selected>".sanitize_text_field($mask)."</option>";
            else
            echo "<option value='".sanitize_text_field($mask)."'>".sanitize_text_field($mask)."</option>";
        }
      ?>
      </select>
      </td>
      </tr>

    <tr>
  <td>
  Apply Classes
  </td>
  <td>
  <textarea name="apply_classes" style='width:400px;height:200px;' class="form-control">
    <?php if (isset($slider['main_info'])&&(isset($slider['main_info']['apply_classes'])))echo stripslashes($slider['main_info']['apply_classes']); ?>
  </textarea>
  </td>
  </tr>
  
  <tr>
  <td>
  Autoplay
  </td>
  <td>
  <input type="checkbox" name="autoplay" class="form-control digits_fld" size="10" value="1" <?php if ($slider['main_info']['autoplay'] == 1) echo "checked"; ?>>
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
</div>
</div>