console.log("likes.js loaded")

$(function(){
  $(".button_to").on("submit", function(e){
    e.preventDefault()
    console.log("this:")
    var $form = $(this);
    var action = $form.attr("action")
    var params = $form.serialize()
    console.log("this:", this)
    console.log("action:", action)
    console.log("params:", params)

    $.post(action, params)
    .success(function(json){
    console.log("json:", json)
    });
  });
});

