console.log("js-more loaded")

$(function(){
  $(".js-more").on('click', function(){
    var id = $(this).data("id");
    $.get("/builds/" + id + ".json", function(data){      
      $("#body-" + id).html(data["description"]);      
    });
  });

$('#new-comment-container').hide()

$('.show-form').on('click', (e) =>{
  e.preventDefault()
  $('.show-form').hide()
  $('#new-comment-container').slideDown('slow')
})

});

