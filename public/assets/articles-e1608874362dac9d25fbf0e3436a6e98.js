$( document ).ready(function() {
  // Handler for .ready() called.
/обмежений доступ до articles (js)/
  $(".sign_out").click(function() {
    alert("You are not authorized to access this page.")
  });

/new-edit-universal/
  $("body").on('click', ".save_article", function() {
    var variable_new = $(this).closest("form").serialize();
 $.ajax({
      url: "articles",
      type: "post",
      data: variable_new,
      success: function(data){
        $('#articles_form').remove();
        $('#error_explanation').remove();
        $("#new_article").append(data);
      }
    });
    return false;
    });

});
