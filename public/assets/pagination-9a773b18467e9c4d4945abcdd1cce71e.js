(function() {
  $(function() {
    return $("body").on('click', ".pagination a", function() {
      $('#pagination_user').html('Page is loading...');
      $.get(this.href, null, null, 'script');
      return false;
    });
  });

}).call(this);
