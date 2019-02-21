console.log("comments.js loaded")

function Comment(attributes){
  this.body = attributes.body;
  this.created_at = attributes.created_at.slice(0,10);
  this.user_id = attributes.user_id;
  this.username = attributes.user.username
  this.build_id = attributes.build_id;
}

$(function(){
  Comment.templateSource = $("#comment-template").html()
  Comment.template = Handlebars.compile(Comment.templateSource);
})

Comment.prototype.renderLi = function(){
  return Comment.template(this)
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
    var commentLi = comment.renderLi()
    console.log("comment:", comment)
    console.log("commentLI:", commentLi)

    $("ul.comments-list").append(commentLi)
    
    });
  });
});

