$(function(){
  $('#btn-themes').click(function(){
    if ($('#results-themes').val() == '1')
      $('#results-themes').val('0');
    else
      $('#results-themes').val('1');
    $(this).button('toggle');
    return false;
  });
  
  $('#btn-questions').click(function(){
    if ($('#results-questions').val() == '1')
      $('#results-questions').val('0');
    else
      $('#results-questions').val('1');
    $(this).button('toggle');
    return false;
  });
  
  $('#btn-detaled').click(function(){
    if ($('#results-detaled').val() == '1')
      $('#results-detaled').val('0');
    else
      $('#results-detaled').val('1');
    $(this).button('toggle');
    return false;
  });
  
  if ($('#results-themes').val() == '1')
    $('#btn-themes').button('toggle');
  
  if ($('#results-questions').val() == '1')
    $('#btn-questions').button('toggle');
  
  if ($('#results-detaled').val() == '1')
    $('#btn-detaled').button('toggle');
  return false;
});


function autocompleteField() {
  $('.autocomplete-field').autocomplete({
    source: '/repository_themes.json',
    minLength: 0
  });
};