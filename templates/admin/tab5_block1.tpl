<h2>Slider Settings</h2>
<form method="POST" id="settings_frm_1" class="settings_frm" action="<?php echo $_SERVER['PHP_SELF']; ?>?page=simpleal_slider_show&active=4&pid=<?php if (isset($_GET['pid']))echo $_GET['pid']; else echo $proj_id; ?>">
  <input type="hidden" name="pid" value="<?php if (isset($_GET['pid']))echo $_GET['pid']; else echo $proj_id; ?>">
  <?php
  if (function_exists('wp_nonce_field'))
    {
    wp_nonce_field('settings_buttons');
    }
  ?>
<h3>Buttons</h3>
<table id="tbl_settings">
<?php
$settings_ind = range(1, 2);
foreach ($settings_ind as $setts)
  {
  echo "<tr><td>";
  if ($slider['main_info']['settings_buttons'] == $setts)
    echo "<input type='radio' name='settings_buttons' checked='checked' value='".$setts."'>";
      else
    echo "<input type='radio' name='settings_buttons' value='".$setts."'>";
  echo "</td><td>";
  echo "Buttons #".$setts;
  echo "</td><td>";
  echo "<img src='".plugins_url("../../images/arrow_left_0".$setts.".png", __FILE__)."'>";
  echo "<img src='".plugins_url("../../images/arrow_right_0".$setts.".png", __FILE__)."'>";
  echo "</td></tr>";
  }
  echo "<tr><td>";
  if ($slider['main_info']['settings_buttons'] == 0)
    echo "<input type='radio' name='settings_buttons' checked='checked' value='".(0)."'>";
      else
    echo "<input type='radio' name='settings_buttons' value='".(0)."'>";
  echo "</td><td>";
  echo "Buttons";
  echo "</td><td>";
  echo "Don't show buttons";
  echo "</td></tr>";

?>
</table>
<h3>Buttons Offset Top</h3>
<table>
<tr><td>
<div style='font-weight:bold;'>Offset</div>
</td><td>
<input type="text" class="digits_fld" name="settings_buttons_top" value="<?php echo $slider['main_info']['settings_buttons_top']; ?>">
</td><td>
(If 0 - "Default top offset")
</td></tr>
</table>
<input type="submit" name="settings_buttons_save_btn" value="Save">
</form>
