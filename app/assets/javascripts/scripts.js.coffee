$ ->
  $('#btn-themes').click ->
    if $('#results-themes').val() == '1'
      $('#results-themes').val('0')
    else
      $('#results-themes').val('1')
    $(this).button 'toggle'
    false  
  
  $('#btn-questions').click ->
    if $('#results-questions').val() == '1'
      $('#results-questions').val('0')
    else
      $('#results-questions').val('1')
    $(this).button 'toggle'
    false
  
  $('#btn-detaled').click ->
    if $('#results-detaled').val() == '1'
      $('#results-detaled').val('0')
    else
      $('#results-detaled').val('1')
    $(this).button 'toggle'
    false
  
  if $('#results-themes').val() == '1'
    $('#btn-themes').button 'toggle'
  
  if $('#results-questions').val() == '1'
    $('#btn-questions').button 'toggle'
  
  if $('#results-detaled').val() == '1'
    $('#btn-detaled').button 'toggle'
  
  false
