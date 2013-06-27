$(document).ready(function() {
  $('form').on('submit', function(e){
    e.preventDefault();
    $.ajax({
      type: 'post',
      url: '/urls',
      data: {original_url: $('form input').val()}
    }).done(function(message){
      console.log(message);
      $('#links').html(message);
    });
  });
});
