$(document).ready ->
  
  # create
  $("body").on "click", ".button_create_comment", ->
    variable_new = $(this).closest("form").serialize()
    $.ajax
      url: $(this).attr('create_comment_path')
      type: "post"
      data: variable_new
      success: (data) ->
        $('.text_field_commenter').val("")
        $("#new_comment").append data
  # destroy

$("body").on "click", "#delete_comment", ->
  $(this).closest("ol").fadeOut()
