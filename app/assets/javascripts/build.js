console.log("js-more loaded")
$(function(){
  $(".js-more").on('click', function(){
    var id = $(this).data("id");
    $.get("/builds/" + id + ".json", function(data){      
      $("#body-" + id).html(data["description"]);      
    });
  });
});