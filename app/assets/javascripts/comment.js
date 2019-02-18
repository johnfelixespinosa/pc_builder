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
    })
    .error(function(response){
      console.log("broke", response)
    })
  })
})