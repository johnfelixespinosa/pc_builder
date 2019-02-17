$(function() {
  initPage();
});
$(window).bind('turbolinks:load', function() {
  initPage();
});
function initPage() {

  var Comment = function(body, created_at){
    this.body = body;
    this.created_at = created_at.slice(0,10);
    this.user_id = user_id
  };

  $(function(){
    $("form").submit(function(event) {
      event.preventDefault();
      var values = $(this).serialize();
      var url = $(this).attr("action");

      console.log(url);
      console.log(values)

      var posting = $.post( url, values);
      posting.done(function(data){
        console.log(data.created_at);
        comment = new Comment(data.body, data.created_at, data.user_id);
        comment.addComment();
      });

      console.log(url);
      console.log(values)
      
      

      // createComment(url, values);
    });
  });



  
}