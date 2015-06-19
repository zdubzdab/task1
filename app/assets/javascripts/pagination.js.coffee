ready = ->

  $("body").on 'click', ".pagination a", ->
    $('#pagination_user').html('Page is loading...')
    $.get(this.href, null, null, 'script')
    return false

$(document).ready(ready)
$(document).on('page:load', ready)