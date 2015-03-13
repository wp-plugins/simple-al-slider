 <div id="tabs-4" style="text-align:left;width:97%;" class="welcome-panel">
 <br>
  <div class="new_text_item" title="New element creation" style="border:1px solid black;background-color:#fff;width:350px;padding-left:20px;">
  <h4>Create new element<h4>
    Text <input type="text" name="new_text_item" value="" id="new_text_item"><br>
    Slide
    <select name="slide_text">
    <?php
    if (isset($slider['slides_info'])&&(!empty($slider['slides_info'])))
      foreach ($slider['slides_info'] as $slide)
      {
      echo "<option value='".$slide['sldsid']."'>".$slide['sldsname']."</option>";
      }
    ?>
    </select>
    <input type="submit" class="create_new_element_btn" value="Create">
    <input type="submit" class="close_new_element_btn" value="Close">
  </div>
  
  <script>
  jQuery(function($) {

<?php
if ($jquery_minicolors)
{
?>
function set_color_pickers()
  {
  $.minicolors = {
    defaults: {
        animationSpeed: 50,
        animationEasing: 'swing',
        change: null,
        changeDelay: 0,
        control: 'hue',
        dataUris: true,
        defaultValue: '',
        hide: null,
        hideSpeed: 100,
        inline: false,
        letterCase: 'lowercase',
        opacity: false,
        position: 'bottom left',
        show: null,
        showSpeed: 100,
        theme: 'default'
    }
};
    $('input[name="color"]').not('.hdn_color').minicolors('create', $.minicolors.defaults);
    $('input[name="bgcolor"]').not('.hdn_color').minicolors('create', $.minicolors.defaults);
  }
  
  set_color_pickers();
<?php
  }
?>
  
    $("button[name='create_new_text']").click(function(){
      $( ".new_text_item" ).show();
                  event.preventDefault();
    });
    
    $('.create_new_element_btn').bind('click', function(event){
       if ($('#new_text_item').val() == '')
            {
            event.preventDefault();
              window.alert_show('Wrong item text', 'Error');
            }
            else
            {
            send_text_data($('#new_text_item').val(), $('select[name="slide_text"]').val());
              $('#new_text_item').val('');
                $( ".new_text_item" ).hide();
                            event.preventDefault();
            }
    });
    $('.close_new_element_btn').unbind('click').bind('click', function(event){
              $('#new_text_item').val('');
                $( ".new_text_item" ).hide();
                            event.preventDefault();
    });
    
    var send_text_data = function(text_data, slide_id)
    {
     var text_frm = $('.text_hidden_form').html();

     var url = ajaxurl;
      var nonce = $('#text_nonce').html();
      var info = $('.text_hidden_form').html();

    $.post( url, { action:"simple_al_saveTextData_ajax", slide_id: slide_id, url: "", text: text_data, width: 0, height: 0, offsetleft: 0, offsettop: 0, style:'', txt_save_ajax: true, nonce: nonce })
    .done(function( nfo ) {
    var data = nfo.split("::");
      id = data[0];
      text_name = data[1];

          text_frm = text_frm.replace(/\[TEXT\]/g, text_data);
          text_frm = text_frm.replace(/\[TEXT_NAME\]/g, text_name);
          text_frm = text_frm.replace(/\[TEXT_ID\]/g, id);

     $('.texts_output_area').append(text_frm);
     $('.texts_output_area').find('#slide_id_'+id).val(slide_id);
      $('.texts_output_area').find('.hdn_color').removeClass('hdn_color');
      
<?php
if ($jquery_minicolors)
{
?>
        set_color_pickers();
<?php
}
?>

     $( "input[type='submit']" ).not(".hdn").addClass('button');
                 $('.set_image').addClass('button');
                 window.set_simple_al_image();

    });
    }
    
  });
  </script>