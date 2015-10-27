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
              if(profiles[index+1] === undefined){
                 $('.you').show();

              }
          // }
        }
      });
    });

    // var yay = $('.profile:last-child');
    // console.log(profiles[3]);
    // console.log(yay === profiles[3]);
    // console.log($('.profile:last-child')===profiles[4]);
    // console.log(yay);
    // document.getElementById("item1").nextSibling.innerHTML;

//         for(index=0; index<profiles.length; index++){
//           var meep = links[i];
//  if (link.nextSibling && link.nextSibling.nodeName == "DIV") {
//      alert("Next sibling is DIV! " + link.innerHTML);
//  }
//           if(profiles[index] === profiles[profiles.length-1]){
//         if($(profiles).nextSiblingis(':last-child')){
//           console.log($(profiles).is(':last-child'));
//           $( ".profile" ).append( "<p>Test</p>" );
//         } else {
//           $(profiles[index+1]).show();
//         }

    // }else{
    //
    // }
  //}


    function hideProfileOrPost(profile) {
      $(profile).hide();
    }
  });
});
