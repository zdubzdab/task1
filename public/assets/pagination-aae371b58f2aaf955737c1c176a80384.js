(function(){var n;n=function(){return $("body").on("click",".pagination a",function(){return $("#pagination_user").html("Page is loading..."),$.get(this.href,null,null,"script"),!1})},$(document).ready(n),$(document).on("page:load",n)}).call(this);