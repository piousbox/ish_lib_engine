$ ->
  addPhoto = (file) ->
    console.log(file)
    console.log('lets add file')
    $('#photos').append('<li><img src="'+file.thumbnail_url+'" /></li>')

  removePhoto = (element) ->
    $.ajax
      url: element.data('delete-url')
      type: 'post'
      dataType: 'script'
      data: { '_method': 'delete' }
      success: ->
        element.fadeOut()

  renderPhotos = (photos) ->
    addPhoto photo for photo in photos

  $('#fileupload').change ->
    $('.loading-a').show()

  $('#fileupload').fileupload
    dataType: 'json'
    url: $('#fileupload').data('photos-path')
    done: (e, data) ->
      addPhoto photo for photo in data.result
      $('.loading-a').hide()

  if $('#photos').length
    $.getJSON $('#photos').data('json-url'), (results) ->
      renderPhotos results.photos

  $('#photos').on "click", ".photo-delete", (event) ->
    removePhoto $(@).closest(".photo")
    event.preventDefault()
