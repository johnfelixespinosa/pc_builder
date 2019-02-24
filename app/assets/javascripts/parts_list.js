console.log("parts_list.js loaded")

$(function(){ 
  let id = parseInt($('#user').attr("data-user_id"))
  console.log("id:", id)
  
  $.get("/users/" + id + "/parts_lists.json", function(data){
  console.log("this:", this)
  console.log("data:", data)

    // var data = $(this).data;
    // console.log("id:", data)

    // var url = this.url
    // console.log("url:", url)
    // var items = [];
    // $.each( data, function( key, val ) {
    //   items.push( "<li id='" + key + "'>" + val + "</li>" );
    // });
   
    // $( "<ul/>", {
    //   "class": "my-new-list",
    //   html: items.join( "" )
    // }).appendTo( "body" );
  });
});
