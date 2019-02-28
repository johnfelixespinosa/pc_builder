$(".parts_lists").ready(function() {
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

  partsList.prototype.toString = function() {
    return HandlebarsTemplates['parts_lists/parts_list'](this)
  };

  $(function(){ 
    var uid = parseInt($('#user').attr("data-user_id"))
    console.log("userId:", uid)
    
    $.get("/users/" + uid + "/parts_lists.json", data => {
    console.log("this:", this)
    console.log("data:", data)

    data.forEach( parts_list => {
      var new_pl = new partsList(parts_list);
      var new_pl_string = new_pl.toString()
      $(".parts-lists").append(new_pl_string)
    });

    $(".js-sort").on('click', function(){
      data.sort((b,a) => (a.cpu < b.cpu) ? 1 : ((b.cpu < a.cpu) ? -1 : 0));
      console.log(data)
      $(".parts-lists").empty()
      data.forEach( parts_list => {
        var new_pl = new partsList(parts_list);
        var new_pl_string = new_pl.toString()
        $(".parts-lists").append(new_pl_string)
      });
      
    });


    });
  });
});