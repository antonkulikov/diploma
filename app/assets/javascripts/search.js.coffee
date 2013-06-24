$ ->
  $('#search fieldset input').keyup ->
    $.get $('#search').attr('action'), $('#search').serialize(), null, 'script'
    false

  $('#search').submit ->
    false

  false
