;(function($) {

$.fn.simple_al_slider = function(options) {

var defaults = {
    offsetX: "0px",
    offsetY: "0px",
    direction: "forward",
    duration_text_effect: 750,
    duration_effect: 1150,
    duration_action:4100,
    action:'opacity',
    container_id: $('.simple_al_slider_inside'),
    main_arrows: true,
    set_buttons: 1,
    set_top_buttons: 0,
    key_interval:"first",
    start:function(){
    processing();
    },
    stop:function(){
    clearInterval(intervalID[settings.key_interval]);
    },
    resize:function(){
      resize_all();
    }
    };
    
var settings = $.extend(defaults, options);

var slider_inner = $(this);
  var allow = true;
  
var all = slider_inner.children();
  all.css('display', 'none');

var current = all.first();
  var current_clone = current;
    var next = current_clone.next();
      var prev = current_clone.prev().prev();

if (prev.length == 0)prev=all.last();
  if (next.length == 0)next=all.first();

var move_next = function()
{
   next.css("z-index", 0);

    current.hide();

    current = next;
    current_clone = current;
      next = current_clone.next();
      prev = current_clone.prev();

  
      if (next.length == 0){next=all.first();}
      if (prev.length == 0){prev=all.last();}
}

var move_prev = function()
{
   current.css("z-index", 0);
      
    current = prev;
    current_clone = current;
      prev = current_clone.prev();
      next = current_clone.next();
  
      if (prev.length == 0){prev=all.last();}
      if (next.length == 0){next=all.first();}
}

var slide_by_type = function(elem, type, val, opc) {
switch (type)
{
case 'opacity':
 $.fn.simple_al_slider_base.set_opacity('#'+elem.attr("id"), val[0]);
    if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(elem.attr("id"))).opacity;
    break;
case 'width':
 $.fn.simple_al_slider_base.set_scaleX('#'+elem.attr("id"), val[1], '50%, 50%');
    if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(elem.attr("id"))).width;

 $.fn.simple_al_slider_base.set_opacity('#'+elem.attr("id"), val[3]);
    if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(elem.attr("id"))).opacity;
    break;
case 'height':
 $.fn.simple_al_slider_base.set_scaleX('#'+elem.attr("id"), val[2], '50%, 50%');
    if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(elem.attr("id"))).height;

 $.fn.simple_al_slider_base.set_opacity('#'+elem.attr("id"), val[3]);
    if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(elem.attr("id"))).opacity;
    break;
}  
}
var slide_by_type_animate = function(elem, type, val, direction) {
var fw, cur_el;
   if (direction == 'forward')fw = 'show'; else fw = 'hide';
   if (direction == 'forward')cur_el = next; else cur_el = prev;
switch (type)
{
case 'opacity':
   elem.animate({"opacity":fw},settings.duration_effect,
   function(){
   slide_by_type(elem, type, [1, "1, 1", "1, 1", 1]);
    move_text_inside_animate(cur_el);
      (direction == 'forward') ? move_next() : move_prev();
     }
   );
    break;
case 'width':
   elem.animate({"width":fw},settings.duration_effect,
   function(){
   slide_by_type(elem, type, [1, "1, 1", "1, 1", 1]);
    move_text_inside_animate(cur_el);
      (direction == 'forward') ? move_next() : move_prev();
    }
   );
    break;
case 'height':
   elem.animate({"height":fw},settings.duration_effect,
   function(){
   slide_by_type(elem, type, [1, "1, 1", "1, 1", 1]);
    move_text_inside_animate(cur_el);
      (direction == 'forward') ? move_next() : move_prev();
   }
   );
    break;
}  
}

var move_text_inside = function(elem) {
  var page_id = elem.attr('id');
    var container_width = settings.container_id.width();
      var pos = settings.positions[page_id];

    $.each(pos, function(i, v){
        $.when($.fn.simple_al_slider_base.set_duration("#"+i, settings.duration_text_effect)).then(function(){
          if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(i)).transition;
          if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(i)).getPropertyValue('transition-duration');
          
          $.fn.simple_al_slider_base.set_translate("#"+i, (-container_width+v[0])+"px, "+0+"px", "50% 50%");
        });
        
    });
}

var move_text_inside_animate = function(elem) {
  var page_id = elem.attr('id');

    var container_width = settings.container_id.width();
      var pos = settings.positions[page_id];

    $.each(pos, function(i, v){
      $.fn.simple_al_slider_base.set_translate('#'+i, "0px, "+"0px", "50% 50%");
        if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(i)).transform;
      elem.find('#'+i).css('top', v[1]+'px');
       elem.find('#'+i).animate({"left":v[0]},settings.duration_effect,
        function(){
          
          }
        );

        });
        
}

var init_text_items = function(elem) {

  var page_id = elem.attr('id');
    var container_width = settings.container_id.width();
      var pos = settings.positions[page_id];

    $.each(pos, function(i, v){
    $('#'+i).css('display', 'block');
      $('#'+i).css('left', container_width+'px');
      $('#'+i).css('top', v[1]+'px');
      $.fn.simple_al_slider_base.set_translate('#'+i, 0+"px, "+0+"px", "50% 50%");
      if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(i)).transform;
    });
}
var check_slide = function(elem, type, defl) {
  return check_opacity(elem, defl);
}

var check_opacity = function(card_container, defl)
  {
var transf = card_container.css('-ms-filter');

  ((transf == undefined)||(transf == 'none')) ? transf = card_container.css('filter') : transf;
  ((transf == undefined)||(transf == 'none')) ? transf = card_container.css('-moz-opacity') : transf;
  ((transf == undefined)||(transf == 'none')) ? transf = card_container.css('-khtml-opacity') : transf;
  ((transf == undefined)||(transf == 'none')) ? transf = card_container.css('opacity') : transf;
   
  return transf;
  }

var animate_insteed_transform = function(elem, transf, duration, type, direction)
  {
      if (direction == 'forward')
        {
        slide_by_type_animate(elem, type, [1, "1, 1", "1, 1"], direction);
        }
        else
        {
        slide_by_type_animate(elem, type, [0, "0, 1", "1, 0"], direction);
        }
  }
var slideDefaultF = function(type, direction) {

 next.css("z-index", 1);
  init_text_items(next);
    current.find('.txt_container').css('display', 'none');
    next.find('.txt_container').css('display', 'block').css('z-index', 12);

if (browser_capabilities())
 {
    animate_insteed_transform(next, transf, settings.duration_effect, type, direction);
 }
 else
 {
slide_by_type(next, type, [0, "0, 1", "1, 0", 0.99]);
      next.css('display', 'block');

var transf = check_slide(next, type, '0');

  $.when($.fn.simple_al_slider_base.set_duration('#'+next.attr("id"), settings.duration_effect)).then(function(){

    if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(next.attr("id"))).transition;
    if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(next.attr("id"))).getPropertyValue('transition-duration');
    if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(next.attr("id"))).getPropertyValue('-webkit-transition-property');

slide_by_type(next, type, [1, "1, 1", "1, 1", 1]);

transf = check_slide(next, type, '0');

    $('#'+next.attr("id")).on("transitionend webkitTransitionEnd mozTransitionEnd oTransitionEnd MSTransitionEnd", function(){ 

    $.fn.simple_al_slider_base.unset_duration('#'+next.attr("id"));

        $('#'+next.attr("id")).off("transitionend webkitTransitionEnd mozTransitionEnd oTransitionEnd MSTransitionEnd");
      move_text_inside(next);
      move_next();
    });
    
    });
 }
}
var slideDefaultB = function(type, direction) {

 current.css("z-index", 1);
  init_text_items(prev);
    current.find('.txt_container').css('display', 'none');
    prev.find('.txt_container').css('display', 'block').css('z-index', 12);

if (browser_capabilities())
 {
  prev.show();
     animate_insteed_transform(current, transf, settings.duration_effect, type, direction);
 }
 else
 {
slide_by_type(current, type, [1, "1, 1", "1, 1", 0.99]);

var transf = check_slide(current, type, '0');

  $.when($.fn.simple_al_slider_base.set_duration('#'+current.attr("id"), settings.duration_effect)).then(function(){

      prev.css('display', 'block');  

    if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(current.attr("id"))).transition;
    if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(current.attr("id"))).getPropertyValue('transition-duration');
    if(typeof window.getComputedStyle === 'function')window.getComputedStyle(document.getElementById(current.attr("id"))).getPropertyValue('-webkit-transition-property');
    
slide_by_type(current, type, [0, "0, 1", "1, 0", 1]);

transf = check_slide(current, type, '0');

    $('#'+current.attr("id")).on("transitionend webkitTransitionEnd mozTransitionEnd oTransitionEnd MSTransitionEnd", function(){ 

    $.fn.simple_al_slider_base.unset_duration('#'+current.attr("id"));
        $('#'+current.attr("id")).off("transitionend webkitTransitionEnd mozTransitionEnd oTransitionEnd MSTransitionEnd");

      current.css('display', 'none');          

      slide_by_type(current, type, [1, "1, 1", "1, 1", 1]);
        move_text_inside(prev);    
        move_prev();
    });
    });
 }
}

var browser_capabilities = function() {

  browser_without_jquery();
  return ((( $.browser.msie ) && ( $.browser.version < 10 )) ||
            (( $.browser.chrome ) && ( $.browser.version < 4 )) ||
            (( $.browser.mozilla ) && ( $.browser.version < 3.5 )) ||
            (( $.browser.safari ) && ( $.browser.version < 3.2 )) ||
            (( $.browser.opera ) && ( $.browser.version < 10.5 )));
}

var browser_without_jquery = function() {

if(!jQuery.browser){

	jQuery.browser = {};
	jQuery.browser.mozilla = false;
	jQuery.browser.webkit = false;
	jQuery.browser.opera = false;
	jQuery.browser.safari = false;
	jQuery.browser.chrome = false;
	jQuery.browser.msie = false;
	jQuery.browser.android = false;
	jQuery.browser.blackberry = false;
	jQuery.browser.ios = false;
	jQuery.browser.operaMobile = false;
	jQuery.browser.windowsMobile = false;
	jQuery.browser.mobile = false;

	var nAgt = navigator.userAgent;
	jQuery.browser.ua = nAgt;

	jQuery.browser.name  = navigator.appName;
	jQuery.browser.fullVersion  = ''+parseFloat(navigator.appVersion);
	jQuery.browser.majorVersion = parseInt(navigator.appVersion,10);
	var nameOffset,verOffset,ix;

// In Opera, the true version is after "Opera" or after "Version"
	if (((verOffset=nAgt.indexOf("Opera"))!=-1)||((verOffset2=nAgt.indexOf("OPR"))!=-1)) {
		jQuery.browser.opera = true;
		jQuery.browser.name = "Opera";
		console.log(nAgt, verOffset);
		if (verOffset != -1)
		jQuery.browser.fullVersion = nAgt.substring(verOffset+6);
		if (verOffset2 != -1)
		jQuery.browser.fullVersion = nAgt.substring(verOffset2+4);
		if (verOffset == -1)
      verOffset = verOffset2;
		if ((verOffset=nAgt.indexOf("Version"))!=-1)
			jQuery.browser.fullVersion = nAgt.substring(verOffset+8);
	}

// In MSIE < 11, the true version is after "MSIE" in userAgent
	else if ( (verOffset=nAgt.indexOf("MSIE"))!=-1) {
		jQuery.browser.msie = true;
		jQuery.browser.name = "Microsoft Internet Explorer";
		jQuery.browser.fullVersion = nAgt.substring(verOffset+5);
	}

// In TRIDENT (IE11) => 11, the true version is after "rv:" in userAgent
	else if (nAgt.indexOf("Trident")!=-1 ) {
		jQuery.browser.msie = true;
		jQuery.browser.name = "Microsoft Internet Explorer";
		var start = nAgt.indexOf("rv:")+3;
		var end = start+4;
		jQuery.browser.fullVersion = nAgt.substring(start,end);
	}

// In Chrome, the true version is after "Chrome"
	else if ((verOffset=nAgt.indexOf("Chrome"))!=-1) {
		jQuery.browser.webkit = true;
		jQuery.browser.chrome = true;
		jQuery.browser.name = "Chrome";
		jQuery.browser.fullVersion = nAgt.substring(verOffset+7);
	}
// In Safari, the true version is after "Safari" or after "Version"
	else if ((verOffset=nAgt.indexOf("Safari"))!=-1) {
		jQuery.browser.webkit = true;
		jQuery.browser.safari = true;
		jQuery.browser.name = "Safari";
		jQuery.browser.fullVersion = nAgt.substring(verOffset+7);
		if ((verOffset=nAgt.indexOf("Version"))!=-1)
			jQuery.browser.fullVersion = nAgt.substring(verOffset+8);
	}
// In Safari, the true version is after "Safari" or after "Version"
	else if ((verOffset=nAgt.indexOf("AppleWebkit"))!=-1) {
		jQuery.browser.webkit = true;
		jQuery.browser.name = "Safari";
		jQuery.browser.fullVersion = nAgt.substring(verOffset+7);
		if ((verOffset=nAgt.indexOf("Version"))!=-1)
			jQuery.browser.fullVersion = nAgt.substring(verOffset+8);
	}
// In Firefox, the true version is after "Firefox"
	else if ((verOffset=nAgt.indexOf("Firefox"))!=-1) {
		jQuery.browser.mozilla = true;
		jQuery.browser.name = "Firefox";
		jQuery.browser.fullVersion = nAgt.substring(verOffset+8);
	}
// In most other browsers, "name/version" is at the end of userAgent
	else if ( (nameOffset=nAgt.lastIndexOf(' ')+1) < (verOffset=nAgt.lastIndexOf('/')) ){
		jQuery.browser.name = nAgt.substring(nameOffset,verOffset);
		jQuery.browser.fullVersion = nAgt.substring(verOffset+1);
		if (jQuery.browser.name.toLowerCase()==jQuery.browser.name.toUpperCase()) {
			jQuery.browser.name = navigator.appName;
		}
	}

	/*Check all mobile environments*/
	jQuery.browser.android = (/Android/i).test(nAgt);
	jQuery.browser.blackberry = (/BlackBerry/i).test(nAgt);
	jQuery.browser.ios = (/iPhone|iPad|iPod/i).test(nAgt);
	jQuery.browser.operaMobile = (/Opera Mini/i).test(nAgt);
	jQuery.browser.windowsMobile = (/IEMobile/i).test(nAgt);
	jQuery.browser.mobile = jQuery.browser.android || jQuery.browser.blackberry || jQuery.browser.ios || jQuery.browser.windowsMobile || jQuery.browser.operaMobile;


// trim the fullVersion string at semicolon/space if present
	if ((ix=jQuery.browser.fullVersion.indexOf(";"))!=-1)
		jQuery.browser.fullVersion=jQuery.browser.fullVersion.substring(0,ix);
	if ((ix=jQuery.browser.fullVersion.indexOf(" "))!=-1)
		jQuery.browser.fullVersion=jQuery.browser.fullVersion.substring(0,ix);

	jQuery.browser.majorVersion = parseInt(''+jQuery.browser.fullVersion,10);
	if (isNaN(jQuery.browser.majorVersion)) {
		jQuery.browser.fullVersion  = ''+parseFloat(navigator.appVersion);
		jQuery.browser.majorVersion = parseInt(navigator.appVersion,10);
	}
	jQuery.browser.version = jQuery.browser.majorVersion;
}
}

var processing_default = function(direction, type) {
if (allow)
  {
  allow = false;
  setTimeout(setAllow, parseInt(settings.duration_effect,10)+parseInt(settings.duration_text_effect,10)+100);
  
  if (direction)var dr = direction; else var dr = settings.direction;

  switch (dr)
  {
  case 'forward':
    slideDefaultF(settings.action, dr);break;
  case 'backward':
    slideDefaultB(settings.action, dr);break;
  }
         //texts_layer(direction);
  }
  return true;
}

var resize_all = function()
  {
  if (settings.fullscreen)
    resize_slider_fullscreen();
  else
    resize_slider();
  }
var resize_slider_fullscreen = function()
  {
    var needed_parent = $(window);
    var koef = needed_parent.width()/settings.container_id.innerWidth();
      $.fn.simple_al_slider_base.set_resize_by_scale(settings.container_id.parent(), koef, "0 0 0");
  }
var resize_slider = function()
  {
  var koef;
    var needed_parent = slider_inner.parent().parent();
    if ((slider_inner.width() != needed_parent.width()))
    if (settings.parent_params[0] > needed_parent.width())
      {
      koef = needed_parent.width()/slider_inner.width();
      }
      else
      {
        koef = settings.parent_params[0]/slider_inner.width();
      }
        console.log(slider_inner.attr("id"), koef);
      $.fn.simple_al_slider_base.set_resize_by_scale(slider_inner.parent(), koef, "0 0 0");
  }
var setAllow = function() {
allow = true;
}
var processing = function()
{
   intervalID[settings.key_interval] = window.setInterval(processing_default, settings.duration_action, settings.direction, settings.action);
}
var buttons_apply = function()
{
if ((settings.main_arrows)&&(settings.frame == 'parent'))
  {
  var swp_container = slider_inner;
    swp_container = swp_container.parent();
    
if (settings.set_top_buttons == 0)
  {
    var arrow_width = (swp_container.width()/1600)*50;
    var arrow_hotst = arrow_width + 20;
    var top_btns = parseInt(swp_container.css('height'),10)-arrow_hotst;
  }
  else
  {
    var top_btns = settings.set_top_buttons;
  }
var prefix = Math.round(Math.random()*1000);
if ((settings.set_buttons != 0))
    {
      swp_container.append("<div class='simple_al_arrow_left' id='simple_al_arrow_left"+prefix+"' style='top:"+(top_btns)+"px;'><img src='"+simple_al_WPURLS.pluginurl+"../images/arrow_left_0"+settings.set_buttons+".png'  width='"+arrow_width+"' height='"+arrow_width+"' style='width:"+arrow_width+"px;height:"+arrow_width+"px;'></div><div class='simple_al_arrow_right' id='simple_al_arrow_right"+prefix+"' style='top:"+(top_btns)+"px;width:"+arrow_width+"px;height:"+arrow_width+"px;'><img src='"+simple_al_WPURLS.pluginurl+"../images/arrow_right_0"+settings.set_buttons+".png' style='width:"+arrow_width+"px;height:"+arrow_width+"px;'></div>");
        $('#simple_al_arrow_right'+prefix).css('left', $('#simple_al_arrow_right'+prefix).parent().width()-5-$('#simple_al_arrow_right'+prefix).width());
          $.fn.simple_al_slider_base.set_opacity('#simple_al_arrow_left'+prefix, 0.4);
          $.fn.simple_al_slider_base.set_opacity('#simple_al_arrow_right'+prefix, 0.4);
    }
          $('#simple_al_arrow_left'+prefix).hide();
          $('#simple_al_arrow_right'+prefix).hide();

      swp_container.bind('mouseover', function() {
          $('#simple_al_arrow_left'+prefix).show();
          $('#simple_al_arrow_right'+prefix).show();
          });
      swp_container.bind('mouseleave', function() {
          $('#simple_al_arrow_left'+prefix).hide();
          $('#simple_al_arrow_right'+prefix).hide();
          });

        $("#simple_al_arrow_right"+prefix).click(function () {
          user_choose('forward');
        });

        $("#simple_al_arrow_left"+prefix).click(function () {
          user_choose('backward');
        });
  }
}
var user_choose = function(type)
  {
    processing_default(type, settings.action);
    settings.stop();
      settings.start();
  }
  
if (intervalID === undefined)
  var intervalID = [];

  init_text_items(current);
    current.show();
      buttons_apply();
        resize_all();

        if (current.css('transform') != undefined)
          move_text_inside(current);
          else
          move_text_inside_animate(current);

  processing();
  
  return settings;
}
})(jQuery);
