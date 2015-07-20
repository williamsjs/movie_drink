
function hideMovie() {
  $('.delete-movie').on('click', function() {
    $(this).closest('.card').fadeOut(2000);
  });
}


$(hideMovie);
