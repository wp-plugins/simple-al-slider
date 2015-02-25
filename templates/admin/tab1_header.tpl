<?php if (isset($_GET['updated'])) { ?>
<div class="updated"><strong><?php _e('Settings saved.') ?></strong></div>
<?php } ?>

  <script>
  jQuery(function($) {

    $( "#tabs" ).tabs();
    
    $( "#tabs" ).tabs({ active: <?php if (isset($_GET['active'])) echo $_GET['active']; else echo 0; ?> });

    $('.btn_href').button();
    
    $('#button_show_add_project').button();
    $('.set_backgrounds').button();
    $( "input[type=submit], button" ).not(".hdn").button();

      if (empty($('#projects').val())) 
        {
        $( "input[type=submit], button" ).not('.any').each(function(){
        if (($(this).attr("id")) != 'button_show_add_project')
          {
          $(this).attr("disabled", "disabled");
          }
        });
        }

function empty(element) {
    if (
            element === ""          ||
            element === 0           ||
            element === "0"         ||
            element === null        ||
            element === "NULL"      ||
            element === "null"      ||
            element === undefined   ||
            element === false
        ) {
        return true;
    }
    if (typeof(element) === 'object') {
        var i = 0;
        for (key in element) {
            i++;
        }
        if (i === 0) { return true; }
    }
    return false;
}

        
$('#button_show_add_project').click( function() {
$( ".new_project_show" ).dialog({
      resizable: false,
      height:140,
      modal: true,
      buttons: {
        "Create new project": function() {

          if ($('#new_project_name').val() == '')
            {
            event.preventDefault();
            alert_show('Wrong project name', 'Error');
            }
            else
            //$("form [name='project_creation_form']").submit();
            $('#pcf').submit();
            
            $( this ).dialog( "close" );
        },
        Cancel: function() {
          $( this ).dialog( "close" );
        }
      }
    });
  });
  
window.alert_show = function(msg, type)
  {
  $( "#dialog-message" ).html(msg);
  $( "#dialog-message" ).attr("title", type);
    $( "#dialog-message" ).dialog({
      modal: true,
      buttons: {
        Ok: function() {
          $( this ).dialog( "close" );
        }
      }
    });
  }
    
    $('#mass_effect').click( function() {
    
    var input = $("input[name='chk_now[]']").clone();
    $(".hidden_chk").append(input);
    
    });
    
    $('#projects').change( function() {
      location.href = "<?php echo $_SERVER['PHP_SELF']; ?>?page=simpleal_slider_show&active=0&pid="+$('#projects').val();
    });

  
/*
Remove hdn class
*/
window.remove_class_hdn = function(source)
  {
    $(source).find(".hdn").each(function(key, item){
    var oldi = item.outerHTML;
    var newi = $(item).removeClass("hdn")[0].outerHTML;
      source = source.replace(oldi, newi);
    });
    return source;
  }
/*
Validation form
*/

function validate_big_form(event, defselector, elem)
{
$('.container_frm__errors').html("");
var big_frm_errors = [];
  var id_arr = elem.attr("id").split("frm_");
  var selector = "#"+defselector.substr(1)+"_"+id_arr[1];
  $(selector).find(".notempty_fld").each(function (key,item) {
    if ((empty(item))||($(item).val() == ''))
      big_frm_errors.push("Validation Error (not empty check): Field - '"+$(item).parent().prev().html()+"'");
  });
  $(selector).find(".digits_fld").each(function (key,item) {
    if ((empty(item))||(!$.isNumeric($(item).val())))
      big_frm_errors.push("Validation Error (digit check): Field - '"+$(item).parent().prev().html()+"'");
  });

  if (big_frm_errors.length === 0)
              {
              //$(selector)[0].submit();
              }
              else
              {
              event.preventDefault();
              var newsel = selector+"_errors";
                $(newsel).html("<br>"+big_frm_errors.join("<br>"));
              }
}  
  });
  </script>

<div id="dialog-message"></div>

<div id="image_nonce"><?php 
if (function_exists('wp_create_nonce'))
    {
echo wp_create_nonce("upd_rec_img");
    }
 ?></div>
 
 <div id="text_nonce"><?php 
if (function_exists('wp_create_nonce'))
    {
echo wp_create_nonce("upd_rec_txt");
    }
 ?></div>
 <div id="slides_nonce"><?php 
if (function_exists('wp_create_nonce'))
    {
echo wp_create_nonce("upd_rec_slide");
    }
 ?></div>

<!-- ********************************************* Tab Page 1 ****************************************************** -->

<div><img src='<?php echo plugins_url("../../images/caption.png", __FILE__); ?>'></div>
 
 Projects 
 <select name="cur_project" id="projects">
 <?php
 foreach ($all_projects as $project)
  {
  if ($proj_id == $project->id)
  echo "<option value='".$project->id."' selected='selected'>".$project->name."(id:".$project->id.")</option>";
  else
  echo "<option value='".$project->id."'>".$project->name."(id:".$project->id.")</option>";
  }
 ?>
 </select>
 <button name="new_project" id="button_show_add_project">Create new project</button>

<form id="projdel" name="project_delete_form" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>?page=simpleal_slider_show&active=0">
  <?php
  if (function_exists('wp_nonce_field'))
    {
    wp_nonce_field('sp_project_del');
    }
  ?>
<input type="hidden" name="proj_id" value="<?php if (isset($_GET['pid']))echo $_GET['pid']; else echo $proj_id; ?>">
<input type="submit" name="del_proj_btn" value="Delete">
</form>
 
 <div class="new_project_show" title="New project creation">
  <form id="pcf" name="project_creation_form" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>?page=simpleal_slider_show&active=0">
  <?php
  if (function_exists('wp_nonce_field'))
    {
    wp_nonce_field('sp_project_name');
    }
  ?>
 <h5 class="add_proj_header">New project</h5>
 <input type="text" name="new_project_name" value="" id="new_project_name">
 <input type="hidden" name="new_project_btn" value="Add project" id="add_proj_btn">
  </form>
 </div>
 
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Slider</a></li>
    <li><a href="#tabs-2">Slides</a></li>
    <li><a href="#tabs-3">Images</a></li>
    <li><a href="#tabs-4">Texts</a></li>
    <li><a href="#tabs-5">Settings</a></li>
    <li><a href="#tabs-6">Paste Code</a></li>
  </ul>
  <div id="tabs-1">
  
Background Images &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button class="set_backgrounds">Upload</button>

