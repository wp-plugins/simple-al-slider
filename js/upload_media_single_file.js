jQuery(document).ready(function($) {
    
$('.set_image').click(function(event)
{
  event.preventDefault();
  var current_element = this;

  var uploader = wp.media(
  {
    title : 'Add image for element',
    button : {
      text : 'Add',
    },
    multiple : false
  })

  .on('select', function()
  {
    var selection = uploader.state().get('selection');

    var attachements = [];

    selection.map(function(attachement)
    {
      attachement = attachement.toJSON();

      attachements.push([attachement.id, attachement.url, attachement.caption]);

      set_element_image_data(attachement.url, current_element);
      
    })

  })
  .open();

});
function set_element_image_data(url, current_element)
  {
    $(current_element).parent().find('.element_image_src').attr('src', url);
    $(current_element).parent().find('.element_image').val(url);
  }
  
});