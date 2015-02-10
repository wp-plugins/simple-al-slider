<h2>Texts</h2>

<button name="create_new_text">Create New Text</button>

<div class='texts_output_area'>
<?php
if (isset($slider['slides_info'])&&(!empty($slider['slides_info'])))
foreach ($slider['slides_info'] as $slide)
 {
if (isset($slide['texts'])&&(!empty($slide['texts'])))
  foreach ($slide['texts'] as $text)
  {
  ?>
  <div class='text_container'>
  <form method="POST" id="text_frm_<?php echo $image['txtid']; ?>" class="text_frm" action="<?php echo $_SERVER['PHP_SELF']; ?>?page=simpleal_slider_show&active=3&pid=<?php if (isset($_GET['pid']))echo $_GET['pid']; else echo $proj_id; ?>&amp;updated=true">
          <?php
  if (function_exists('wp_nonce_field'))
    {
    wp_nonce_field('sp_text');
    }
  ?>
  <h3><?php echo $text['txtname']; ?></h3>
  <input type='hidden' name='text_id' value='<?php echo $text['txtid']; ?>'>
    <div class='text_show'>
      <div class="left_line">

  <div class="left_line">
      <table>
     
      <tr>
      <td>
      Name
      </td>
      <td>
      <input type="text" name="name" size="30" value="<?php echo stripslashes($text['txtname']); ?>">
      </td>
      </tr>

      <tr>
      <td>
      URL
      </td>
      <td>
      <input type="text" name="url" size="30" value="<?php echo $text['txturl']; ?>">
      </td>
      </tr>

      <tr>
      <td>
      Text
      </td>
      <td>
      <input type="text" name="text" size="30" value="<?php echo htmlspecialchars(stripslashes($text['text'])); ?>">
      </td>
      </tr>

      <tr>
      <td>
      Width
      </td>
      <td>
      <input type="text" name="width" size="10" value="<?php echo $text['txtwidth']; ?>">
      </td>
      </tr>

      <tr>
      <td>
      Height
      </td>
      <td>
      <input type="text" name="height" size="10" value="<?php echo $text['txtheight']; ?>">
      </td>
      </tr>

      <tr>
      <td>
      Classes
      </td>
      <td>
      <input type="text" name="classes" size="30" value="<?php echo $text['classes']; ?>">
      </td>
      </tr>

      <tr>
      <td>
      Offset Left
      </td>
      <td>
      <input type="text" name="offsetleft" size="10" value="<?php echo $text['offsetleft']; ?>">
      </td>
      </tr>
</table>
</div>
<div class="left_line" style="margin-left:30px;">
<table>
      <tr>
      <td>
      Offset Top
      </td>
      <td>
      <input type="text" name="offsettop" size="10" value="<?php echo $text['offsettop']; ?>">
      </td>
      </tr>

      <tr>
      <td>
      Color
      </td>
      <td>
      <input type="text" name="color" size="10" value="<?php echo $text['color']; ?>">
      </td>
      </tr>

      <tr>
      <td>
      Background Color
      </td>
      <td>
      <input type="text" name="bgcolor" size="10" value="<?php echo $text['bgcolor']; ?>">
      </td>
      </tr>

      <tr>
      <td>
      Style
      </td>
      <td>
      <input type="text" name="style" size="30" value="<?php echo $text['style']; ?>">
      </td>
      </tr>

      <tr>
      <td>
      Size
      </td>
      <td>
      <input type="text" name="size" size="10" value="<?php echo $text['size']; ?>">
      </td>
      </tr>

      <tr>
      <td>
      Slide
      </td>
      <td>
    <select name="slide_id">
    <?php
    if (isset($slider['slides_info'])&&(!empty($slider['slides_info'])))
      foreach ($slider['slides_info'] as $slide)
      {
      if ($slide['sldsid'] == $text['txtsldid'])
        echo "<option value='".$slide['sldsid']."' selected='selected'>".$slide['sldsname']."</option>";
      else
        echo "<option value='".$slide['sldsid']."'>".$slide['sldsname']."</option>";
      }
    ?>
    </select>
      </td>
      </tr>

      <tr>
      <td>
      Actions
      </td>
      <td>
      <input type="submit" name="save_text_btn" value=" Save Text ">
      <input type="submit" name="del_text_btn" value=" Delete Text ">
      </td>
      </tr>
      
      </table>
      </div>
      
      </div>
      <div class="clear_line"></div>

    </div>
   </form>
  </div>
  <?php
  }
 }
?>
</div>
