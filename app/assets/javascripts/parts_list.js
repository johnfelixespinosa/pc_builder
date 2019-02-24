console.log("parts_list.js loaded")

$(function(){ 
  var uid = parseInt($('#user').attr("data-user_id"))
  console.log("id:", uid)
  
  $.get("/users/" + uid + "/parts_lists.json", function(data){
  console.log("this:", this)
  console.log("data:", data)

  for(var i = 0; i < data.length; i++) {
    var d = data[i];
    var url_id = parseInt($('#user').attr("data-user_id"))
    var url = url_id + '/parts_lists/' + d.id
    console.log('id: ' + url_id + ' name: ' + d.name + ' url: ' + url );
    $(".list-group").append("<li class='list-group-item'><a href='"+ url +"'>"+d.name+"</a></li>")
  };

  });
});
