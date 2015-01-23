$( document ).ready(function() {
  // Handler for .ready() called.
/create/
  $("body").on('click', ".button_create_comment", function() {
    var variable_new = $(this).closest("form").serialize();
 $.ajax({
      url: "/articles/34/comments",
      type: "post",
      data: variable_new,
    });
    return false;
    });

});
