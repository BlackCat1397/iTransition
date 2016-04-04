function toggle_liked(form_id) {
  $('#' + form_id + '_icon').toggleClass('rated');
  var likes = parseInt($('#' + form_id + '_number').text());
  if (likes === NaN)
    likes = 0;
  if ($('#' + form_id + '_icon').hasClass('rated')) {
    $('#' + form_id + '_number').text(likes+1);
  }
  else {
    $('#' + form_id + '_number').text(likes-1);
  }    
}

$(function() {

  var value = ("; " + document.cookie).split("; user_role=").pop().split(";").shift();

  if(value!='guest') {
    $('.likes').click(function() {
      var form_id = $(this).attr('data-form-id');
      toggle_liked(form_id);

      $.ajax({
        type: 'post',
        url: $('#' + form_id).attr('action'),
        data: $('#' + form_id).serialize()
      });
    });
  }

  $('.likes-form').each(function() {
    var form_id = $(this).attr('id');
    var ajax_path = $(this).attr('data-ajax-path');
    $.ajax({
      type: 'get',
      url: ajax_path,
      dataType: 'JSON',
      success: function(data, textStatus, xhr) {
        if(data.user_like) {
          $('#' + form_id + '_icon').toggleClass('rated');
          $('#' + form_id + '_number').text(data.likes);
        }
        else if(data.likes != undefined) {
          alert(data.likes);
          $('#' + form_id + '_number').text(data.likes);
        }
      }
    });
  });
});