$(document).ready(function(){

  $('#new_comment').on('submit', function(ev){
    ev.preventDefault()
    $.post({
      url: $(ev.target).attr('action'),
      data: new FormData(ev.target),
      processData: false,
      contentType: false,
      success: function(data) {
        console.log(data)
        $('#link_comments').prepend('<div class="row col-md-offset-1 comment" id="comment_' + data.id + '"><p>' + data.body + '</p><small> By ' + data.user + ' on ' + data.created_at +'</small><hr>')
        document.getElementById('new_comment').reset();
        $('#new_comment input[type="submit"]').prop('disabled', false);
      }
    })
  })


})
