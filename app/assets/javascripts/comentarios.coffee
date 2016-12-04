jQuery -> # cambiar por jQuery ->
  $('#resueltas-link').click (event) ->
    event.preventDefault()
    $('#resueltas-seccion').fadeToggle()
    $('#pendientes-seccion').toggle()
  $('#pendientes-link').click (event) ->
    event.preventDefault()
    $('#pendientes-seccion').fadeToggle()
    $('#resueltas-seccion').toggle()
#$(document).ready(ready) # sacar
#$(document).on('page:load', ready) # sacar