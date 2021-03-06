// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.
// // You can use CoffeeScript in this file: http://coffeescript.org/
//
$(document).ready(function() {
  $(function() {
    var profiles = $('.profile');
    var first = profiles[0];
    $(first).show();
    $('.you').hide();

    $(".yes-profile").click(function(event) {
      event.preventDefault();
      var button = this;
      var profile = $(button).parents('.profile');
      $.ajax('/host_profile_match', {
        type: "POST",
        data: {
        profile_id: $(profile).attr('id'),
        bool: true
        },
        success: function(data) {
          if(data["message"] === "hey"){
            alert( "It's a match! You can start messaging them now or keep searching.");
            hideProfile(profile);
            nextProfile(profile);
          }else{
          hideProfile(profile);
          nextProfile(profile);
          }
        }
      });
    });

    $(".no-profile").click(function(event) {
      event.preventDefault();
      var button = this;
      var profile = $(button).parents('.profile');

      $.ajax('/host_profile_match', {
        type: "POST",
        data: {
        profile_id: $(profile).attr('id'),
        bool: false
        },
        success: function() {
          hideProfile(profile);
          nextProfile(profile);
        }
      });
    });

    // given an array of profiles, find the index of the current One
    // show next profile by index
    function nextProfile(profile){
      var index = $(profiles).index(profile);
      $(profiles[index+1]).show();
      if(profiles[index+1] === undefined){
        $('.you').show();
      }
    }

    function hideProfile(profile) {
      $(profile).hide("slow");
    }
  });
});
