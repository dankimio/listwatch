// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function() {
  addPositionToMovies();
  addCheckboxHandler();
});

// Add position of the movie in the list to span with "position" class
function addPositionToMovies() {
  $.each($('.movie-list-item'), function(index, value) {
    console.log($(value));
    $(value).find('.position').text(index + 1 + '.');
  });
}

function addCheckboxHandler() {
  var checkboxes = $('.movie-list-item input:checkbox')
  // Remove existing handlers
  checkboxes.off('change');
  // Submit rating on checkbox value change
  checkboxes.on('change', checkboxHandler);
}

var checkboxHandler = function(event) {
  event.preventDefault();
  // Get input that triggered the event
  var target = event.target;
  // Get form that the input belongs to
  var form = $(target).parents('form');
  // Submit form remotely
  form.trigger('submit.rails');
}
