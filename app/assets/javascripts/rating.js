function set_stars(form_id, stars) {
  for (var i = 1; i <= 5; i++) {
    if(i <= stars){
      $('#' + form_id + '_' + i).removeClass('glyphicon-star-empty');
      $('#' + form_id + '_' + i).addClass('glyphicon-star');
    }
    else {
      $('#' + form_id + '_' + i).removeClass('glyphicon-star');
      $('#' + form_id + '_' + i).addClass('glyphicon-star-empty');
    }
  }
}

function set_rated(form_id) {
  for (var i = 1; i <= 5; i++) {
    $('#' + form_id + '_' + i).addClass('rated');  
  }
}

$(function() {

  var value = ("; " + document.cookie).split("; user_role=").pop().split(";").shift();

  if(value!='guest') {
    $('.star-rating').click(function() {
      var star = $(this);
      var stars = $(this).attr('data-stars');
      var form_id = $(this).attr('data-form-id');

      set_stars(form_id, stars);
      set_rated(form_id);

      $('#' + form_id + '_stars').val(stars);

      $.ajax({
        type: 'post',
        url: $('#' + form_id).attr('action'),
        data: $('#' + form_id).serialize()
      });

/* MUST DO ON PREV AJAX SUCCESS */
      var ajax_path = $('#' + form_id).attr('data-ajax-path');
      $.ajax({
        type: 'get',
        url: ajax_path,
        dataType: 'JSON',
        success: function(data, textStatus, xhr) {
          if(data.stars) {
            $('#' + form_id + '_number').text(data.stars);
          }
        }
      }); 
    });
  }

  $('.rating-form').each(function() {
    var form_id = $(this).attr('id');
    var ajax_path = $(this).attr('data-ajax-path');
    $.ajax({
      type: 'get',
      url: ajax_path,
      dataType: 'JSON',
      success: function(data, textStatus, xhr) {
        if(data.user_stars) {
          set_stars(form_id, data.user_stars);
          set_rated(form_id);
          $('#' + form_id + '_number').text(data.stars);
        }
        else if(data.stars) {
          set_stars(form_id, data.stars);
          $('#' + form_id + '_number').text(data.stars);
        }
      }
    });
  });
});