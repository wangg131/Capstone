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
      $.ajax('/matches', {
        type: "POST",
        data: {
        post_id: $(post).attr('id'),
        approved: true
        },
        success: function() {
          hidePost(post);
          nextPost(post);
        }
      });
    });

    $(".no-post").click(function(event) {
      event.preventDefault();
      var button = this;
      var post = $(button).parents('.post');
      $.ajax('/matches', {
        type: "POST",
        data: {
        post_id: $(post).attr('id'),
        approved: false
        },
        success: function(data) {
          if(data["created"] === 'true'){


          }else {
          hidePost(post);
          nextPost(post);
        }
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
