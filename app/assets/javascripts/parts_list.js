console.log("parts_list.js loaded")
class partsList{
  constructor(attributes){
  this.name = attributes.name;
  this.cpu = attributes.cpu;
  this.cpu_cooler = attributes.cpu_cooler;
  this.motherboard = attributes.motherboard;
  this.storage = attributes.storage;
  this.video_card = attributes.video_card;
  this.monitor = attributes.monitor;
  this.power_supply = attributes.power_supply;
  this.operating_system = attributes.operating_system;
  this.id = attributes.id;
  this.case = attributes.case;
  this.user = attributes.user.username;
  this.userId = attributes.user.id;
  this.created_at = attributes.created_at.slice(0,10);
  }
}

$(function(){ 
  var uid = parseInt($('#user').attr("data-user_id"))
  console.log("id:", uid)
  
  $.get("/users/" + uid + "/parts_lists.json", function(data){
  console.log("this:", this)
  console.log("data:", data)

  data.forEach(function(parts_list) {
    var new_pl = new partsList(parts_list);
    var new_pl_string = HandlebarsTemplates['parts_lists/parts_list'](new_pl)
    $(".parts-lists").append(new_pl_string)
  });

  // $.post(action, params)
  // .success(function(json){
  // console.log("json:", json)
  
  // var parts_list = new partsList(json)
  // var new_comment_string = HandlebarsTemplates['comments/comment'](comment)
  // console.log("comment:", comment)
  // console.log("new_comment_string:", new_comment_string)







  // for(var i = 0; i < data.length; i++) {
  //   var d = data[i];
  //   var url_id = parseInt($('#user').attr("data-user_id"))
  //   var url = url_id + '/parts_lists/' + d.id
  //   console.log('id: ' + url_id + ' name: ' + d.name + ' url: ' + url );
  //   $(".parts-lists").append("<li class='list-group-item'><a href='"+ url +"'>"+d.name+"</a></li>")
  // };

  });
});
