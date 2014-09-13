$( document ).ready(function() {
  // Handler for .ready() called.
  $("body").on('click', ".save", function() {
    var values = $(this).closest(".new_user").serialize();
 $.ajax({
      url: "users",
      type: "post",
      data: values,
      success: function(data){
        $('#new_task').remove();
        $('#new_link').show();
        
      },
      error: function(){
        $('#new_task').hide().after('.new_user');
        
      },
    });
    return false;
    });
});




