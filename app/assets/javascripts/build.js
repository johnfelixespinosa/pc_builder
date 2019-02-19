// $(function() {
//   initPage();
// });
// $(window).bind('turbolinks:load', function() {
//   initPage();
// });
// function initPage() {
  
$(function(){
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/builds/" + id + ".json", function(data) {
      //console.log("hello")
      $("#body-" + id).html(data["description"]);
      // console.log(data["description"])
    });
  });
});
//}


