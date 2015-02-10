jQuery(document).ready(function($) {
    
$('.set_backgrounds').click(function(event)
{
  event.preventDefault();

  var uploader = wp.media(
  {
    title : 'Add background images',
    button : {
      text : 'Add',
    },
    multiple : true
  })

  .on('select', function()
  {
    var selection = uploader.state().get('selection');

    var attachements = [];

    var slide_frm = $('.slides_hidden_form').html();
    var image_frm = $('.images_hidden_form').html();

    selection.map(function(attachement)
    {
      attachement = attachement.toJSON();

      attachements.push([attachement.id, attachement.url, attachement.caption]);

      send_bg_data(attachement.url, image_frm, slide_frm);
      
    })

  })
  .open();

});
function ins_slide_into_array(slide_id, slide_name)
  {
  $('select[name="slide_id"]').append($('<option>', {value: slide_id, text: slide_name}));
    $('select[name="slide_text"]').append($('<option>', {value: slide_id, text: slide_name}));
  }
function send_bg_data(image_addr, image_frm, slide_frm)
  {
var url = ajaxurl;
var nonce = $('#image_nonce').html();

$.post( url, { action:"simple_al_saveBgData_ajax", slider_id: $('#projects').val(), name: "", url: "", bgimg: image_addr, bg_save_ajax: true, nonce: nonce })
  .done(function( data ) {

  var inp = data.split("::");
    slide_frm = slide_frm.replace(/\[SLIDE_ID\]/g, inp[0]);
    slide_frm = slide_frm.replace(/\[SLIDE_NAME\]/g, inp[1]);

    image_frm = image_frm.replace(/\[IMAGE_ID\]/g, inp[2]);
    image_frm = image_frm.replace(/\[IMAGE_NAME\]/g, inp[3]);
      image_frm = image_frm.replace(/\[IMAGE_FILE\]/g, image_addr);

    ins_slide_into_array(inp[0], inp[1]);
    
    slide_frm = remove_class_hdn(slide_frm);
     $('.slides_output_area').append(slide_frm);

    image_frm = remove_class_hdn(image_frm);
     $('.images_output_area').append(image_frm);

     $( "input[type='submit']" ).not(".hdn").button();
  });
  }
  
});