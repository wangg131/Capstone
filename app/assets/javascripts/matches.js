// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.
// // You can use CoffeeScript in this file: http://coffeescript.org/
//
$(function() {

  var profiles = $('.profile');
  var posts = $('.post');

  var first_profile = profiles[0];
  var first_post = posts[0];

  if 
  $(first).show();


  $(".yes").click(function(event) {
    event.preventDefault();
    var button = this;
    var post = button.parents(".posts");
    var profile = button.parents(".profile");

    if(profile){
      $.ajax('/matches', {
        type: "POST",
        data: {
        profile_id: first.id,
        approved: true
        },
        success: hideProfileOrPost // callback to this function on success
      });
    } else if(post) {


    }
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
//   function hideProfileOrPost(data) {
//
//     for (var i = 0; i < data.length; i++) {
//       artist_title = data[i].artist + ": " + data[i].title;
//       url = data[i].url;
//       var anchor = $('<a></a>');
//       anchor.text(artist_title);
//       anchor.prop('href', url);
//       var p_tag = $('<p></p>');
//       p_tag.append(anchor);
//       $('.results').append(p_tag);
//     }
//     return data;
//     // note-to-self: return artist will have console.log(formatData(data)); inside success function to be only the artist
//   }
//
//   function displayResults(data) {
//     var url = $(this)[0].url; // local v url to hold prop
//     // if the user decided to retrieve a random song
//     if(url === "/rando") {
//       $( ".results" ).addClass( "jamz-background" );
//       $('.results').removeClass("no-results-photo");
//
//       if ($('.results').is(':empty')) {
//         formatData(data.sort( randOrd).slice(0,10));
//       } else {
//         // '.empty().append()' prevents new calls for random songs to be appended on top of the old list
//         $('.results').empty().append(formatData(data.sort(randOrd).slice(0,10)));
//       }
//     // if there were no prior results
//     } else if ( $('.results').is(':empty')) {
//         if (data.length > 0) {
//
//           formatData(data);
//           $( ".results" ).addClass( "jamz-background" );
//           $('.results').removeClass("no-results-photo");
//
//         } else {
//           // this adds a photo if invalid search term & no prior results
//           $( ".results" ).empty().addClass( "no-results-photo" ).append("<h2>Oops. No jamz from that artist were found.</h2>");
//         }
//     // if there are prior results, this prevents new search results from appending on top of the old ones
//     } else {
//       // if the new data gave results
//       if (data.length > 0) {
//         $('.results').removeClass("no-results-photo");
//         $('.results').empty().append(formatData(data));
//         $( ".results" ).addClass( "jamz-background" );
//       } else {
//         // if there were prior results and the new data gave 0 results
//         $( ".results").empty().addClass( "no-results-photo").append("<h2>Oops. No jamz from that artist were found.</h2>");
//       }
//     }
//   }
//
//     // for making the results for a random song to actually be random
//     function randOrd(){
//       return (Math.round(Math.random())-0.5);
//     }
//
// });
