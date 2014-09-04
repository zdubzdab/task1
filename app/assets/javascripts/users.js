JQuery(function($){
  $(".aaa").click(function() {
 confirm("Are you sure?")

      });

    
  });



  JQuery(function($){
  $(".button_submit").click(function() {
  var current_user_tr = $(this).parents("tr")[0];
    if(confirm("Are you sure?")){
      $.ajax({
        url: "/users/" + $(current_user_tr).attr("data-user_id"),
        type:"POST",
        data: { _metod: "DELETE" },
        success: function() {
          $(currrent_user_tr).fadeOut(200);
        }
      });
    };
    
  });