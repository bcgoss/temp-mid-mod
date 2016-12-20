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
  // clearLink();
}

function linkHTML(link) {

    var content = `<div class='link' data-id='${link.id}' id="link-${link.id}">
              <p class='link-title' contenteditable=true>${ link.title }</p>
              <p class='link-url' contenteditable=true>${ link.url }</p>
              <p class="link_read">
                ${ link.read }
              </p>
              <p class="link_buttons">
              `
    var button = ''
    if (link.read) {
      button = `<button class="mark-as-read">Mark As Read</button>
                </p>
                </div>`
    }else {
      button = `<button class="mark-as-read">Mark As Unead</button>
                </p>
                </div>`
    }
    return content + button
}

function clearLink() {
  $newLinkTitle.val("");
  $newLinkUrl.val("");
}

function displayFailure(failureData){
  console.log("FAILED attempt to create new Link: " + failureData.responseText);
}
