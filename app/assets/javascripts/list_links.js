$(document).ready(function(){
  //_.forEach( $.get('/api/v1/links'), setup(link) )
})

// function setup(link){
//   renderLink(link.id)
//   attachEvents(link)
// }

function attachEvents(raw_link) {
  attachEditEvent(raw_link)
  attachDeleteEvent(raw_link)
  attachReadToggleEvent(raw_link)
}
