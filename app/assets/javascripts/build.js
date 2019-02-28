$(".builds").ready(function(){
  console.log("build.js loaded")

  $(function(){
    $('#new-comment-container').hide()
    
    $(".js-more").on('click', function(){
      console.log("clicked")
      var id = $(this).data("id");
      $.get("/builds/" + id + ".json", data => {      
        $("#body-" + id).html(data["description"]);
        // $('.list-comments-container'). 
        console.log(data['comments'])
        var commentsArray = data['comments']
        commentsArray.forEach(function(comment){
         
         $("ul.comments-list").append(`<li>${comment['body']}</li>`)
        })
      });
    });

    $('.show-form').on('click', e => {
      e.preventDefault()
      $('.show-form').hide()
      $('#new-comment-container').slideDown('slow')
    });
  });
});

