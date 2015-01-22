$(document).ready ->
# обмежений доступ до articles (js)
  $(".sign_out").click ->
    alert "You are not authorized to access this page."

# new-edit-universal
  $("body").on "click", ".save_article", ->
    variable_new = $(this).closest("form").serialize()
    $.ajax
      url: "articles"
      type: "post"
      data: variable_new
      success: (data) ->
        $("#articles_form").remove()
        $("#error_explanation").remove()
        $("#new_article").append data

# delete
  $("body").on "click", ".delete_article", ->
    $.ajax
      url: "articles"
      type: "post"
      data: 
        _method:"delete"


