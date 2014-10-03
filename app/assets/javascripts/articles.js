$( document ).ready(function() {
  // Handler for .ready() called.
/new/
  $("body").on('click', ".save_article", function() {
    var value = $(this).closest(".new_article").serialize();
 $.ajax({
      url: "articles",
      type: "post",
      data: value,
      success: function(da){
        $('#articles_form').remove();
        $('#link_to_create_a').show();
        $("#new_article").append(da);
      }
    });
    return false;
    });
  

/delete/
  $('body').on('ajax:success', '.delete_article', function() {
      $(this).closest('tr').fadeOut();
  });

});