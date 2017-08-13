// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function() {
  // Add position of the movie in the list to span with "position" class
  $.each($('.movie-list-item'), function(index, value) {
    console.log($(value));
    $(value).find('.position').text(index + 1 + '.');
  });
});
