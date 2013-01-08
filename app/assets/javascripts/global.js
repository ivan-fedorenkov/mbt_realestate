$(function() {
  // Fix input element click problem
  $('.dropdown-menu input, .dropdown-menu label').click(function(e) {
    e.stopPropagation();
  });
  if($('#showcase').length == 1) {
    $('#showcase-loader').hide();
    $('.showcase').show();
    $("#showcase").awShowcase(
    {
      content_width:      620,
      content_height:     410,
      fit_to_parent:      false,
      auto:         false,
      interval:       3000,
      continuous:       false,
      loading:        true,
      tooltip_width:      200,
      tooltip_icon_width:   32,
      tooltip_icon_height:  32,
      tooltip_offsetx:    18,
      tooltip_offsety:    0,
      arrows:         true,
      buttons:        false,
      btn_numbers:      false,
      keybord_keys:     true,
      mousetrace:       false, /* Trace x and y coordinates for the mouse */
      pauseonover:      true,
      stoponclick:      true,
      transition:       'hslide', /* hslide/vslide/fade */
      transition_delay:   300,
      transition_speed:   500,
      show_caption:     'onhover', /* onload/onhover/show */
      thumbnails:       true,
      thumbnails_position:  'outside-last', /* outside-last/outside-first/inside-last/inside-first */
      thumbnails_direction: 'horizontal', /* vertical/horizontal */
      thumbnails_slidex:    0, /* 0 = auto / 1 = slide one thumbnail / 2 = slide two thumbnails / etc. */
      dynamic_height:     false, /* For dynamic height to work in webkit you need to set the width and height of js/jquery.aw-showcase/images in the source. Usually works to only set the dimension of the first slide in the showcase. */
      speed_change:     true, /* Set to true to prevent users from swithing more then one slide at once. */
      viewline:       false /* If set to true content_width, thumbnails, transition and dynamic_height will be disabled. As for dynamic height you need to set the width and height of js/jquery.aw-showcase/images in the source. */
    });
    
    $("#showcase").hover(
    function () {
      $('.showcase-arrow-previous, .showcase-arrow-next').fadeIn();
    }, 
    function () {
      $('.showcase-arrow-previous, .showcase-arrow-next').fadeOut();
    }
    );
  }  
  
  if($('#carousel').length == 1) {
    $('#carousel-loader').hide();
    $('.showcase').show();
    $("#carousel").awShowcase(
    {
      content_width:      590,
      content_height:     326,
      fit_to_parent:      false,
      auto:         true,
      interval:       3000,
      continuous:       true,
      loading:        true,
      tooltip_width:      200,
      tooltip_icon_width:   32,
      tooltip_icon_height:  32,
      tooltip_offsetx:    18,
      tooltip_offsety:    0,
      arrows:         true,
      buttons:        false,
      btn_numbers:      false,
      keybord_keys:     true,
      mousetrace:       false, /* Trace x and y coordinates for the mouse */
      pauseonover:      true,
      stoponclick:      true,
      transition:       'hslide', /* hslide/vslide/fade */
      transition_delay:   300,
      transition_speed:   500,
      show_caption:     'show', /* onload/onhover/show */
      thumbnails:       false,
      thumbnails_position:  'outside-last', /* outside-last/outside-first/inside-last/inside-first */
      thumbnails_direction: 'horizontal', /* vertical/horizontal */
      thumbnails_slidex:    0, /* 0 = auto / 1 = slide one thumbnail / 2 = slide two thumbnails / etc. */
      dynamic_height:     false, /* For dynamic height to work in webkit you need to set the width and height of js/jquery.aw-showcase/images in the source. Usually works to only set the dimension of the first slide in the showcase. */
      speed_change:     true, /* Set to true to prevent users from swithing more then one slide at once. */
      viewline:       false /* If set to true content_width, thumbnails, transition and dynamic_height will be disabled. As for dynamic height you need to set the width and height of js/jquery.aw-showcase/images in the source. */
    });
    
    $("#carousel").hover(
    function () {
      $('.showcase-arrow-previous, .showcase-arrow-next').fadeIn();
    }, 
    function () {
      $('.showcase-arrow-previous, .showcase-arrow-next').fadeOut();
    }
    );

  }

});