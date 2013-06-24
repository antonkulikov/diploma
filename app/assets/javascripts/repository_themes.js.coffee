$ ->
  $('.discipline').click ->
    $.get $('#discipline-themes').data('url'), $(this).data('params'), null, 'script'
    false

  false
