$(".builds").ready(function(){
  console.log("build.js loaded")

  $(function(){
    $('#new-comment-container').hide()
    
    $(".js-more").on('click', function(){
      console.log("clicked")
      var id = $(this).data("id");
      $.get("/builds/" + id + ".json", function(data){      
        $("#body-" + id).html(data["description"]);      
      });
    });

    $('.show-form').on('click', function(e){
      e.preventDefault()
      $('.show-form').hide()
      $('#new-comment-container').slideDown('slow')
    });
  });
});

