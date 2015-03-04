<?php
   $unq = "positions_".uniqid();
   
?>
<div class="simple_al_slider_outter_<?php echo $unq; ?>" style="width:100%;height:100%;">
  
  <div class="simple_al_preloader" id="simple_al_preloader_<?php echo $unq; ?>" style="position:relative;left:0px;top:0px;width:100%;height:100%;background-color:#000000;display:table;z-index:1220000;">
    <div class="simple_al_preloader_inside" style="display:table-cell;vertical-align:middle;text-align:center;">
      <img src="<?php echo plugins_url("../../images/preloader2.gif", __FILE__); ?>" style="width:100px;">
    </div>
  </div>

<div id="simple_al_slider_id_<?php echo $unq; ?>" class="simple_al_slider" style="position:relative;"><!-- style='width:<?php echo $front['slider']['sldrwidth']; ?>px;height:<?php echo $front['slider']['sldrheight']; ?>px;overflow:hidden;position:relative;'>-->

<div id="slides_indicator_<?php echo $unq; ?>" class="slides_indicator" style="position:absolute;z-index:1000;"></div>
<div id="slides_arrows_<?php echo $unq; ?>" class="slides_arrows" style="position:absolute;z-index:1000;"></div>
<div style="position:absolute;left:0px;top:0px;z-index:10;">
<div class="simple_al_slider_inside" id="simple_al_slider_inside_<?php echo $unq; ?>" style='width:<?php echo $front['slider']['sldrwidth']; ?>px;height:<?php echo $front['slider']['sldrheight']; ?>px;overflow:hidden;'>

<?php
$parent_params = $front['slider']['sldrwidth'].", ".$front['slider']['sldrheight'];
    $fullscreen = $front['slider']['fullscreen'];

  $txtnum = 0;
    $positions_output = "{";
if (isset($front['slides_info'])&&(!empty($front['slides_info'])))
  foreach ($front['slides_info'] as $slnum=>$slide)
  {
    $subslnum = $slnum*2 - 1;
    $positions_output .= "simple_al_item_".$unq."_".$slnum.":{";
    ?>
  <div class="simple_al_item" id="simple_al_item_<?php echo $unq; ?>_<?php echo $slnum; ?>">
    <div class="simple_al_subitem" id="simple_al_subitem_<?php echo $unq; ?>_<?php echo $subslnum; ?>">
      <img src="<?php echo $slide['imgs']['imgimage']; ?>" style='width:<?php echo $front['slider']['sldrwidth']; ?>px;height:<?php echo $front['slider']['sldrheight']; ?>px;'>
    </div>
    <div class="simple_al_subitem txt_container" id="simple_al_subitem_<?php echo $unq; ?>_<?php echo ($subslnum+1); ?>">
    <?php
    $i = 0;
    if (isset($slide['texts'])&&(!empty($slide['texts'])))
    foreach ($slide['texts'] as $txt)
    {
      $txtnum++;
      $positions_output_addit = ($i == 0) ? "" : ",";
      $positions_output .= $positions_output_addit . "simple_al_subitem_txt_".$unq."_".$txtnum.":[".$txt['offsetleft'].", ".$txt['offsettop']."]";
      $i++;
    ?>

      <?php
     if (isset($txt['txttype']))
      {
     switch ($txt['txttype'])
        {
      case 0:
     if ((isset($txt['txturl']))&&(!empty($txt['txturl'])))
      echo "<a href='".$txt['txturl']."'>";
      ?>

      <div class="simple_al_subitem_txt <?php echo $txt['classes']; ?>" id="simple_al_subitem_txt_<?php echo $unq; ?>_<?php echo $txtnum; ?>" style="background-color:<?php echo $txt['bgcolor']; ?>;color:<?php echo $txt['color']; ?>;width:<?php echo $txt['txtwidth']; ?>px;height:<?php echo $txt['txtheight']; ?>px;font-size:<?php echo $txt['size']; ?>pt;display:none;position:absolute;left:0px;top:0px;<?php echo $txt['style']; ?>">
        <?php echo stripslashes($txt['text']); ?>
      </div>
        <?php
     if ((isset($txt['txturl']))&&(!empty($txt['txturl'])))
          echo "</a>";
          break;
          
      case 1:
     if ((isset($txt['txturl']))&&(!empty($txt['txturl'])))
      echo "<a href='".$txt['txturl']."'>";
      ?>

      <div class="simple_al_subitem_txt <?php echo $txt['classes']; ?>" id="simple_al_subitem_txt_<?php echo $unq; ?>_<?php echo $txtnum; ?>" style="background-color:<?php echo $txt['bgcolor']; ?>;color:<?php echo $txt['color']; ?>;width:<?php echo $txt['txtwidth']; ?>px;height:<?php echo $txt['txtheight']; ?>px;font-size:<?php echo $txt['size']; ?>pt;display:none;position:absolute;left:0px;top:0px;<?php echo $txt['style']; ?>">
        <img src="<?php echo stripslashes($txt['txtimage']); ?>" style="width:<?php echo $txt['txtwidth']; ?>px;height:<?php echo $txt['txtheight']; ?>px;">
      </div>
        <?php
     if ((isset($txt['txturl']))&&(!empty($txt['txturl'])))
          echo "</a>";
          break;

      case 2:
     if ((isset($txt['txturl']))&&(!empty($txt['txturl'])))
      echo "<a href='".$txt['txturl']."'>";
      ?>

      <div class="simple_al_subitem_txt <?php echo $txt['classes']; ?>" id="simple_al_subitem_txt_<?php echo $unq; ?>_<?php echo $txtnum; ?>" style="background-color:<?php echo $txt['bgcolor']; ?>;color:<?php echo $txt['color']; ?>;width:<?php echo $txt['txtwidth']; ?>px;height:<?php echo $txt['txtheight']; ?>px;font-size:<?php echo $txt['size']; ?>pt;display:none;position:absolute;left:0px;top:0px;<?php echo $txt['style']; ?>">
      <?php 
      if ((isset($txt['template']))&&(!empty($txt['template']))&&($txt['template'] != 'none'))
        echo file_get_contents(plugin_dir_path( __FILE__ )."../../templates/front_templates/".$txt['template']); ?>
      </div>
        <?php
     if ((isset($txt['txturl']))&&(!empty($txt['txturl'])))
          echo "</a>";
          break;

        ?>

      <?php
        }
      }
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
</div>
<div class="class_for_out_styles">

</div>
<style>
<?php echo stripslashes($front['slider']['apply_classes']); ?>
</style>
<script>
if (window.cont_width_curr === undefined) window.cont_width_curr = [];
      window.cont_width_curr['<?php echo $unq; ?>'] = jQuery('.simple_al_slider_outter_<?php echo $unq; ?>').parent().innerWidth();

if (0 != <?php echo $fullscreen; ?>)
  {
    jQuery('.simple_al_slider_outter_<?php echo $unq; ?>').innerWidth(jQuery('.simple_al_slider_outter_<?php echo $unq; ?>').parent().innerWidth());
      jQuery('.simple_al_slider_outter_<?php echo $unq; ?>').innerHeight(jQuery('.simple_al_slider_outter_<?php echo $unq; ?>').parent().innerWidth()*<?php echo $front['slider']['sldrheight']; ?>/<?php echo $front['slider']['sldrwidth']; ?>);
  }
  else
  {
    jQuery('.simple_al_slider_outter_<?php echo $unq; ?>').innerWidth(<?php echo $front['slider']['sldrwidth']; ?>);
      jQuery('.simple_al_slider_outter_<?php echo $unq; ?>').innerHeight(<?php echo $front['slider']['sldrheight']; ?>);
  }
    jQuery('.simple_al_slider_outter_<?php echo $unq; ?>').css('overflow', 'hidden');

jQuery(window).load(function() {
  jQuery('#simple_al_preloader_<?php echo $unq; ?>').hide();
      jQuery('.simple_al_slider_outter_<?php echo $unq; ?>').css('overflow', '');
  window.processing_simple_slider<?php echo $unq; ?>();
});

jQuery(function($) {

  if (window.simple_al_slider_blur === undefined)
    window.simple_al_slider_blur = false;

  if (window.simple_al_slider_pos === undefined)
    window.simple_al_slider_pos = [];

  if (window.simple_al_slider === undefined)
  {
    window.simple_al_slider = [];
  }

  if (window.resize_execution_flag === undefined)  
              window.resize_execution_flag = true;

  if (window.action_finished == undefined)
            window.action_finished = [];
            window.action_finished['<?php echo $unq; ?>'] = false;
<?php
      global $slide_indicators_front_one_side;
   ?>
window.processing_simple_slider<?php echo $unq; ?> = function(){

      window.simple_al_slider_pos['<?php echo $unq; ?>'] = <?php echo $positions_output; ?>;
      
      window.simple_al_slider.push($('#simple_al_slider_inside_<?php echo $unq; ?>').simple_al_slider({container_id:$('#simple_al_slider_inside_'+'<?php echo $unq; ?>'),fullscreen:<?php echo $fullscreen; ?>, parent_params:[<?php echo $parent_params; ?>], positions : window.simple_al_slider_pos['<?php echo $unq; ?>'],direction:'<?php echo $front['slider']['effect_direction']; ?>', duration_action:<?php echo $front['slider']['duration']; ?>, duration_effect:<?php echo $front['slider']['duration_effect']; ?>, duration_text_effect:<?php echo $front['slider']['duration_text_effect']; ?>, action:'<?php echo $front['slider']['effect']; ?>', set_buttons: <?php echo $front['slider']['settings_buttons']; ?>, set_top_buttons: <?php echo $front['slider']['settings_buttons_top']; ?>, frame:'parent', uniqid:'<?php echo $unq; ?>', indicators_num:<?php echo $front['slider']['settings_indicators']; ?>, indicators_width:<?php echo $front['slider']['settings_indicators_width']; ?>, slide_indicators_front_one_side : <?php echo $slide_indicators_front_one_side; ?>, autoplay:<?php echo $front['slider']['autoplay']; ?>}));
    

    $(window).on("blur focus", function(e) {

    var prevType = $(this).data("prevType");

        switch (e.type) {
            case "blur":
            window.simple_al_slider_blur = true;
            $.each(window.simple_al_slider, function (i, v) {
                v.stop();
            });
                break;
            case "focus":
            if (window.simple_al_slider_blur)
              {
            $.each(window.simple_al_slider, function(i, v){
                v.start();
                });
                window.simple_al_slider_blur = false;
              }
                break; 
        }

      $(this).data("prevType", e.type);
    });

    $( window ).on("resize", function() {
//       $('.simple_al_slider_outter_<?php echo $unq; ?>').show();
       $.each(window.simple_al_slider, function (i, v){ v.resize(); });
       $('.simple_al_slider_outter_<?php echo $unq; ?>').find('img').css('max-width', 'none');
    });
  
  var window_resize_flag = false;
    if (!window_resize_flag)
        {
         $('.simple_al_slider_outter_<?php echo $unq; ?>').css('width', '');
         $('.simple_al_slider_outter_<?php echo $unq; ?>').css('height', '');
          $( window ).trigger("resize");
              var window_resize_flag = true;
        }

if (window.slide_by_index == undefined)
  window.slide_by_index = function(unq, ind)
    {
       $.each(window.simple_al_slider, function (i, v){ 
       
        if (v.uniqid == unq)
          {
            v.slide_to_position(ind);
          }
       
       });

    }
   }
  });
</script>
