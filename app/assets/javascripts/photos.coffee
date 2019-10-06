# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.placeCard').on 'click', ->
    $('.imagepreview').attr 'src', $(this).find('img').attr('src')
    $('#imagemodal').modal 'show'
    return
  return