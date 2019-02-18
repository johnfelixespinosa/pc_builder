function Comment(attributes){
  this.body = attributes.body;
  this.created_at = attributes.created_at.slice(0,10);
  this.user_id = attributes.user_id;
}

$(function(){
  Comment.templateSource = $("comment-template").html()
  Comment.template = Handlebars.compile(Comment.templateSource);
})

  // renderLi(){
  //   return HandlebarsTemplates['comments-template']({comment: this})
  // }
Comment.prototype.renderLi = function(){
  return Comment.template(this)
}


$(function(){
  $("form#new_comment").on("submit", function(e){
    e.preventDefault()
    // console.log("Stop")
    var $form = $(this);
    var action = $form.attr("action")
    var params = $form.serialize()
    
    //console.log(params)
    $.post(action, params)
    .success(function(json){
    console.log(json)
    var comment = new Comment(json)
    var commentLi = comment.renderLi()

    $("ul.list-group").append(commentLi)
      
    })
    .error(function(response){
      console.log("broke", response)
    })
  })
})

{/* <li class="list-group-item">try<br>
  <small>Submitted 1 minute ago by 
  <a href="/users/6">John espinosa</a></small>
</li> */}