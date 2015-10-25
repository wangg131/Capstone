// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.
// // You can use CoffeeScript in this file: http://coffeescript.org/
//
$(function() {

  var profiles = $('.profile');
  var first = profiles[0];
  $(first).show();

  $(".yes-profile").click(function(event) {
    event.preventDefault();
    var button = this;
    var profile = $(button).parents('.profile');

      $.ajax('/matches', {
        type: "POST",
        data: {
        profile_id: first.id,
        approved: true
        },
        success: function() {
          hideProfileOrPost(profile);
          // given an array of profiles, find the index of the current One
          // show next profile by index
          var index = $(profiles).index(profile);
          $(profiles[index+1]).show();
        }
    });
  });

   function hideProfileOrPost(profile) {
     $(profile).hide();
  }
});
