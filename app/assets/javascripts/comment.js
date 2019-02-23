console.log("comments.js loaded")
class Comment{
  constructor(attributes){
  this.body = attributes.body;
  this.created_at = attributes.created_at.slice(0,10);
  this.user_id = attributes.user_id;
  this.username = attributes.user.username
  this.build_id = attributes.build_id;
  }

}

$(function(){
  $("#new_comment").on("submit", function(e){
    e.preventDefault()
    
    var $form = $(this);
    var action = $form.attr("action")
    var params = $form.serialize()
    console.log("this:", this)
    console.log("action:", action)
    console.log("params:", params)

    $.post(action, params)
    .success(function(json){
    console.log("json:", json)
    
    var comment = new Comment(json)
    var new_comment_string = HandlebarsTemplates['comments/comments'](comment)
    console.log("comment:", comment)
    console.log("new_comment_string:", new_comment_string)

    $("ul.comments-list").append(new_comment_string)
    
    });
  });
});

