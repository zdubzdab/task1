(function() {
  $(function() {
    $(".button_create_comment").click(function() {
      var variable_new;
      variable_new = $(this).closest("form").serialize();
      return $.ajax({
        url: $(this).attr('create_comment_path'),
        type: "post",
        data: variable_new,
        success: function(data) {
          $('.text_field_commenter').val("");
          return $("#new_comment").append(data);
        }
      });
    });
    return $("#comments_link").click(function() {
      return $("#comment_section").toggle();
    });
  });

}).call(this);
