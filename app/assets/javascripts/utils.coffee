
$(document).ready ->

  $('.addToggle').click ->
    $(this).next().toggle(500)
    
  $('.help_toggle').mouseenter ->
    $(this).next().show()
  $('.help_toggle').mouseleave ->
    $(this).next().hide()

  $("#layout_set").change ->
      $("#set_layout form").submit()
  
  if $(".tinymce").length > 0
    tinymce.init
      mode: "specific_textareas",
      editor_selector: 'tinymce',
      plugins: 'link'

  if $("#temp_layout").length > 0
    MyApp.addInitializer (options) ->
      venues_view = new Views.Venues.Index
        collection: options.venues

      MyApp.right_region.show( venues_view )

  if $('#carousel').length > 0
    $('#carousel').infiniteCarousel({})

  if $( "#accordion" ).length > 0
    $( "#accordion" ).accordion()

  if $( ".fancybox" ).length > 0
    $( ".fancybox" ).fancybox()

