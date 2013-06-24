$ ->
  discipline_id = $('#block_discipline_name').data('discipline-id')
  $('#block_group_tokens').tokenInput "/groups.json?discipline_id=#{discipline_id}",
    crossDomain: false
    prePopulate: $('#block_group_tokens').data('pre')
    queryParam: 'name'
    preventDuplicates: true
    theme: 'facebook'
    hintText: 'Введите номер группы'
    noResultsText: 'Не найдено'
    searchingText: 'Поиск...'

  $('#block_discipline_name').autocomplete
    source: '/disciplines.json'

  $('#block_year').autocomplete
    source: 'year.json'

  $('.sortable').sortable
    axis: 'y'
    items: 'li'
    update: ->
      $.post $(this).data('update-url'), $(this).sortable('serialize')
      $.get $(".scripts_#{$(this).data('block-id')}").data('url'), $(".scripts_#{$(this).data('block-id')}").data('params'), null, 'script'

  $('.modal').modal
    backdrop: true
    keyboard: true
    show: false
    
  $('#accordionblock').collapse

  false
