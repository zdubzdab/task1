$(document).ready(function(){$("#rating").raty({path:"/assets/",readOnly:!0,score:function(){return $(this).attr("data-score")}}),$("#star-rating").raty({path:"/assets/",readOnly:!1,scoreName:"raiting[value]",hints:["bad","poor","regular","good","gorgeous"]})});