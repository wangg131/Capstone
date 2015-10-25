// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.
// // You can use CoffeeScript in this file: http://coffeescript.org/
//
$(function() {

  var profiles = $('.profile');
  var posts = $('.post');

  var first = profiles[0];
  $(first).show();


  $(".yes_profile").click(function(event) {
    event.preventDefault();
    var button = this;
    var post = button.parents(".posts");
    var profile = button.parents(".profile");

      $.ajax('/matches', {
        type: "POST",
        data: {
        profile_id: first.id,
        approved: true
        },
        success: hideProfileOrPost // callback to this function on success
    });
  });

  // function ajax_callback(url, method) {
  //   $.ajax(url, {
  //     type: method,
  //     success: displayResults // callback to this function on success
  //   });
  // }

   function hideProfileOrPost() {
    //  $this.hide();
   }
});
