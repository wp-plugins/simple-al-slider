  <div id="tabs-2">
  <script>
  jQuery(function($) {
    $('#slide_mass_effect').click( function() {
      var input = $("input[name='slides_chk_now[]']").clone();
      $(".hidden_chk_1").append(input);
    });
  });
  </script>