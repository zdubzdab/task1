$('#new_task').remove();
$('#new_link').show();
$("<%= escape_javascript(render @user) %>").appendTo("#table");