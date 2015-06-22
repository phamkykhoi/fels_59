$(document).ready(function() {

  numberMax = parseInt($('.result:last').attr('number'));

  $('.realtime').html("1/"+(numberMax + 1));

  $( "#next" ).click(function() {
    number = parseInt($('.result:visible').attr('number'));
    if (number < numberMax) {
      $('.result').hide();
      number = number + 1;
      $('.result').eq(number).show();
      $('.realtime').html((number + 1).toString()+"/"+(numberMax + 1));
    };
  });

  $( "#prev" ).click(function() {
    number = parseInt($('.result:visible').attr('number'));
    if (number > 0) {
      $('.result').hide();
      number = number - 1;
      $('.result').eq(number).show();
      $('.realtime').html((number + 1).toString()+"/"+(numberMax + 1));
    };
  });

});
