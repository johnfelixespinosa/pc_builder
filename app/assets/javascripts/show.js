console.log("show.js loaded")

$(function(){

  $(".show-builds").on('click', function(){
    console.log("clicked")    
    var id = $(this).data("id");
    $.get("/users/" + id + "/builds.json", function(data){      
      
    });
  });
});
