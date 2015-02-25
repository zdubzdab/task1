$( document ).ready(function() {

/average rate/
  $('#rating').raty({
    path: '/assets/',
    readOnly: true,
    score: function() {
          return $(this).attr("data-score");
    }
  });

/vote/
  $('#star-rating').raty({
    path: '/assets/',
    scoreName: 'raiting[value]',
    hints       : ['bad', 'poor', 'regular', 'good', 'gorgeous']
  });


  });