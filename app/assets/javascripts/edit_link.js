function attachEditEvent(raw_link){

  var thisLink = $(`#link-${raw_link.id}`)
  $(thisLink).find('.link-title').on('focusout', editLink(thisLink))
  $(thisLink).find('.link-body').on('focusout', editLink(thisLink))
}

function editLink(thisLink){
}
