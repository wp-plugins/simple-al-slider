<h2>Slides</h2>

<div class='slides_output_area'>
<?php
if (isset($slider['slides_info'])&&(!empty($slider['slides_info'])))
foreach ($slider['slides_info'] as $slide)
  {
  if (isset($slide['sldsid'])&&(!empty($slide['sldsid'])))
    {
  ?>
  <div class='slide_container'>
  <div class="chk">
  <div class="chk_in">
    <input type="checkbox" name="slides_chk_now[]" value="<?php echo $slide['sldsid']; ?>">
  </div>
</div>

  <form method="POST" id="slide_frm_<?php echo $slide['sldsid']; ?>" class="slide_frm" action="<?php echo $_SERVER['PHP_SELF']; ?>?page=simpleal_slider_show&active=1&pid=<?php if (isset($_GET['pid']))echo $_GET['pid']; else echo $proj_id; ?>&amp;updated=true">
    <?php
  if (function_exists('wp_nonce_field'))
    {
    wp_nonce_field('sp_slide');
    }
  ?>
  <h3><?php echo $slide['sldsname']; ?></h3>
  <input type='hidden' name='slide_id' value='<?php echo $slide['sldsid']; ?>'>
    <div class='slide_show'>
      <table>
      
      <tr>
      <td>
      Name
      </td>
      <td>
      <input type="text" name="slide_name" size="30" value="<?php echo $slide['sldsname']; ?>">
      </td>
      </tr>

      <tr>
      <td>
      Actions
      </td>
      <td>
      <input type="submit" name="save_slide_btn" value=" Save Slide ">
      <input type="submit" name="del_slide_btn" value=" Delete Slide ">
      </td>
      </tr>
      
      </table>
    </div>
    </form>
  </div>
  <?php
     }
  }
?>

</div>

  <br>
<form id="mass_action_slides_form" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>?page=simpleal_slider_show&active=1&pid=<?php if (isset($_GET['pid']))echo $_GET['pid']; else echo $proj_id; ?>&amp;updated=true">
  <?php
  if (function_exists('wp_nonce_field'))
    {
    wp_nonce_field('sp_slide_delete_mass');
    }
  ?>
<div class="hidden_chk_1">
  
</div>
<select id="slide_mass_action" name="slide_mass_action">
  <option value="0">None</option>
  <option value="1">Delete</option>
</select>
<input type="submit" id="slide_mass_effect" name="slide_mass_execution_btn" value="Execute">
</form>
