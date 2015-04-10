# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

add_on_hover_handler = ->
  $('.floating-button.add-button').unbind('hover')
  $('.floating-button.add-button').hover(
    (
      ->
        $('.hover-area').removeClass('hidden')
        $('.floating-button.show-on-hover').removeClass('hidden')
        $('.hover-area').hover(
          -> $('.floating-button.show-on-hover').removeClass('hidden'),
          (
            ->
              $('.hover-area').addClass('hidden')
              $('.floating-button.show-on-hover').addClass('hidden')
          )
        )
    ),
    (-> return false)
  )

$(document).on 'ready page:load', ->
  add_on_hover_handler()

$(document).ajaxComplete ->
  add_on_hover_handler()
