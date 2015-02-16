$(document).ready ->

# обмежений доступ до articles (js)
$(document).ajaxError (e, xhr, settings) ->
  if xhr.status == 401
     alert "You are not authorized to access this page."
  return

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






