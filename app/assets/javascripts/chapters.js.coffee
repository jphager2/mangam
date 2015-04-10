# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

hide_floating_buttons = ->
  $('.hover-area').addClass('hidden')

show_floating_buttons = ->
  $('.hover-area').removeClass('hidden')

add_on_hover_handler = (selector) ->
  unless selector == '.hover-area'
    add_on_hover_handler('.hover-area')

  $(selector).hover(
    show_floating_buttons, hide_floating_buttons
  )

$(document).on 'ready page:load', ->
  add_on_hover_handler('.floating-button.add-button')

$(document).ajaxComplete ->
  add_on_hover_handler('.floating-button.add-button')
