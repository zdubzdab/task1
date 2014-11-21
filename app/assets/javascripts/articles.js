$( document ).ready(function() {
  // Handler for .ready() called.
/обмежений доступ до articles (js)/
  $(".sign_out").click(function() {
    alert("You are not authorized to access this page.")
  });

/new/
  $("body").on('click', ".save_article", function() {
    var values = $(this).closest(".new_article").serialize();
 $.ajax({
      url: "articles",
      type: "post",
      data: values,
      success: function(data){
        $('#articles_form').remove();
        $('#error_explanation').remove();
        $("#new_article").append(data);
      }
    });
    return false;
    });
  
/edit/
  $("body").on('click', ".save_editarticle", function() {
    var val = $(this).closest(".edit_article").serialize();
    $.ajax({
      url: "articles",
      type: "post",
      data:  val,
      success: function(data){
        $('#articles_form').remove();
        $('#error_explanation').remove();
        $("#new_article").append(data);
      }
    });
    return false;
    });


});