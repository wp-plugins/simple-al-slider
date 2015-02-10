;(function($) {

$.fn.simple_al_slider_base = {
set_duration : function(id_selector, duration)
  {
    $(id_selector).css({
    '-webkit-transition': 'all '+duration+'ms ease',
    '-moz-transition': 'all '+duration+'ms ease',
    '-ms-transition': 'all '+duration+'ms ease',
    '-o-transition': 'all '+duration+'ms ease',
    'transition': 'all '+duration+'ms ease'
    });
    return $(id_selector);
  },
set_duration_transform : function(id_selector, duration)
  {
    $(id_selector).css({
    '-webkit-transition': '-webkit-transform '+duration+'ms ease',
    '-moz-transition': '-moz-transform '+duration+'ms ease',
    '-ms-transition': '-ms-transform '+duration+'ms ease',
    '-o-transition': '-o-transform '+duration+'ms ease',
    'transition': 'transform '+duration+'ms ease'
    });
  },
unset_duration : function(id_selector)
{
    $(id_selector).css({
    '-webkit-transition': '',
    '-moz-transition': '',
    '-ms-transition': '',
    '-o-transition': '',
    'transition': ''
    });
},
set_resize_by_scale : function(id_selector, koef, transform_origin)
{
  $(id_selector).css({
      '-webkit-transform':'scale3d('+koef+', '+koef+', '+koef+')',
      '-moz-transform':'scale3d('+koef+', '+koef+', '+koef+')',
      '-o-transform':'scale3d('+koef+', '+koef+', '+koef+')',
      '-ms-transform':'scale3d('+koef+', '+koef+', '+koef+')',
      'transform':'scale3d('+koef+', '+koef+', '+koef+')',
      '-webkit-transform-origin' : transform_origin,
      '-moz-transform-origin' : transform_origin,
      '-o-transform-origin' : transform_origin,
      '-ms-transform-origin' : transform_origin,
      'transform-origin' : transform_origin
  });
  
  if (!this.check_scale3d(id_selector))
    {
      $(id_selector).css({
      '-webkit-transform':'scale('+koef+')',
      '-moz-transform':'scale('+koef+')',
      '-o-transform':'scale('+koef+')',
      '-ms-transform':'scale('+koef+')',
      'transform':'scale('+koef+')',
      '-webkit-transform-origin' : '0% 0%',
      '-moz-transform-origin' : '0% 0%',
      '-o-transform-origin' : '0% 0%',
      '-ms-transform-origin' : '0% 0%',
      'transform-origin' : '0% 0%'
      });
    }
    
      if (( $.browser.msie ) && ( $.browser.version == 8 ))
        {
      $(id_selector).css({
      '-webkit-transform':'',
      '-moz-transform':'',
      '-o-transform':'',
      '-ms-transform':'',
      'transform':'',
      '-webkit-transform-origin' : '',
      '-moz-transform-origin' : '',
      '-o-transform-origin' : '',
      '-ms-transform-origin' : '',
      'transform-origin' : ''
      });
        var zoom = Math.round(koef*100)/100;
          $(id_selector).parent().css('zoom', zoom);
          $(id_selector).parent().css('-ms-zoom', zoom);
        }
      if (( $.browser.msie ) && ( $.browser.version <= 7 ))
        {
        var zoom = Math.round(koef*100)/100;
          $(id_selector).css('zoom', zoom);
          $(id_selector).css('-ms-zoom', zoom);

//        $(id_selector).find('.subitem_al_wrapper_slider').css('zoom', zoom);
//        $(id_selector).find('.subitem_al_wrapper_slider').css('-ms-zoom', zoom);
        }

},
check_scale3d : function(id_selector)
{
  var res = false;
    if (($(id_selector).css('-webkit-transform') != undefined)&&($(id_selector).css('-webkit-transform').indexOf('none') == -1)
    &&($(id_selector).css('-webkit-transform').indexOf('scale3d') != -1)) res = true;
    if (($(id_selector).css('-moz-transform') != undefined)&&($(id_selector).css('-moz-transform').indexOf('none') == -1)
    &&($(id_selector).css('-moz-transform').indexOf('scale3d') != -1)) res = true;
    if (($(id_selector).css('-o-transform') != undefined)&&($(id_selector).css('-o-transform').indexOf('none') == -1)
    &&($(id_selector).css('-o-transform').indexOf('scale3d') != -1)) res = true;
    if (($(id_selector).css('-ms-transform') != undefined)&&($(id_selector).css('-ms-transform').indexOf('none') == -1)
    &&($(id_selector).css('-ms-transform').indexOf('scale3d') != -1)) res = true;
    if (($(id_selector).css('transform') != undefined)&&($(id_selector).css('transform').indexOf('none') == -1)
    &&($(id_selector).css('transform').indexOf('scale3d') != -1)) res = true;
    
 return res;
},

check_any_scale : function(id_selector)
{
  var res = false;
    if ((($(id_selector).css('WebkitTransform') != undefined))&&
    (($(id_selector).css('MozTransform') != undefined))&&
    (($(id_selector).css('OTransform') != undefined))&&
    (($(id_selector).css('msTransform') != undefined))) res = true;
    
 return res;
},

set_perspective : function(id_selector, val)
{
  $(id_selector).css({
                  '-moz-perspective':''+val+'px',
                  '-webkit-perspective':''+val+'px',
                  '-o-perspective':''+val+'px',
                  '-ms-perspective':''+val+'px',
                  'perspective':''+val+'px'
                });
},
set_opacity : function(id_selector, opacity_in)
{
  $(id_selector).css({
  // IE 8
  '-ms-filter': "progid:DXImageTransform.Microsoft.Alpha(Opacity="+(opacity_in*100)+")",
  // IE 5-7 
  'filter': "alpha(opacity="+(opacity_in*100)+")",
  // Netscape 
  '-moz-opacity': opacity_in,
  // Safari 1.x 
  '-khtml-opacity': opacity_in,
  // Good browsers 
  'opacity': opacity_in
  });
},
set_width : function(id_selector, width_in)
{
    $(id_selector).css({ 'width' : width_in });
},
set_scaleX : function(id_selector, koef, transform_origin)
{
  $(id_selector).css({
      '-webkit-transform':'scale('+koef+')',
      '-moz-transform':'scale('+koef+')',
      '-o-transform':'scale('+koef+')',
      '-ms-transform':'scale('+koef+')',
      'transform':'scale('+koef+')',
      '-webkit-transform-origin' : transform_origin,
      '-moz-transform-origin' : transform_origin,
      '-o-transform-origin' : transform_origin,
      '-ms-transform-origin' : transform_origin,
      'transform-origin' : transform_origin
  });
},
set_translate : function(id_selector, koef, transform_origin)
{
  $(id_selector).css({
      '-webkit-transform':'translate('+koef+')',
      '-moz-transform':'translate('+koef+')',
      '-o-transform':'translate('+koef+')',
      '-ms-transform':'translate('+koef+')',
      'transform':'translate('+koef+')',
      '-webkit-transform-origin' : transform_origin,
      '-moz-transform-origin' : transform_origin,
      '-o-transform-origin' : transform_origin,
      '-ms-transform-origin' : transform_origin,
      'transform-origin' : transform_origin
  });
      if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById($(id_selector).attr("id"))).transform;
}

}
})(jQuery);
