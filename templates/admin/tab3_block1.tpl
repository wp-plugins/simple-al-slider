<h2>Images</h2>

<div class='images_output_area'>
<?php
if (isset($slider['slides_info'])&&(!empty($slider['slides_info'])))
foreach ($slider['slides_info'] as $slide)
 {
if (isset($slide['imgs'])&&(!empty($slide['imgs'])))
  foreach ($slide['imgs'] as $image)
  {
  ?>
  <div class='image_container'>
  <form method="POST" id="image_frm_<?php echo $image['imgid']; ?>" class="image_frm" action="<?php echo $_SERVER['PHP_SELF']; ?>?page=simpleal_slider_show&active=2&pid=<?php if (isset($_GET['pid']))echo $_GET['pid']; else echo $proj_id; ?><?php echo (isset($_GET['pagesld'])) ? "&pagesld=".$_GET['pagesld'] : ""; ?>&amp;updated=true">
        <?php
  if (function_exists('wp_nonce_field'))
    {
    wp_nonce_field('sp_bg_image');
    }
  ?>
  <h3><?php echo $image['imgname']; ?></h3>
  <input type='hidden' name='image_id' value='<?php echo $image['imgid']; ?>'>
    <div class='image_show'>
      <div class="left_line">
      <table>
      
      <tr>
      <td>
      Name
      </td>
      <td>
      <input type="text" name="image_name" size="30" value="<?php echo $image['imgname']; ?>">
      </td>
      </tr>

      <tr>
      <td>
      URL
      </td>
      <td>
      <input type="text" name="url" size="30" value="<?php echo $image['imgurl']; ?>">
      </td>
      </tr>

      <tr>
      <td>
      Image File
      </td>
      <td>
      <input type="text" name="image" size="50" value="<?php echo $image['image']; ?>">
      </td>
      </tr>

      <tr>
      <td>
      Actions
      </td>
      <td>
      <input type="submit" name="save_image_btn" value=" Save Image ">
      <input type="submit" name="del_image_btn" value=" Delete Image ">
      </td>
      </tr>
      
      </table>
      </div>
      <div class="left_line">
      <img src="<?php echo $image['image']; ?>" width="150">
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
