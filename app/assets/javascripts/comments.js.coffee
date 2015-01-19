$(document).ready ->
  
  # create
  $("body").on "click", ".button_create_comment", ->
    variable_new = $(this).closest("form").serialize()
    $.ajax
      url: "/articles/43/comments"
      type: "post"
      data: variable_new
      false