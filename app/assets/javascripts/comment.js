$(function() {
  initPage();
});
$(window).bind('turbolinks:load', function() {
  initPage();
});
function initPage() {

  $(function(){
    $('.new_comment').on('submit', function(e){
      e.preventDefault();
      console.log("stopped default")
    })
  })
}