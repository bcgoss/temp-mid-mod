$(document).ready(function(){
  $.get('/api/v1/links')
    .forEach()
    .then( renderLink )
    .then( attachEvents )
    .failur( displayFailure )
})

function attachEvents(raw_link) {
  $(`#link-${raw_link.id}`).find('.link_read')
}
