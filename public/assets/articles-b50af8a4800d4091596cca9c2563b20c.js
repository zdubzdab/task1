(function() {
  $(function() {
    $(document).on('ajax:error', function(e, xhr, settings) {
      if (xhr.status === 401) {
        return alert("You are not authorized to access this page.");
      }
    });
    return $("body").on("click", ".save_article", function() {
      var variable_new;
      variable_new = $(this).closest("form").serialize();
      return $.ajax({
        url: "articles",
        type: "post",
        data: variable_new,
        beforeSend: function(event, xhr, settings) {
          $("#articles_form").remove();
          return $("#error_explanation").remove();
        },
        success: function(data) {
          $(".new_article").append(data);
          return $(".edit_article").append(data);
        }
      });
    });
  });

}).call(this);
