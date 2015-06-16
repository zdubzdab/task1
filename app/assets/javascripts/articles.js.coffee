$ ->
# обмежений доступ до articles (js)
  $(document).on 'ajax:error', (e, xhr, settings) ->
    if xhr.status == 401
       alert "You are not authorized to access this page."

# new-edit-universal
  $("body").on "click", ".save_article", ->
    variable_new = $(this).closest("form").serialize()
    $.ajax
      url: "articles"
      type: "post"
      data: variable_new
      beforeSend: (event, xhr, settings) ->
        $("#articles_form").remove()
        $("#error_explanation").remove()
      success: (data) ->
        $(".new_article").append data
        $(".edit_article").append data

  $(".delete_article").click ->
    current_article = $(this).parents("tr")
    if confirm "Are you sure?"
      $.ajax
        type: "POST"
        url: $(this).attr('delete_article_path')
        data: {"_method":"delete"}
        complete: (data) ->
          current_article.fadeOut(200)









