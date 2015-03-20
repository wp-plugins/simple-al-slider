  <div id="tabs-2" style="text-align:left;width:97%;" class="welcome-panel">
  <script>
  jQuery(function($) {
    $('#slide_mass_effect').click( function() {
      var input = $("input[name='slides_chk_now[]']").clone();
      $(".hidden_chk_1").append(input);
    });

  $('#select_all_slides').bind('click', function(event){
  event.preventDefault();
  $("input[name='slides_chk_now[]']").prop('checked', true);
  });

  $('#select_none_slides').bind('click', function(event){
  event.preventDefault();
  $("input[name='slides_chk_now[]']").prop('checked', false);
  });
  
  });
  </script>