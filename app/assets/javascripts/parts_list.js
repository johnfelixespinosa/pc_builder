console.log("parts_list.js loaded")
class PartsList{
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
  };
};

PartsList.prototype.toString = function() {
  return HandlebarsTemplates['parts_lists/parts_list'](this)
};

$(function(){ 
  const uid = parseInt($('#user').attr("data-user_id"))
  console.log("userId:", uid)
  
  let jsonData = []
  getData();
  
  function getData(){
    $.get("/users/" + uid + "/parts_lists.json", data => {
      jsonData = data
      makeLis(jsonData);
    });
  }  

  function makeLis(jsonData) {
    $(".parts-lists").empty()
    jsonData.forEach( pl => {
      var newPl = new PartsList(pl);
      var newPlString = newPl.toString()
      $(".parts-lists").append(newPlString)
    });
  }
  
  $(".js-sort").on('click', function(){
    jsonData.sort((a,b) => {
      var cpuCompare = a['cpu'].localeCompare(b['cpu'])
      if (cpuCompare == 0) {
        return a['name'].localeCompare(b['name'])
      } 
        return cpuCompare
    });
    makeLis(jsonData);
  });

});
