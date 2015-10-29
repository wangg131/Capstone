// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.
// // You can use CoffeeScript in this file: http://coffeescript.org/
//
$(document).ready(function() {
  $(function() {
    var posts = $('.post');
    var first = posts[0];
    $(first).show();
    $('.you').hide();

    $(".yes-post").click(function(event) {
      event.preventDefault();
      var button = this;
      var post = $(button).parents('.post');
      $.ajax('/seeker_post_match', {
        type: "POST",
        data: {
        post_id: $(post).attr('id'),
        bool: true
        },
        success: function(data) {
          if(data["message"] == "hey"){
            alert( "It's a match! You can start messaging them now or keep searching.");
            hidePost(post);
            nextPost(post);
          }else {
            hidePost(post);
            nextPost(post);
          }
        }
      });
    });

    $(".no-post").click(function(event) {
      event.preventDefault();
      var button = this;
      var post = $(button).parents('.post');
      $.ajax('/seeker_post_match', {
        type: "POST",
        data: {
        post_id: $(post).attr('id'),
        bool: false
        },
        success: function() {
          hidePost(post);
          nextPost(post);
        }
      });
    });

    // given an array of posts, find the index of the current One
    // show next post by index
    function nextPost(post){
      var index = $(posts).index(post);
      $(posts[index+1]).show();
      if(posts[index+1] === undefined){
          $('.you').show();
      }
    }

    function hidePost(post) {
      $(post).hide();
    }
  });
});
