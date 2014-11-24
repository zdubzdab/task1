$( document ).ready(function() {
  // Handler for .ready() called.
/new/
  $("body").on('click', ".save", function() {
    var values = $(this).closest(".new_user").serialize();
 $.ajax({
      url: "users",
      type: "post",
      data: values,
      success: function(data){
        $('#new_task').remove();
        $('#new_link').show();
        $(".new_user").append(data);
      }
    });
    return false;
    });

/delete/
    $('body').on('ajax:success', '.delete_user', function() {
        $(this).closest('tr').fadeOut();
    });
/edit/
    $('body').on('ajax:success', '.edit_user', function() {
        $(this).closest('tr').fadeOut();
    });
});
