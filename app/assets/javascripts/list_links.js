$(document).ready(function(){
  //_.forEach( $.get('/api/v1/links'), setup(link) )
})

// function setup(link){
//   renderLink(link.id)
//   attachEvents(link)
// }

function attachEvents(raw_link) {
  debugger
  attachEditEvent()
  attachDeleteEvent()
  attachReadToggleEvent()
}
