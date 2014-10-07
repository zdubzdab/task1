$( document ).ready(function() {
  // Handler for .ready() called.
/new/
  $("body").on('click', ".save_article", function() {
    var values = $(this).closest(".new_article").serialize();
 $.ajax({
      url: "articles",
      type: "post",
      data: values,
      success: function(data){
        $('#articles_form').remove();
        $('#link_to_create_a').show();
        $("#new_article").append(data);
      }
    });
    return false;
    });
  

/delete/
  $('body').on('ajax:success', '.delete_article', function() {
      $(this).closest('tr').fadeOut();
  });

});