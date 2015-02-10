<?php
   $unq = "positions_".uniqid();
?>
<div class="simple_al_slider_outter" style="height:100%;width:100%;">
<div class="simple_al_slider" style='width:<?php echo $front['slider']['sldrwidth']; ?>px;height:<?php echo $front['slider']['sldrheight']; ?>px;overflow:hidden;'>
<div class="simple_al_slider_inside" id="simple_al_slider_inside_<?php echo $unq; ?>" style='width:<?php echo $front['slider']['sldrwidth']; ?>px;height:<?php echo $front['slider']['sldrheight']; ?>px;'>

<?php
$parent_params = $front['slider']['sldrwidth'].", ".$front['slider']['sldrheight'];
    $fullscreen = ($front['slider']['fullscreen']==0) ? 'false' : 'true';

  $txtnum = 0;
    $positions_output = "{";
if (isset($front['slides_info'])&&(!empty($front['slides_info'])))
  foreach ($front['slides_info'] as $slnum=>$slide)
  {
    $subslnum = $slnum*2 - 1;
    $positions_output .= "simple_al_item_".$slnum.":{";
    ?>
  <div class="simple_al_item" id="simple_al_item_<?php echo $slnum; ?>">
    <div class="simple_al_subitem" id="simple_al_subitem_<?php echo $subslnum; ?>">
      <img src="<?php echo $slide['imgs']['image']; ?>" style='width:<?php echo $front['slider']['sldrwidth']; ?>px;height:<?php echo $front['slider']['sldrheight']; ?>px;'>
    </div>
    <div class="simple_al_subitem txt_container" id="simple_al_subitem_<?php echo ($subslnum+1); ?>">
    <?php
    $i = 0;
    if (isset($slide['texts'])&&(!empty($slide['texts'])))
    foreach ($slide['texts'] as $txt)
    {
      $txtnum++;
      $positions_output_addit = ($i == 0) ? "" : ",";
      $positions_output .= $positions_output_addit . "simple_al_subitem_txt_".$txtnum.":[".$txt['offsetleft'].", ".$txt['offsettop']."]";
      $i++;
    ?>

      <?php
     if ((isset($txt['txturl']))&&(!empty($txt['txturl'])))
      echo "<a href='".$txt['txturl']."'>";
      ?>

      <div class="simple_al_subitem_txt <?php echo $txt['classes']; ?>" id="simple_al_subitem_txt_<?php echo $txtnum; ?>" style="background-color:<?php echo $txt['bgcolor']; ?>;color:<?php echo $txt['color']; ?>;width:<?php echo $txt['txtwidth']; ?>px;height:<?php echo $txt['txtheight']; ?>px;font-size:<?php echo $txt['size']; ?>pt;display:none;position:absolute;left:0px;top:0px;<?php echo $txt['style']; ?>">
        <?php echo stripslashes($txt['text']); ?>
      </div>
        <?php
     if ((isset($txt['txturl']))&&(!empty($txt['txturl'])))
          echo "</a>";
        ?>

      <?php
    }
    $positions_output .= "},";
      ?>
    </div>
  </div>
      <?php
  }
  $positions_output = substr($positions_output, 0, -1);
  $positions_output .= "}";
      ?>

</div>
</div>
</div>
<style>
<?php echo stripslashes($front['slider']['apply_classes']); ?>
</style>
<script>
jQuery(function($) {
  if (simple_al_slider_blur === undefined)
    var simple_al_slider_blur = false;

  if (simple_al_slider_pos === undefined)
    var simple_al_slider_pos = [];

  if (window.simple_al_slider === undefined)
  {
    window.simple_al_slider = [];
  }

<?php

   ?>

      simple_al_slider_pos['<?php echo $unq; ?>'] = <?php echo $positions_output; ?>;
      
      simple_al_slider.push($('#simple_al_slider_inside_<?php echo $unq; ?>').simple_al_slider({fullscreen:<?php echo $fullscreen; ?>, parent_params:[<?php echo $parent_params; ?>], positions : simple_al_slider_pos['<?php echo $unq; ?>'],direction:'<?php echo $front['slider']['effect_direction']; ?>', duration_action:<?php echo $front['slider']['duration']; ?>, duration_effect:<?php echo $front['slider']['duration_effect']; ?>, duration_text_effect:<?php echo $front['slider']['duration_text_effect']; ?>, action:'<?php echo $front['slider']['effect']; ?>', set_buttons: <?php echo $front['slider']['settings_buttons']; ?>, set_top_buttons: <?php echo $front['slider']['settings_buttons_top']; ?>, frame:'parent'}));
    

    $(window).on("blur focus", function(e) {

    var prevType = $(this).data("prevType");

    //if (prevType != e.type) {   //  reduce double fire issues
        switch (e.type) {
            case "blur":
            simple_al_slider_blur = true;
            $.each(simple_al_slider, function (i, v) {
                v.stop();
            });
                break;
            case "focus":
            if (simple_al_slider_blur)
              {
            $.each(simple_al_slider, function(i, v){
                v.start();
                });
                simple_al_slider_blur = false;
              }
                break; 
        }
    //}

      $(this).data("prevType", e.type);
    });

    $( window ).on("resize", function() {
       $.each(simple_al_slider, function (i, v) {
        v.resize();
       });
    });


  });
</script>
