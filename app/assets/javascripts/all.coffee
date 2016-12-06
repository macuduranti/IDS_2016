# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', -> # cambiar por jQuery ->
  $('#resueltas-link').click (event) ->
    event.preventDefault()
    $('#resueltas-seccion').fadeToggle()
    $('#pendientes-seccion').toggle()
  $('#pendientes-link').click (event) ->
    event.preventDefault()
    $('#pendientes-seccion').fadeToggle()
    $('#resueltas-seccion').toggle()
  $('#comentarios').on 'click' , '.respuestas-link' , (event) ->
    event.preventDefault()
    commentSectionId = $(this).data('sectionId')
    $('#' + commentSectionId).fadeToggle()
#$(document).ready(ready) # sacar
#$(document).on('page:load', ready) # sacar