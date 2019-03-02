$(".comments").ready(function(){
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

  Comment.prototype.toLi = function(){
    return `<li class="list-group-item">${this.body}<br>
    <small>Submitted ${this.created_at} by 
    <a href="/users/${this.user_id}">${this.username}</a></small>
  </li>`
  }
  Comment.prototype.toString = function() {
    return HandlebarsTemplates['comments/comment'](this)
  };

  $(function(){
    $("#new_comment").on("submit", function(e){
      e.preventDefault()
      
      var $form = $(this);
      var action = this.action
      debugger
      var params = $form.serialize()
      console.log("this:", this.action)
      console.log("action:", action)
      console.log("params:", params)

      $.post(action, params)
      .success( json => {
      console.log("json:", json)
      
      var comment = new Comment(json)
      var newCommentString = comment.toLi()
      console.log("comment:", comment)
      console.log("new_comment_string:", newCommentString)

      $("ul.comments-list").append(newCommentString)
      
      });
    });
  });
});

