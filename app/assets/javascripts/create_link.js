var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $newLinkTitle = $("#link_title");
  $newLinkUrl  = $("#link_url");

  $("#submit_link").on('click', createLink);
})

function createLink (event){
  event.preventDefault();

  console.log("win")

  var link = getLinkData();

  $.post("/api/v1/links", link)
   .then( renderLink )
   .then( attachEvents )
   .fail( displayFailure )
 }

function getLinkData() {
 return {
   title: $newLinkTitle.val(),
   url: $newLinkUrl.val()
 }
}

function renderLink(link){
  $("#links_list").append( linkHTML(link) )
  clearLink();
}

function linkHTML(link) {

    var content = `<div class='link' data-id='${link.id}' id="link-${link.id}">
              <p class='link-title' contenteditable=true>${ link.title }</p>
              <p class='link-url' contenteditable=true>${ link.url }</p>
              <p class="link_read">
                ${ readStatus(link.read) }
              </p>
              <p class="link_buttons">
              <button class="mark-as-read">${buttonStatus(link.read)}</button>
                </p>
                </div>`

    return content
}

function clearLink() {
  $newLinkTitle.val("");
  $newLinkUrl.val("");
}

function displayFailure(failureData){
  console.log("FAILED attempt to create new Link: " + failureData.responseText);
}

function readStatus(read){
  if (read) {
    return "Read"
  } else {
    return "Unread"
  }
}

function buttonStatus(read){
  if (read) {
    return "Mark as Unread"
  } else {
    return "Mark as Read"
  }
}
