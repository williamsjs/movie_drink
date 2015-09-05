
function hideMovie() {
  $('.delete-movie').on('click', function() {
    $(this).closest('.card').fadeOut(2000);
  });
}

function disableButton() {
  $('#new_movie').submit(function() {
    $('form button').attr("disabled", true);
    return true;
  });
}

$(hideMovie);
$(disableButton);
